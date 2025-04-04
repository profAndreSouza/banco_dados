# Comandos Premium para vira DBA Master

```sql

DELETE FROM nome_tabela; -- without WHERE

TRUNCATE TABLE nome_tabela RESTART IDENTITY CASCADE;

```


# Comando SELECT

```sql
SELECT colunas
FROM tabela
JOIN tabelas
WHERE condição
GROUP BY colunas
HAVING condição
ORDER BY colunas
LIMIT linhas
```

## SELECT Simples
Usado para recuperar colunas específicas ou todas as colunas de uma tabela.

```sql
SELECT * from jogador;

SELECT nome from jogador;
```

## SELECT com ALIAS
Permite renomear colunas ou tabelas para facilitar a leitura dos resultados.

```sql
SELECT nome AS Nome_do_Jogador FROM jogador;
```

## SELECT com WHERE (Filtrando Dados)
Usado para filtrar registros com base em uma condição.

- Pedro% => Começa com Pedro
- %Pedro => Termina com Pedro
- %Pedro% => Contém Pedro

```sql
SELECT nome FROM jogador WHERE timeId = 1 ;

SELECT * from jogador WHERE nome LIKE '%Pedro%';
```

## SELECT com AND, OR e NOT
Permite criar filtros mais complexos.

```sql
SELECT * FROM jogador WHERE timeId = 1 AND nome LIKE 'Pedro%';

SELECT * FROM jogador WHERE timeId = 1 OR timeId = 2;

SELECT * FROM jogador WHERE NOT timeId = 3;
```

## SELECT com ORDER BY (Ordenação)
Ordena os resultados em ordem crescente (ASC) ou decrescente (DESC).
```sql

SELECT * FROM time ORDER BY nome ASC;

SELECT * FROM time ORDER BY nome DESC;

```

## SELECT com LIMIT e OFFSET (Paginação)
Usado para limitar o número de resultados e pular registros.
```sql

SELECT * FROM jogador LIMIT 5;

SELECT * FROM jogador LIMIT 5 OFFSET 5;

```

## SELECT com DISTINCT (Remover Duplicatas)
Elimina valores duplicados de uma coluna.

```sql
SELECT DISTINCT timeId FROM jogador;
```

## SELECT com GROUP BY e HAVING (Agrupamento)
Usado para agrupar registros e aplicar funções de agregação.
```sql
SELECT timeId, COUNT(timeId) AS total_jogadores FROM jogador GROUP BY timeId;

SELECT timeId, COUNT(timeId) AS total_jogadores FROM jogador 
   GROUP BY timeId HAVING COUNT(timeId) > 5;
```

## SELECT com JOIN (Unindo Tabelas)
Usado para recuperar dados de múltiplas tabelas.

### INNER JOIN (Apenas correspondências)
```sql
SELECT jogador.nome, time.nome AS time_nome
FROM jogador
INNER JOIN time ON jogador.timeId = time.id;
```

### LEFT JOIN (Tudo da tabela da esquerda + correspondências)
```sql
SELECT jogador.nome, time.nome AS time_nome
FROM jogador
LEFT JOIN time ON jogador.timeId = time.id;
```

### RIGHT JOIN (Tudo da tabela da direita + correspondências)
```sql
SELECT jogador.nome, time.nome AS time_nome
FROM jogador
RIGHT JOIN time ON jogador.timeId = time.id;
```

### FULL OUTER JOIN (Todos os registros de ambas as tabelas) 
```sql
SELECT jogador.nome, time.nome AS time_nome
FROM jogador
FULL OUTER JOIN time ON jogador.timeId = time.id;
```



```sql


SELECT 
    partida.id AS Jogo_ID,
    data,
    casa.nome AS Time_Casa,
    visitante.nome AS Time_Visitante,
    GolsCasa,
    GolsVisitante,
    estadio.nome AS Estadio,
    Cidade,
    casa.tecnico AS Tecnico_Time_Casa,
    visitante.tecnico AS Tecnico_Time_Visitante
FROM partida
INNER JOIN estadio ON partida.estadioId = estadio.id
INNER JOIN time casa ON partida.timeCasaId = casa.id
INNER JOIN time visitante ON partida.timeVisitanteId = visitante.id;

```