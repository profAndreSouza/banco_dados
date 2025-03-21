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