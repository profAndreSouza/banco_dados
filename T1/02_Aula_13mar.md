# Data Definition Language

## DDL

```sql

CREATE TABLE estadio (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, 
    cidade VARCHAR(100) NOT NULL
);

CREATE TABLE time (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tecnico VARCHAR(100) NOT NULL
);

CREATE TABLE jogador (
    id SERIAL PRIMARY KEY,
    timeId INTEGER,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (timeId) REFERENCES time(id) ON DELETE SET NULL
);

CREATE TABLE partida (
    id SERIAL PRIMARY KEY,
    timeCasaId INTEGER NOT NULL,
    timeVisitanteId INTEGER NOT NULL,
    estadioId INTEGER NOT NULL,
    data DATE NOT NULL,
    golsCasa INTEGER NOT NULL,
    golsVisitante INTEGER NOT NULL,
    FOREIGN KEY (timeCasaId) REFERENCES time(id) ON DELETE CASCADE,
    FOREIGN KEY (timeVisitanteId) REFERENCES time(id) ON DELETE CASCADE,
    FOREIGN KEY (estadioId) REFERENCES estadio(id) ON DELETE CASCADE,
);

```