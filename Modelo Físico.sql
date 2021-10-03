drop database if exists Lanchonete;

create database if not exists Lanchonete;

use Lanchonete;

create table Lanchonete.Cliente(
	codigoCliente int auto_increment,
	nome varchar(60) not null,
	telefone varchar(13),
	enderecoLogradouro varchar(60),
	enderecoNumero varchar(6),
	enderecoBairro varchar(45),
	enderecoCidade varchar(45),
	primary key (codigoCliente)
);

create table Lanchonete.Pedido(
	codigoPedido int auto_increment,
	quantidade int not null,
	dataEmissao timestamp not null default current_timestamp on update current_timestamp,
	codigoStatus int,
	codigoCliente int,
	codigoEntregador int,
	primary key (codigoPedido)
);

create table Lanchonete.Sanduiche(
	codigoSanduiche int auto_increment,
 	nome varchar(45),
	preco decimal(4,2),
	codigoPedido int,
	primary key (codigoSanduiche)
);

create table Lanchonete.Entregador(
	codigoEntregador int auto_increment,
	nome varchar(60),
	telefone varchar(13),
	primary key (codigoEntregador)
);

create table Lanchonete.Status(
	codigoStatus int primary key,
	descricao varchar(15)
);

alter table Lanchonete.Pedido
add foreign key (codigoCliente) references Lanchonete.Cliente(codigoCliente),
add foreign key (codigoEntregador) references Lanchonete.Entregador(codigoEntregador),
add foreign key (codigoStatus) references Lanchonete.Status(codigoStatus);

alter table Lanchonete.Sanduiche
add foreign key (codigoPedido) references Lanchonete.Pedido(codigoPedido);

insert into Lanchonete.Status (codigoStatus, descricao) values (0, 'Em preparação');
insert into Lanchonete.Status (codigoStatus, descricao) values (1, 'Em entrega');
insert into Lanchonete.Status (codigoStatus, descricao) values (2, 'Entregue');

insert into Lanchonete.Cliente (nome, telefone, enderecoLogradouro, enderecoNumero, enderecoBairro, enderecoCidade)
values	('João da Silva', '41999500599', 'Avenida Getúlio Vargas', '700', 'Água Verde', 'Curtitiba'),
		('Maria Oliveira', '4132991234', 'Avenida Comendador Franco', '1209', 'Jardim Botânico', 'Curtitiba'),
        ('Helena Siqueira de Almeida', '4198761234', 'Rua Veneza', '26', 'Zona 04', 'Maringá'),
        ('Antônio Conceição Carneiro', '4199912345', 'XV de Novembro', '1001', 'Morro Alto', 'Guarapuava'),
        ('Bernardo Siqueira Mendes', '4132100987', 'Rua Teodomiro Furtado', '378', 'Xaxim', 'Curtitiba');

insert into Lanchonete.Entregador (nome, telefone)
values 	('Josimar Teobaldo Nassim', '41990092348'),
		('Mônica Taborda de Alencar', '41999775544'),
		('Hermes Lindomar Campos', '4198767890');

insert into Lanchonete.Pedido (quantidade, codigoStatus, dataEmissao, codigoCliente, codigoEntregador)
values	(2, 0, default, 5, 3), (1, 2, default, 4, 1), (3, 1, default, 1, 2), (2, 2, default, 2, 3), (4, 0, default, 3, 3),
        (2, 1, default, 3, 1), (5, 0, default, 5, 2), (1, 1, default, 1, 2), (3, 2, default, 4, 1), (1, 2, default, 5, 3);

insert into Lanchonete.Sanduiche (nome, preco, codigoPedido)
values 	('X-Salada', 4.50, 1), ('X-Bacon', 4.99, 3), ('Hot-Dog', 3.20, 5), ('Moda da Casa', 2.99, 7),
		('Misto Quente', 3.00, 8), ('X-Tudo', 8.50, 6), ('X-Salada', 4.50, 2), ('Hot-Dog', 4.50, 4);

select * from Lanchonete.Pedido where codigoStatus = 0;