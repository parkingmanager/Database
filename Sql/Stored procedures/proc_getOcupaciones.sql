USE [ParkingLiteDB]
GO

/****** Object:  StoredProcedure [dbo].[proc_getOcupaciones]    Script Date: 8/10/2022 9:24:37 p. m. ******/
DROP PROCEDURE [dbo].[proc_getOcupaciones]
GO

/****** Object:  StoredProcedure [dbo].[proc_getOcupaciones]    Script Date: 8/10/2022 9:24:37 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[proc_getOcupaciones]
	 @IdLote int,
	 @Fecha datetime 

AS
BEGIN

	SET NOCOUNT ON;

    -- Hours setting
	DECLARE @ListHours TABLE(Hour INT);
	INSERT INTO @ListHours (Hour)
	VALUES(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (16), (17), (18), (19), (20), (21), (22), (23); 

	WITH Balance AS (
		SELECT 
			ds.Indice, 
			m.Estado,		
			DATEPART(HOUR, m.Fecha) as Hora
		FROM EspacioDelimitado ds 
		JOIN Monitoreo m on m.IdEspacioDelimitado = ds.IdEspacioDelimitado
		WHERE ds.IdLote = @IdLote 
		and m.Fecha BETWEEN @Fecha + ' 00:00:00' AND @Fecha + ' 23:59:59'
	),
	Ocupaciones AS (
		SELECT 
			Indice,
			MAX(CAST(Estado AS INT)) as Estado,  
			Hora 
		FROM Balance
		GROUP BY Hora, Indice
	)
	SELECT 
		H.Hour Hora,
		CASE
			WHEN SUM(Estado) IS NULL THEN 0
			ELSE SUM(Estado)
		END as Ocupaciones	
	FROM @ListHours h
	LEFT JOIN Ocupaciones oc on oc.Hora = H.Hour
	GROUP BY H.Hour
	ORDER BY H.Hour
END
GO


