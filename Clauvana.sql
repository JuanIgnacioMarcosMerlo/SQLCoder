create database Clauvana;

use Clauvana;

create table Fechas (
    Fecha datetime primary key
);


create table Proveedores_Tela (
    Fecha datetime,
    Empresa varchar(20) not null,
    Direccion varchar(20) not null,
    Factura int not null,
    Id_Tela varchar(20) primary key,
    Color varchar(20) not null,
    Cantidad decimal(10,2) not null,
    PrecioXUnidad decimal(10,2) not null,
    Total decimal(10,2) not null,
    foreign key (Fecha) references Fechas(Fecha)
);

create table Proveedores_Avios (
    Fecha datetime,
    Empresa varchar(20) not null,
    Direccion varchar(20) not null,
    Factura int not null,
    Tipo_Avio varchar(20) primary key,
    Cantidad int not null,
    PrecioXUnidad decimal(10,2) not null,
    Total decimal(10,2) not null,
    foreign key (Fecha) references Fechas(Fecha)
);


create table Produccion_corte (
    Fecha datetime,
    Taller_Corte varchar(20) not null,
    Direccion varchar(20) not null,
    Id_Tela varchar(20),
    Id_Prenda varchar(20),
    Color varchar(20) not null,
    PrecioXUnidad decimal(10,2) not null,
    Cantidad int not null,
    Total decimal(10,2) not null,
    primary key (Fecha, Id_Tela, Id_Prenda),
    foreign key (Fecha) references Fechas(Fecha),
    foreign key (Id_Tela) references Proveedores_Tela(Id_Tela),
    foreign key (Id_Prenda) references Prenda(Id_Prenda)
);

create table Produccion_confeccion (
    Fecha datetime,
    Taller_Confeccion varchar(20) not null,
    Direccion varchar(20) not null,
    Id_Prenda varchar(20),
    Tipo_Avio varchar(20),
    PrecioXUnidad decimal(10,2) not null,
    Cantidad int not null,
    Total decimal(10,2) not null,
    primary key (Fecha, Id_Prenda, Tipo_Avio),
    foreign key (Fecha) references Fechas(Fecha),
    foreign key (Id_Prenda) references Prenda(Id_Prenda),
    foreign key (Tipo_Avio) references Proveedores_Avios(Tipo_Avio)
);

create table Prenda (
    Fecha datetime,
    Id_Prenda varchar(20) primary key,
    Stock_total int not null,
    foreign key (Fecha) references Fechas(Fecha)
);

create table Stock_Unitario (
    Fecha datetime,
    Id_Prenda varchar(20),
    Color varchar(20) not null,
    Stock_Unitario int not null,
    primary key (Fecha, Id_Prenda, Color),
    foreign key (Fecha) references Fechas(Fecha),
    foreign key (Id_Prenda) references Prendas(Id_Prenda)
);

create table Precio (
    Fecha datetime,
    Id_Prenda varchar(20),
    Precio_Mayorista decimal(10,2) not null,
    Precio_Minorista decimal(10,2) not null,
    primary key (Fecha, Id_Prenda), 
    foreign key (Fecha) references Fechas(Fecha),
    foreign key (Id_Prenda) references Prenda(Id_Prenda)
);

create table Clientes (
    Fecha_Facturacion datetime,
    Id_Cliente int primary key,
    Id_Facturacion int,
    Nombre varchar(20) not null,
    Apellido varchar(20) not null,
    DNI varchar(20) not null,
    Geolocalizacion varchar(20) not null,
    Celular varchar(15) null,
    Nombre_Transporte varchar(20) not null,
    foreign key (Fecha_Facturacion) references Fechas(Fecha)
);

create table Deudores (
    Fecha_Facturacion datetime,
    Id_Cliente int,
    Saldo_Deudor decimal(10,2) not null,
    primary key (Fecha_Facturacion, Id_Cliente),
    foreign key (Fecha_Facturacion) references Fechas(Fecha),
    foreign key (Id_Cliente) references Clientes(Id_Cliente)
);
