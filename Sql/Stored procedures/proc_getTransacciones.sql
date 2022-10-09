USE [ParkingLiteDB]
GO

/****** Object:  StoredProcedure [dbo].[proc_getTransacciones]    Script Date: 8/10/2022 9:25:04 p. m. ******/
DROP PROCEDURE [dbo].[proc_getTransacciones]
GO

/****** Object:  StoredProcedure [dbo].[proc_getTransacciones]    Script Date: 8/10/2022 9:25:04 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[proc_getTransacciones]
	 @IdLote int,
	 @Fecha datetime 
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT 
		vt.Guid,
		vt.Placa, 
		v.Clase,	
		vt.Fecha FechaEntrada,	
		vt2.Fecha FechaSalida,
		DATEDIFF(MINUTE, vt.Fecha, vt2.Fecha) as Tiempo,
		vt2.Valor as Valor
	FROM VehiculoTransaccion vt 
	LEFT JOIN Vehiculo v on v.Placa = vt.Placa
	LEFT JOIN VehiculoTransaccion vt2 on vt2.Guid = vt.Guid and vt2.TipoTransaccion = 'Salida'
	WHERE vt.TipoTransaccion = 'Entrada'
	and vt.IdLote = @IdLote 
	and vt.Fecha BETWEEN @Fecha + ' 00:00:00' and @Fecha + ' 23:59:59'
END
GO


