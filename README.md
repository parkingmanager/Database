El proyecto Parking Manager se integra a través de 4 repositorios:

* [DataBase](https://github.com/parkingmanager/RestAPI)
* [RestAPI](https://github.com/parkingmanager/RestAPI)
* [Utils](https://github.com/parkingmanager/Utils)
* [ClientApp](https://github.com/parkingmanager/ClientApp)
# Database
Base de datos SQL Server de ejemplo para el uso de parking manager 

En la carpeta Restore del repositorio se encuentra el archivo ParkingLiteDB.bak, el cual contiene una base de datos de ejemplo de varios estacionamientos creados y parametrizados. para restaurar la base de datos se debe realizar el siguiente procedimiento. 

Requisitos:
  - SQL Server Management Studio

1. Sobre la carpeta Databases en  SQL Server Management Studio se pulsa click izquierdo, lo que desplegara un menu de opciones, se debe seleccionar la opción Restore Database, se abrirá una ventana de configuración de la restauración.
  
  ![img](https://github.com/parkingmanager/Database/blob/main/README_DATA/1.png)
  
  ![img](https://github.com/parkingmanager/Database/blob/main/README_DATA/2.png)
  
2. En la ventana de configuración de la restauración se debe seleccionar como fuente la opción Device y posteriormente abrir la ventana de configuración del archivo a restaurar 

  ![img](https://github.com/parkingmanager/Database/blob/main/README_DATA/3.png)
  
3. En el menu desplegable de Backup media Type se debe seleccionar la opción File, posteriormente se debe añadir un archivo de backup.

  ![img](https://github.com/parkingmanager/Database/blob/main/README_DATA/4.png)

4. Es importante tener en cuenta que el archivo ParkingLiteDB.bak debe descargarse del repositorio, una vez existe en el sistema de archivos local se debe seleccionar 

  ![img](https://github.com/parkingmanager/Database/blob/main/README_DATA/5.png)
  
5. Se verifica que el checkbox Restore este seleccionado y que la base de datos a restaurar debe tener el nombre ParkingLiteDB.

  ![img](https://github.com/parkingmanager/Database/blob/main/README_DATA/6.png)
  
6. Si el proceso de restauración fue correcto, sera posible encontrar la base de datos lista para su uso.  

  ![img](https://github.com/parkingmanager/Database/blob/main/README_DATA/7.png)
  
  
  
#### Visite los repositorios de [ClientApp](https://github.com/parkingmanager/ClientApp.git) y [RestAPI](https://github.com/parkingmanager/RestAPI.git) para poder correr el proyecto.
