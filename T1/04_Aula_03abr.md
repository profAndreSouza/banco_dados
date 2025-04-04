
CREATE TABLE estacao (
    id_estacao SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE estacao_estado (
    id_estado SERIAL PRIMARY KEY,
    id_estacao INT REFERENCES estacao(id_estacao),
    em_funcionamento BOOLEAN NOT NULL,
    timestamp_estado TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE peca (
    id_peca SERIAL PRIMARY KEY,
    tipo_material VARCHAR(50) NOT NULL
);

CREATE TABLE ciclo (
    id_ciclo SERIAL PRIMARY KEY,
    id_peca INT REFERENCES peca(id_peca),
    id_estacao INT REFERENCES estacao(id_estacao),
    tempo_inicial TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    timestamp_ciclo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE sensor (
    id_sensor SERIAL PRIMARY KEY,
    tipo_sensor VARCHAR(50),
    id_estacao INT REFERENCES estacao(id_estacao),
    descricao VARCHAR(255);
);


CREATE TABLE deteccao_sensor (
    id_deteccao SERIAL PRIMARY KEY,
    id_sensor INT REFERENCES sensor(id_sensor),
    timestamp_deteccao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


