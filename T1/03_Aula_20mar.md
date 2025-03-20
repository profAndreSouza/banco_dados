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

## Simples

Selecionar todas as colunas
```sql
SELECT * from jogador;
```

Selecionar colunas específicas
```sql
SELECT nome from jogador;
```

## Alias
Renomear determinada coluna
```sql
SELECT nome AS Nome_do_Jogador FROM jogador;
```

## Where
```sql
SELECT nome AS Nome_do_Jogador FROM jogador;
```