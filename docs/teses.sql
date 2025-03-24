use pizzaria;
insert into Cliente(nome, logradouro, numero, telefones, bairro, referencia) values
("Adelcio Biazi","Rua Wellington Martins","1204","['19 99198-8789']","Dom Bosco","Igreja"),
("Adriano da Silva Ferreira","Rua Walter Paulo Costenaro","1206","['19 99198-7777']","Bela Vista","Farmácia"),
("Alisson Linhares de Carvalho","Rua Viviane Mello Bonadia dos Santos","1208","['19 99198-3333','19 44444-2222']","Zambom",null),
("Amanda Cristina davi Resende","Rua Thamires de Campos Luz","1210","['19 66666-8789']","Santa Cruz","Escola"),
("Ana Cláudia de Moura Laurentino","Rua Taynara Cerigueli Dutra","1212","['19 111111-8789']","Dom Bosco",null),
("Ana Claudia Maciel","Rua Suéllen Rodolfo Martinelli","['19 99198-8789']","['19 99198-3322']","Dom Bosco","Campinho"),
("Argemiro Pentian Junior","Rua Silvia Roberta de Jesus Garcia","1216","['19 99198-1122']","Dom Bosco",null),
("Bento Rafael Siqueira","Rua Sergio Willians Poneli","1218","['19 99198-2222']","Dom Bosco",null),
("Bernardo Moreira Zabadal","Rua Sara Luzia de Melo","1220","['19 99198-1133']","Dom Bosco","suermercado"),
("Carlos Roberto de Oliveira Cazelatto Junior","Rua Raphael Hungaro Moretti","1222","['19 99198-0000']","Dom Bosco",null);

insert into Pizza(nome, descricao, valor) values
("À Moda da Casa","Molho de tomate fresco, mussarela especial, presunto cozido picado, ovos, cebola fatiada, cobertura de catupiry, orégano e azeitonas pretas",32.93),
("Alho e Óleo","Molho de tomate fresco, alho crocante coberto com parmesão, orégano e azeitonas pretas",32.77),
("Aliche","Molho especial de tomate fresco, filés de aliche importado, orégano e azeitonas pretas",32.61),
("Ao Funghi","Molho de tomate fresco, mussarela especial, champignon fatiado, manjericão fresco, orégano e azeitonas pretas",32.45),
("Atum","Molho de tomate fresco, atum especial sólido, cebola fatiada, orégano e azeitonas pretas",32.29),
("Baiana","Molho de tomate fresco, calabresa moída levemente apimentada, ovos cozidos picados, cebola fatiada, orégano e azeitonas pretas",32.13),
("Bauru","Molho de tomate fresco, presunto cozido picado, mussarela especial, rodelas de tomate, orégano e azeitonas pretas",31.97),
("Caipira","Molho de tomate fresco, frango desfiado levemente temperado, cobertura de catupiry, milho verde, orégano e azeitonas pretas",31.81),
("Calabresa","Molho de tomate fresco, calabresa especial fatiada, rodelas de cebola, orégano e azeitonas pretas",31.65),
("Calabresa com Catupiry","Molho de tomate fresco, calabresa especial fatiada, cobertura de catupiry, orégano e azeitonas pretas",31.49),
("Calabresa com Mussarela","Molho de tomate fresco, calabresa especial fatiada, mussarela especial, orégano e azeitonas pretas",31.33),
("Camarão","Molho de tomate fresco, camarão especial, cebola fatiada, orégano e azeitonas pretas",31.17),
("Camarão com Catupiry","Molho de tomate fresco, camarão especial, cobertura de catupiry, orégano e azeitonas pretas",31.01),
("Camarão com Mussarela","Molho de tomate fresco, camarão especial, mussarela especial, orégano e azeitonas pretas",30.85),
("Cinco Queijos","Molho de tomate fresco, mussarela especial, catupiry, provolone, gorgonzola, parmesão, orégano e azeitonas pretas",30.69),
("Escarola","Molho de tomate fresco, escarola refogada, cobertura de catupiry, orégano e azeitonas pretas",30.53),
("Frango com Catupiry","Molho de tomate fresco, frango desfiado levemente temperado, cobertura de catupiry, orégano e azeitonas pretas",30.37),
("Frango com Mussarela","Molho de tomate fresco, frango desfiado levemente temperado, mussarela especial, orégano e azeitonas pretas",30.21),
("Lombo","Molho de tomate fresco, lombo canadense fatiado, cebola fatiada, orégano e azeitonas pretas",30.05);

insert into pedido (clienteid) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

insert into item(pedidoId, pizzaId, quantidade) values
(1,1,1),
(1,2,1),
(1,5,1),
(2,2,1),
(3,3,1),
(3,1,2),
(4,4,1),
(5,5,1),
(6,6,1),
(6,7,1),
(7,1,1),
(8,8,1),
(8,2,1),
(8,1,2),
(9,9,1),
(9,10,1),
(10,19,1),
(10,18,2),
(10,12,1);

update item set subtotal = quantidade * (select valor from pizza where id = item.pizzaId);
update pedido set valor = (select sum(subtotal) from item where pedidoId = pedido.id);

select * from Cliente;
select * from Pizza;
select * from Pedido;
select * from Item;