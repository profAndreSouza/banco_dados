# Data Query Language

## DQL

```sql

SELECT [campos]
FROM [tabelas]
JOIN [tabelas] ON [relacionamentos]
WHERE [critérios]
GROUP BY [campos]
HAVING [critérios]
ORDER BY [campos]

```

## Exercícios

### Consultas Básicas

1. Listar todos os clientes pessoa física com seus nomes e CPFs.
```sql

```

2. Exibir o nome fantasia e CNPJ de todas as pessoas jurídicas cadastradas.
```sql

```

3. Listar todos os emails cadastrados no sistema.
```sql

```

4. Exibir todos os endereços do tipo "Residencial", mostrando logradouro, número e cidade.
```sql

```

5. Listar todos os números de telefone do tipo "Movel".
```sql

```



###  Consultas Intermediárias

6. Listar o nome e CPF de todas as pessoas físicas ativas.
```sql

```

7. Listar o nome fantasia e a quantidade de telefones cadastrados por pessoa jurídica.
```sql

```

8. Exibir o nome (PF ou PJ), o tipo de cliente e a cidade de todos os clientes que possuem endereço.
```sql

```

9. Exibir o nome e email de todas as pessoas físicas que possuem mais de um email cadastrado.
```sql

```

10. Listar todos os clientes (PF e PJ) que não possuem nenhum telefone cadastrado.
```sql

```



###  Consultas Avançadas

11. Listar o nome (PF ou PJ) de todos os clientes que possuem pelo menos dois telefones e pelo menos um email.
```sql

```

12. Listar os nomes e cidades dos clientes (PF ou PJ) que têm endereços tanto residenciais quanto comerciais.
```sql

```

13. Listar todos os clientes (PF e PJ) com todos os seus contatos (email, telefone e endereço), mesmo que alguns desses dados estejam ausentes.
```sql

```

14. Exibir a quantidade total de clientes ativos e inativos, separando por tipo (PF e PJ).
```sql

```

15. Para cada cliente, exibir:
    - tipo (PF ou PJ),
    - nome,
    - total de emails,
    - total de telefones,
    - total de endereços.
    Ordenar pelo total de contatos (soma dos três).
```sql

```

