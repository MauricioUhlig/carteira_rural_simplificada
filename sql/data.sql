insert into TipoLancamento (Nome, Fl_Sinal) values ('Venda',1),('Pagamento',0), ('Estorno',0);

insert into Metrica (Nome, Simbolo) values ('Maços','mç'),('Unidade','un'),('Quilograma','kg'),('Caixa','cx'),('Litros','l'),('Sacos','sc');

insert into Usuario (Nickname, Senha) values ('mauricio.uhlig','123456789'), ('ervino.uhlig','123');

insert into Produtor (Nome, Telefone, UsuarioId) values ('Ervino Uhlig','27996319995',2);

insert into Cliente (ProdutorId, Nome, Telefone, Chave) values (1,'Extrafruti','27999999999','123'),(1,'Feirante','','');

insert into Produto (ProdutorId, Nome, Descricao, MetricaId) values (1,'Agrião','Agrião dagua mç',1),(1,'Repolho','Repolho branco',4);

insert into ProdutoValorPadrao (ProdutoId, Valor) values (1, 0.35), (2,4.75);

insert into ProdutoValorCliente (ClienteId, ProdutoId, Valor) values (1,1, 0.60);


select * from vwTabelaValoresProdutorCliente;

insert into Lancamento (ProdutorId, ClienteId, TipoLancamentoId,Valor) values 
(1,2,1,15.20),
(1,2,2,10.99),
(1,2,3,4);



select * from vwProdutorClienteMovimento;