create table estados(codigo varchar(2) primary key, nome varchar(100) not null unique);
create table clientes(id serial primary key, razao_social varchar(100) not null unique, estado_codigo varchar(2) not null references estados(codigo));
create table tipos_telefone(id serial primary key, nome varchar(100) not null unique);
create table cliente_telefone(cliente_id int not null references clientes(id), tipo_telefone_id int not null references tipos_telefone(id), numero varchar(50) not null unique,primary key(cliente_id, tipo_telefone_id));

insert into tipos_telefone(nome) values('Comercial'),('Residencial'),('Celular');
insert into estados values('SP', 'São Paulo'),('CE','Ceará');
insert into clientes(razao_social, estado_codigo) values('Empresa A','SP');
insert into clientes(razao_social, estado_codigo) values('Empresa B','CE');
insert into clientes(razao_social, estado_codigo) values('Empresa C','SP');
insert into cliente_telefone(cliente_id, tipo_telefone_id, numero) values(1, 1, '85999999991'),(1, 2, '85999999981'),(2, 1, '85999999992'),(2, 2, '85999999982'),(3, 1, '85999999993'),(3, 3, '85999999983');

select c.id, c.razao_social, ct.numero
from 
	clientes c 
left join 
	cliente_telefone ct ON c.id = ct.cliente_id
join
	estados e on c.estado_codigo = e.codigo
where
	e.codigo = 'SP';