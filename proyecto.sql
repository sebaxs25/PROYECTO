create database proyectointegrador;

create table producto (
	id_producto int,
	constraint PK_id_producto primary key (id_producto),
	id_vendedorFK int,
	constraint FK_id_vendedor foreign key (id_vendedorFK) references vendedor (id_vendedor),
 	nom_producto varchar (30),
	descrip_produc text,
	precio int, 
	categoria_proc varchar (20),
);
alter table producto alter column precio smallint;
alter table producto drop column descrip_produc;
drop table producto;

create table cliente (
	id_cliente int, 
	constraint PK_id_cliente primary key (id_cliente),
	nom_cliente varchar (15) not null,
	ape_cliente varchar (30)  not null,
	direccion varchar (30)  not null, 
	cuidad varchar (30)  not null, 
	pais varchar (20)  not null,
	correo varchar (35) ,
	constraint UQ_cliente_correo unique (correo),
	telefono int
);

create table vendedor ( 
	id_vendedor int,
	constraint PK_id_vendedor primary key (id_vendedor),
	nom_vendedor varchar (15) not null,
	ape_vendedor varchar (30)  not null,
	direccion varchar (30)  not null, 
	ciudad varchar (30)  not null, 
	pais varchar (20)  not null,
	correo varchar (35) ,
	constraint UQ_vendedor_correo unique (correo),
	telefono int
);

create table envio (
	cod_envio int,
	constraint PK_cod_envio primary key (cod_envio),
	id_productoFK int, 
	constraint FK_id_producto foreign key (id_productoFK) references producto (id_producto),
	id_clienteFK int,
	constraint FK_id_cliente foreign key (id_clienteFK) references cliente (id_cliente)
);

bulk insert cliente from 'C:\Users\sebas\Downloads\cliente - Hoja 1.tsv' with (firstrow = 2);
bulk insert vendedor from 'C:\Users\sebas\Downloads\vendedor - Hoja 1.tsv'with (firstrow = 2);
bulk insert producto from 'C:\Users\sebas\Downloads\producto - Hoja 1.tsv'with (firstrow = 2);
bulk insert envio from 'C:\Users\sebas\Downloads\envio - Hoja 1.tsv'with (firstrow = 2);
select * from producto;

delete from producto;