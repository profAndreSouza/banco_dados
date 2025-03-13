# Data Definition Language

## DDL

```sql
-- Criar o banco de dados
-- CREATE DATABASE locadora;

-- Criar as tabelas
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    phone VARCHAR(11) NOT NULL
);

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    price DECIMAL(5,2) NOT NULL
);

CREATE TABLE rents (
    id SERIAL PRIMARY KEY,
    clientId INTEGER NOT NULL,
    movieId INTEGER NOT NULL,
    loanDate DATE NOT NULL,
    returnDate DATE NOT NULL,
    FOREIGN KEY (clientId) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (movieId) REFERENCES movies(id) ON DELETE CASCADE
);

DROP TABLE tabela_extra;
```

## DML

**Data Manipulation Language**

```sql
INSERT INTO clients (firstName, lastName, phone) VALUES
('João', 'Silva', '99991111'),
('Maria', 'Eduarda', '99992222'),
('Felipe', 'Marques', '99993333');

INSERT INTO movies (title, genre, price) VALUES
('Matrix', 'Ficção', 10.00), 
('Titanic', 'Drama', 12.00), 
('Velozes e Furiosos', 'Ação', 15.00);

INSERT INTO rents (clientId, movieId, loanDate, returnDate) VALUES
(1, 1, '2024-03-01', '2024-03-05'),
(2, 2, '2024-03-02', '2024-03-06'),
(1, 3, '2024-03-04', '2024-03-08');

DELETE FROM clients WHERE id = 1;
```

## DQL

**Data Query Language**

```sql
SELECT * FROM clients;

SELECT * FROM movies;

SELECT * FROM rents;

-- JOIN => Junção
SELECT * FROM clients 
  JOIN rents ON clients.id = rents.clientId
  JOIN movies ON movies.id = rents.movieId;
```
