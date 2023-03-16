CREATE SCHEMA MinimarketJose;

USE MinimarketJose;

CREATE TABLE GananciasAnuales(
ganancias_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
total DOUBLE
);

CREATE TABLE Proveedores(
proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombreProducto VARCHAR (35),
cantidadProducto INTEGER (10),
precioProveedor INTEGER (10),
fechaCompra DATE,
totalPro DOUBLE 
);

CREATE TABLE Productos(
productos_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
cantidadProducto INTEGER (15),
precioProducto INTEGER (20),
productoNombre VARCHAR (40),
totalProductos DOUBLE 
);

CREATE TABLE TiposProductos(
tiposProductos_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
categoriaProducto VARCHAR (40),
nombreDeProducto VARCHAR (40)
);

CREATE TABLE Ingreso(
ingresos_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
productoVenta VARCHAR (30),
precioProducto INTEGER (10),
cantidadProducto INTEGER (10),
fechaVenta DATE,
totalIngreso DOUBLE
);

CREATE TABLE Egreso(
egresos_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
gastosVarios INTEGER (10),
remuneraciones INTEGER (10),
totalEgreso DOUBLE 
); 

#_________________________________________________ creación de foreign key (manda un error 1072)

ALTER TABLE GananciasAnuales
ADD FOREIGN KEY (productos_id) REFERENCES Productos(productos_id);

ALTER TABLE GananciasAnuales
ADD FOREIGN KEY (ingresos_id) REFERENCES Ingreso(ingresos_id);

ALTER TABLE GananciasAnuales
ADD FOREIGN KEY (egresos_id) REFERENCES Egreso(egresos_id);

ALTER TABLE TiposProductos
ADD FOREIGN KEY (productos_id) REFERENCES Producto(productos_id);

ALTER TABLE Ingreso
ADD FOREIGN KEY (productos_id) REFERENCES Producto(productos_id);

ALTER TABLE Egreso
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id);

ALTER TABLE Egreso
ADD FOREIGN KEY (productos_id) REFERENCES Producto(productos_id);

#___________________________________________________________________________________ Agregar columna

ALTER TABLE Proveedores
ADD totalPro DOUBLE NOT NULL;

#___________________________________________________________________________________ Borrar columna

ALTER TABLE Egreso
DROP COLUMN totalEgreso;

#___________________________________________________________________________________ 

INSERT INTO Productos (cantidadProducto, precioProducto, productoNombre) 
VALUES (30, 4.000, 'confort'),
(3, 2.500 , 'cereal trix'),
(12, 5.000, 'bandeja huevos'),
(3, 2.300, 'fiestos espagueti'),
(3, 4.780, 'leche colum');


INSERT INTO TiposProductos (categoriaProducto, nombreDeProducto)
VALUES ('despensa', 'pastas'),
('lacteos','leche en polvo'),
('verduleria','verduras frescas'),
('panaderia','tortas');

#___________________________________________________________________________________ Que traiga todo lo que contenga 'a'

SELECT * FROM Productos WHERE productoNombre LIKE '%a%';

#___________________________________________________________________________________ Que traiga dato especifico de la tabla "Productos"

SELECT * FROM Productos WHERE productos_id IN (2, 5);

#___________________________________________________________________________________ Fución entre la tabla "producto" y "TiposProductos"


SELECT Productos.producto_id, TiposProductos.categoriaProducto
FROM Productos RIGHT JOIN TiposProductos
ON Productos.producto_id = TiposProductos.categoriaProducto
ORDER BY TiposProductos.categoriaProducto ASC;

#___________________________________________________________________________________ Ganancias Anuales


SELECT SUM(Ingreso.totalIngreso) - SUM(Egreso.totalEgreso) AS Ganancias_totales
FROM Ingreso, Egreso;

#___________________________________________________________________________________ Mostar tablas

SELECT * FROM TiposProductos;

SELECT * FROM Productos;




