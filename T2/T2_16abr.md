# Data Definition Language

## DDL

```sql

CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE pessoa_fisica (
    id INTEGER PRIMARY KEY REFERENCES cliente(id) ON DELETE CASCADE,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nascimento DATE NOT NULL
);

CREATE TABLE pessoa_juridica (
    id INTEGER PRIMARY KEY REFERENCES cliente(id) ON DELETE CASCADE,
    nome_fantasia VARCHAR(100) NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL
);

CREATE TABLE endereco (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES cliente(id) ON DELETE CASCADE,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    tipo VARCHAR(12) NOT NULL CHECK (tipo IN ('Comercial', 'Residencial')) DEFAULT 'Residencial'
);

CREATE TABLE telefone (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES cliente(id) ON DELETE CASCADE,
    ddd VARCHAR(2) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    tipo VARCHAR(12) NOT NULL CHECK (tipo IN ('Movel', 'Fixo', 'Recado')) DEFAULT 'Fixo'
);

CREATE TABLE email (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES cliente(id) ON DELETE CASCADE,
    email VARCHAR(200) NOT NULL
);



```


## DML

###  `cliente` (IDs gerados automaticamente)

```sql
-- Inserção de dois clientes (um PF, um PJ)
INSERT INTO cliente (ativo) VALUES (TRUE);  -- id = 1
INSERT INTO cliente (ativo) VALUES (FALSE); -- id = 2
```

###  `pessoa_fisica`

```sql
INSERT INTO pessoa_fisica (id, nome, cpf, nascimento)
VALUES (1, 'João da Silva', '123.456.789-00', '1985-06-15');
```

###  `pessoa_juridica`

```sql
INSERT INTO pessoa_juridica (id, nome_fantasia, razao_social, cnpj)
VALUES (2, 'Tech Soluções', 'Tech Soluções Ltda', '11.222.333/0001-44');
```


###  `pessoa_fisica`

```sql
-- Cliente 3 será inserido depois para o segundo PF
INSERT INTO cliente (ativo) VALUES (TRUE);  -- id = 3
INSERT INTO pessoa_fisica (id, nome, cpf, nascimento)
VALUES (3, 'Maria Oliveira', '987.654.321-00', '1990-12-01');
```

###  `pessoa_juridica`

```sql
-- Cliente 4 será inserido para o segundo PJ
INSERT INTO cliente (ativo) VALUES (TRUE);  -- id = 4
INSERT INTO pessoa_juridica (id, nome_fantasia, razao_social, cnpj)
VALUES (4, 'Auto Mec', 'Auto Mecânica Brasil SA', '55.666.777/0001-88');
```

###  `endereco`

```sql
INSERT INTO endereco (cliente_id, logradouro, numero, complemento, bairro, cidade, estado, cep, tipo)
VALUES
(1, 'Rua das Flores', '123', 'Apto 101', 'Centro', 'São Paulo', 'SP', '01001-000', 'Residencial'),
(2, 'Av. Industrial', '456', NULL, 'Distrito', 'Campinas', 'SP', '13001-200', 'Comercial');
```

### `telefone`

```sql
INSERT INTO telefone (cliente_id, ddd, numero, tipo)
VALUES
(1, '11', '912345678', 'Movel'),
(2, '19', '32345678', 'Fixo');
```

### `email`

```sql
INSERT INTO email (cliente_id, email)
VALUES
(1, 'joao.silva@email.com'),
(2, 'contato@techsolucoes.com.br');
```
