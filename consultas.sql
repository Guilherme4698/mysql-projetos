SELECT EMBALAGEM , TAMANHO FROM tabela_de_produtos;

SELECT DISTINCT EMBALAGEM , TAMANHO FROM tabela_de_produtos;

SELECT DISTINCT EMBALAGEM , TAMANHO FROM tabela_de_produtos WHERE SABOR = 'LARANJA';

SELECT DISTINCT EMBALAGEM , TAMANHO , SABOR FROM tabela_de_produtos WHERE SABOR = 'LARANJA';

SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro';

#Limit#

select * from tabela_de_produtos limit 5

select * from tabela_de_produtos limit 2,3;

select * from tabela_de_produtos limit 0,2;

select * from notas_fiscais where DATA_VENDA = '2017-01-01' limit 10;


	SELECT * FROM TABELA_DE_PRODUTOS;
    
    SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA;
    
     SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;
     
      SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO;
      
        SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC; 
        
        SELECT * FROM tabela_de_produtos WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limão';

SELECT * FROM TABELA_DE_CLIENTES;

SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;

SELECT ESTADO ,  SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes group by ESTADO;

SELECT EMBALAGEM , PRECO_DE_LISTA FROM tabela_de_produtos;

SELECT EMBALAGEM , MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos group by EMBALAGEM;

SELECT EMBALAGEM , COUNT(*) AS CONTADOR FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

SELECT BAIRRO , SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes group by BAIRRO;

SELECT BAIRRO , SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro'
 group by BAIRRO;
 
 
SELECT ESTADO, BAIRRO , SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes group by ESTADO , BAIRRO;

SELECT ESTADO , BAIRRO , SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro'
 group by ESTADO , BAIRRO;
 
 SELECT ESTADO , BAIRRO , SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro'
 group by ESTADO , BAIRRO
 ORDER BY BAIRRO;

 SELECT MAX(QUANTIDADE) AS 'MAIOR QUANTIDADE' FROM ITENS_NOTAS_FISCAIS WHERE CODIGO_DO_PRODUTO =  '1101035' ;
 
 SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;


SELECT ESTADO , SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes GROUP BY ESTADO;

SELECT ESTADO , SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes GROUP BY ESTADO 
HAVING SUM(LIMITE_DE_CREDITO)> 900000;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO 
FROM tabela_de_produtos group by EMBALAGEM;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO 
FROM tabela_de_produtos group by EMBALAGEM HAVING SUM(PRECO_DE_LISTA)<=80;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO 
FROM tabela_de_produtos group by EMBALAGEM HAVING SUM(PRECO_DE_LISTA)<=80 AND MAX(PRECO_DE_LISTA)>=5;

   SELECT CPF , COUNT(*) FROM NOTAS_FISCAIS WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF HAVING COUNT(*) > 2000;

Select * from notas_fiscais;

SELECT * FROM TABELA_DE_VENDEDORES A 
INNER JOIN NOTAS_FISCAIS B
ON A.MATRICULA = B.MATRICULA

SELECT A.MATRICULA , A.NOME, COUNT(*) FROM
TABELA_DE_VENDEDORES A 
INNER JOIN NOTAS_FISCAIS B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA , A.NOME

SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);


SELECT COUNT(*) FROM tabela_de_clientes;

SELECT CPF , COUNT(*) FROM NOTAS_FISCAIS GROUP BY CPF;

SELECT A.CPF , A.NOME , B.CPF FROM tabela_de_clientes A
INNER JOIN notas_fiscais B ON A.CPF = B.CPF;

SELECT distinct A.CPF , A.NOME , B.CPF FROM tabela_de_clientes A
INNER JOIN notas_fiscais B ON A.CPF = B.CPF;

SELECT distinct A.CPF , A.NOME , B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF
WHERE B.CPF IS NULL and year(b.data_venda)= 2015;


select distinct bairro from tabela_de_vendedores;

select * from tabela_de_clientes where bairro in 
('Tijuca' , 'Jardins' , 'Copacabana' , 'Santo Amaro');

select * from tabela_de_clientes where bairro in 
(select distinct bairro from tabela_de_vendedores);

select x.embalagem , x.PRECO_MAXIMO from
(select embalagem , max(preco_de_lista) as PRECO_MAXIMO
from tabela_de_produtos group by embalagem) x where x.PRECO_MAXIMO >= 10;


