--drop table ClienteAgenda;
drop table if exists TipoLancamento;
drop table if exists Metrica;
drop table if exists PedidoItem;
drop table if exists Pedido;
drop table if exists Lancamento;
drop table if exists Saldo;
drop table if exists ProdutoValorPadrao;
drop table if exists ProdutoValorCliente;
drop table if exists Produto;
drop table if exists Produtor;
drop table if exists Usuario;
drop table if exists Cliente;



create table Usuario (
    ----Id smallinteger identity(1,1) primary key,
    Id integer primary key AUTOINCREMENT,
    Nickname varchar(50) not null unique, -- constrainteger unique, 
    Senha varchar(16) not null 
);

create table Produtor (
    --Id integer identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    Nome varchar(255) not null,
    Telefone varchar(14), 
    UsuarioId integer not null,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario (id)
);
create table Cliente (
    --Id integer identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    ProdutorId integer not null, 
    Nome varchar(255) not null,
    Telefone varchar(14), 
    Chave varchar(8),
    FOREIGN KEY (ProdutorId) REFERENCES Produtor (id)
);
/*
create table ClienteAgenda (
    --Id integer identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    ClienteId integer not null, 
    DiaSemana tinyinteger not null, -- 1 domingo, ..., 7 sabado
    hora time not null, 
    fl_ativo bit not null default 1,
    FOREIGN KEY (ClienteId) REFERENCES Cliente (id)
);
*/


create table Metrica (
    --Id tinyinteger identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    Nome varchar(255) not null,
    Simbolo varchar(5) not null
);

create table Produto (
    --Id integer identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    ProdutorId integer not null,
    Nome varchar(255) not null,
    Descricao varchar(500),
    MetricaId tinyinteger not null,
    FOREIGN KEY (ProdutorId) REFERENCES Produtor (id),
    FOREIGN KEY (MetricaId) REFERENCES Metrica (id)
);

create table ProdutoValorPadrao (
    --Id integer identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    ProdutoId integer not null, 
    Valor numeric(5,2) not null, 
    Fl_ativo bit not null default 1,
    FOREIGN KEY (ProdutoId) REFERENCES Produto (id)
);

create table ProdutoValorCliente (
    --Id integer identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    ProdutoId integer not null, 
    ClienteId integer not null,
    Valor numeric(5,2) not null, 
    Fl_ativo bit not null default 1,
    FOREIGN KEY (ProdutoId) REFERENCES Produto (id),
    FOREIGN KEY (ClienteId) REFERENCES Cliente (id)
);

create table Pedido (
    --Id integer identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    Dt_saldo date not null,-- default getdate(),
    ProdutorId integer not null,
    ClienteId integer not null, 
    Valor numeric(7,2) not null,
    Fl_Padrao bit not null default 0,
    FOREIGN KEY (ClienteId) REFERENCES Cliente (id),
    FOREIGN KEY (ProdutorId) REFERENCES Produtor (id)
);

create table PedidoItem (
    --Id integer identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    PedidoId integer not null,
    Dt_saldo date not null,-- default getdate(),
    ProdutorId integer not null,
    ClienteId integer not null, 
    ProdutoId integer  null, 
    Quantidade numeric(5,2)  null,
    ValorUnitario numeric(5,2)  null,
    ValorTotal numeric(5,2) not null,
    FOREIGN KEY (ClienteId) REFERENCES Cliente (id),
    FOREIGN KEY (ProdutorId) REFERENCES Produtor (id)
    FOREIGN KEY (PedidoId) REFERENCES Pedido (id)
);


create table TipoLancamento (
    --Id tinyint identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    Nome varchar(255) not null,
    Fl_sinal bit not null
);
create table Lancamento (
    --Id integer identity(1,1) primary key,
    Id integer primary key autoincrement,
    Dt_lancamento datetime default CURRENT_TIMESTAMP,-- default getdate(),
    ProdutorId integer not null,
    ClienteId integer not null,
    TipoLancamentoId tinyinteger not null, 
    PedidoId integer null, 
    Valor numeric(5,2) not null,
    FOREIGN KEY (ProdutorId) REFERENCES Produtor (id),
    FOREIGN KEY (ClienteId) REFERENCES Cliente (id),
    FOREIGN KEY (TipoLancamentoId) REFERENCES TipoLancamento (id),
    FOREIGN KEY (PedidoId) REFERENCES Pedido (id)
);

create table Saldo (
    --Id integer identity(1,1) primary key, 
    Id integer primary key autoincrement, 
    Dt_saldo date not null,-- default getdate(),
    ProdutorId integer not null,
    ClienteId integer not null, 
    Valor numeric(7,2) not null,
    FOREIGN KEY (ClienteId) REFERENCES Cliente (id),
    FOREIGN KEY (ProdutorId) REFERENCES Produtor (id)
);


drop view if exists vwTabelaValoresProdutorCliente;
create view vwTabelaValoresProdutorCliente as 
select 
        a.Id as ProdutorId,
        a.Nome as Produtor, 
        b.Id as ClienteId,
        b.Nome as Cliente,
        c.Id as ProdutoId, 
        c.Nome as Produto, 
        f.Simbolo as Metrica,
        ifnull(d.Valor,e.Valor) Valor
    from Produtor a 
        join Cliente b on a.Id = b.ProdutorId
        join Produto c on a.Id = b.ProdutorId
        left join ProdutoValorCliente d on b.Id = d.ClienteId and c.Id = d.ProdutoId
        left join ProdutoValorPadrao e on c.Id = e.ProdutoId
        join Metrica f on c.MetricaId = f.Id;