SELECT * FROM tabela_de_vendedores;
    
    SELECT * FROM tabela_de_clientes;
    
    SELECT * FROM tabela_de_vendedores INNER JOIN tabela_de_clientes ON tabela_de_vendedores.BAIRRO
    = tabela_de_clientes.BAIRRO;
    
    SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME, tabela_de_vendedores.DE_FERIAS,
    tabela_de_clientes.BAIRRO,tabela_de_clientes.NOME
    FROM tabela_de_vendedores INNER JOIN tabela_de_clientes ON tabela_de_vendedores.BAIRRO
    = tabela_de_clientes.BAIRRO; 
    
    SELECT DISTINCT BAIRRO FROM tabela_de_clientes;

SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' AS TIPO FROM tabela_de_clientes
UNION 
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO FROM tabela_de_vendedores;


select embalagem , max(Preco_de_lista) as maior_preco from tabela_de_produtos
group by embalagem;

select x.embalagem , x.PRECO_MAXIMO from
(select embalagem , max(preco_de_lista) as PRECO_MAXIMO
from tabela_de_produtos group by embalagem) x where x.PRECO_MAXIMO >= 10;


select x.embalagem , x.PRECO_MAXIMO from
vw_maiores_embalagem x where x.PRECO_MAXIMO >= 10;

SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO
FROM tabela_de_produtos A INNER JOIN vw_maiores_embalagem X
ON A.EMBALAGEM = X.EMBALAGEM;


ELECT LTRIM('      OLÁ') AS RESULTADO;

SELECT RTRIM('OLÁ        ') AS RESULTADO;

SELECT TRIM(     'OLA       ') AS RESULTADO;

SELECT CONCAT('OLA' ,' ', 'TUDO BEM' , '?') AS RESULTADO;

SELECT UPPER('olá , tudo bem?') AS RESULTADO;

SELECT CURDATE();

SELECT current_time();

SELECT current_timestamp();

SELECT YEAR (current_timestamp());

SELECT MONTH (current_timestamp());

SELECT MONTHNAME (current_timestamp());

SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2024-06-21') AS DIAS_COM_O_MEU_AMOR;

SELECT DATE_SUB(current_timestamp(), INTERVAL 5 DAY) AS RESULTADO;



SELECT  * FROM ITENS_NOTAS_FISCAIS;

SELECT * FROM notas_fiscais;

SELECT * FROM notas_fiscais nf
inner join itens_notas_fiscais inf
on nf.NUMERO = inf.NUMERO;


SELECT nf.CPF ,  nf.DATA_VENDA , inf.QUANTIDADE FROM notas_fiscais nf
inner join itens_notas_fiscais inf
on nf.NUMERO = inf.NUMERO;


SELECT nf.CPF , date_format( nf.DATA_VENDA , " %Y-%m") as
 mes_ano,inf.QUANTIDADE FROM notas_fiscais nf
inner join itens_notas_fiscais inf
on nf.NUMERO = inf.NUMERO;

/* CONSULTA COM VENDAS DE CLIENTES POR MES */
SELECT nf.CPF , date_format( nf.DATA_VENDA , " %Y-%m") as
 mes_ano, SUM(inf.QUANTIDADE) AS quantidade_venda FROM notas_fiscais nf
inner join itens_notas_fiscais inf
on nf.NUMERO = inf.NUMERO
group by nf.CPF ,  date_format( nf.DATA_VENDA , " %Y-%m");

/* LIMITE DE COMPRA POR CLIENTE */
select * from tabela_de_clientes  TC ;

select TC.CPF , TC.NOME , TC.VOLUME_DE_COMPRA AS QUANTODADE_LIMITE
FROM tabela_de_clientes  TC;


SELECT nf.CPF , TC.NOME ,date_format( nf.DATA_VENDA , " %Y-%m") as
 mes_ano, SUM(inf.QUANTIDADE) AS quantidade_venda, MAX(TC.VOLUME_DE_COMPRA) 
 FROM notas_fiscais nf
inner join itens_notas_fiscais inf
on nf.NUMERO = inf.NUMERO
INNER JOIN tabela_de_clientes  TC
ON TC.CPF = NF.CPF
group by nf.CPF ,  date_format( nf.DATA_VENDA , " %Y-%m");

SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS AS DIFERENCA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS , MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X;

SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS AS DIFERENCA,
CASE 
    WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
    ELSE 'VÁLIDA' 
END AS STATUS_VENDA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS , 
MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X;





SELECT * FROM
TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF on NF.NUMERO = INF.NUMERO;

SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;



        

