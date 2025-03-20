
## DML

```sql

TRUNCATE TABLE estadio RESTART IDENTITY CASCADE;
INSERT INTO estadio (nome, cidade) VALUES
    ('Maracanã', 'Rio de Janeiro'),
    ('Morumbi', 'São Paulo'),
    ('Arena do Grêmio', 'Porto Alegre'),
    ('Vila Belmiro', 'Santos'),
    ('Nilton Santos', 'Rio de Janeiro'),
    ('Arena da Baixada', 'Curitiba'),
    ('Fonte Nova', 'Salvador'),
    ('Mineirão', 'Belo Horizonte'),
    ('Arena Pantanal', 'Cuiabá'),
    ('Couto Pereira', 'Curitiba');

TRUNCATE TABLE time RESTART IDENTITY CASCADE;
INSERT INTO time (nome, tecnico) VALUES 
('Flamengo', 'Tite'),
('Palmeiras', 'Abel Ferreira'),
('São Paulo', 'Thiago Carpini'),
('Corinthians', 'Mano Menezes'),
('Grêmio', 'Renato Gaúcho'),
('Internacional', 'Eduardo Coudet'),
('Santos', 'Carille'),
('Vasco', 'Ramón Díaz'),
('Botafogo', 'Lúcio Flávio'),
('Fluminense', 'Fernando Diniz'),
('Athletico-PR', 'Wesley Carvalho'),
('Cruzeiro', 'Pepa'),
('Bahia', 'Rogério Ceni'),
('Fortaleza', 'Vojvoda'),
('Atlético-MG', 'Felipão'),
('América-MG', 'Lisca'),
('Cuiabá', 'António Oliveira'),
('Goiás', 'Jair Ventura'),
('Coritiba', 'Guto Ferreira'),
('Sport', 'Enderson Moreira');


TRUNCATE TABLE jogador RESTART IDENTITY CASCADE;
INSERT INTO jogador (nome, timeId) VALUES
('Pedro', (SELECT id FROM TIME WHERE nome = 'Flamengo')),
('Arrascaeta', (SELECT id FROM TIME WHERE nome = 'Flamengo')),
('Everton Ribeiro', (SELECT id FROM TIME WHERE nome = 'Flamengo')),
('Gerson', (SELECT id FROM TIME WHERE nome = 'Flamengo')),
('Calleri', (SELECT id FROM TIME WHERE nome = 'São Paulo')),
('Luciano', (SELECT id FROM TIME WHERE nome = 'São Paulo')),
('Rodrigo Nestor', (SELECT id FROM TIME WHERE nome = 'São Paulo')),
('Alisson', (SELECT id FROM TIME WHERE nome = 'São Paulo')),
('Luis Suárez', (SELECT id FROM TIME WHERE nome = 'Grêmio')),
('Villasanti', (SELECT id FROM TIME WHERE nome = 'Grêmio')),
('Kannemann', (SELECT id FROM TIME WHERE nome = 'Grêmio')),
('Pepê', (SELECT id FROM TIME WHERE nome = 'Grêmio')),
('Marcos Leonardo', (SELECT id FROM TIME WHERE nome = 'Santos')),
('Soteldo', (SELECT id FROM TIME WHERE nome = 'Santos')),
('Camacho', (SELECT id FROM TIME WHERE nome = 'Santos')),
('Lucas Lima', (SELECT id FROM TIME WHERE nome = 'Santos')),
('Tiquinho Soares', (SELECT id FROM TIME WHERE nome = 'Botafogo')),
('Eduardo', (SELECT id FROM TIME WHERE nome = 'Botafogo')),
('Marçal', (SELECT id FROM TIME WHERE nome = 'Botafogo')),
('Patrick', (SELECT id FROM TIME WHERE nome = 'Botafogo')),
('Vitor Roque', (SELECT id FROM TIME WHERE nome = 'Athletico-PR')),
('Fernandinho', (SELECT id FROM TIME WHERE nome = 'Athletico-PR')),
('Erick', (SELECT id FROM TIME WHERE nome = 'Athletico-PR')),
('Thiago Heleno', (SELECT id FROM TIME WHERE nome = 'Athletico-PR')),
('Everaldo', (SELECT id FROM TIME WHERE nome = 'Bahia')),
('Biel', (SELECT id FROM TIME WHERE nome = 'Bahia')),
('Cauly', (SELECT id FROM TIME WHERE nome = 'Bahia')),
('Rezende', (SELECT id FROM TIME WHERE nome = 'Bahia')),
('Hulk', (SELECT id FROM TIME WHERE nome = 'Atlético-MG')),
('Paulinho', (SELECT id FROM TIME WHERE nome = 'Atlético-MG')),
('Zaracho', (SELECT id FROM TIME WHERE nome = 'Atlético-MG')),
('Jemerson', (SELECT id FROM TIME WHERE nome = 'Atlético-MG')),
('Deyverson', (SELECT id FROM TIME WHERE nome = 'Cuiabá')),
('Clayson', (SELECT id FROM TIME WHERE nome = 'Cuiabá')),
('Uendel', (SELECT id FROM TIME WHERE nome = 'Cuiabá')),
('Marllon', (SELECT id FROM TIME WHERE nome = 'Cuiabá')),
('Alef Manga', (SELECT id FROM TIME WHERE nome = 'Coritiba')),
('Andrey', (SELECT id FROM TIME WHERE nome = 'Coritiba')),
('Kuscevic', (SELECT id FROM TIME WHERE nome = 'Coritiba')),
('Natanael', (SELECT id FROM TIME WHERE nome = 'Coritiba')),
('Dudu', (SELECT id FROM TIME WHERE nome = 'Palmeiras')),
('Raphael Veiga', (SELECT id FROM TIME WHERE nome = 'Palmeiras')),
('Rony', (SELECT id FROM TIME WHERE nome = 'Palmeiras')),
('Zé Rafael', (SELECT id FROM TIME WHERE nome = 'Palmeiras')),
('Yuri Alberto', (SELECT id FROM TIME WHERE nome = 'Corinthians')),
('Renato Augusto', (SELECT id FROM TIME WHERE nome = 'Corinthians')),
('Paulinho', (SELECT id FROM TIME WHERE nome = 'Corinthians')),
('Fagner', (SELECT id FROM TIME WHERE nome = 'Corinthians')),
('Alan Patrick', (SELECT id FROM TIME WHERE nome = 'Internacional')),
('Wanderson', (SELECT id FROM TIME WHERE nome = 'Internacional')),
('Mauricio', (SELECT id FROM TIME WHERE nome = 'Internacional')),
('Johnny', (SELECT id FROM TIME WHERE nome = 'Internacional')),
('Payet', (SELECT id FROM TIME WHERE nome = 'Vasco')),
('Pec', (SELECT id FROM TIME WHERE nome = 'Vasco')),
('Jair', (SELECT id FROM TIME WHERE nome = 'Vasco')),
('Léo Pelé', (SELECT id FROM TIME WHERE nome = 'Vasco')),
('Cano', (SELECT id FROM TIME WHERE nome = 'Fluminense')),
('Ganso', (SELECT id FROM TIME WHERE nome = 'Fluminense')),
('Keno', (SELECT id FROM TIME WHERE nome = 'Fluminense')),
('Martinelli', (SELECT id FROM TIME WHERE nome = 'Fluminense')),
('Gilberto', (SELECT id FROM TIME WHERE nome = 'Cruzeiro')),
('Bruno Rodrigues', (SELECT id FROM TIME WHERE nome = 'Cruzeiro')),
('Machado', (SELECT id FROM TIME WHERE nome = 'Cruzeiro')),
('Lucas Silva', (SELECT id FROM TIME WHERE nome = 'Cruzeiro')),
('Moisés', (SELECT id FROM TIME WHERE nome = 'Fortaleza')),
('Pikachu', (SELECT id FROM TIME WHERE nome = 'Fortaleza')),
('Tinga', (SELECT id FROM TIME WHERE nome = 'Fortaleza')),
('Zé Welison', (SELECT id FROM TIME WHERE nome = 'Fortaleza')),
('Felipe Azevedo', (SELECT id FROM TIME WHERE nome = 'América-MG')),
('Benítez', (SELECT id FROM TIME WHERE nome = 'América-MG')),
('Aloísio', (SELECT id FROM TIME WHERE nome = 'América-MG')),
('Juninho', (SELECT id FROM TIME WHERE nome = 'América-MG')),
('Pedro Raul', (SELECT id FROM TIME WHERE nome = 'Goiás')),
('Vinícius', (SELECT id FROM TIME WHERE nome = 'Goiás')),
('Diego', (SELECT id FROM TIME WHERE nome = 'Goiás')),
('Maguinho', (SELECT id FROM TIME WHERE nome = 'Goiás')),
('Vagner Love', (SELECT id FROM TIME WHERE nome = 'Sport')),
('Sabino', (SELECT id FROM TIME WHERE nome = 'Sport')),
('Juba', (SELECT id FROM TIME WHERE nome = 'Sport')),
('Ronaldo Henrique', (SELECT id FROM TIME WHERE nome = 'Sport'));


TRUNCATE TABLE partida RESTART IDENTITY CASCADE;
INSERT INTO partida (timeCasaId, timeVisitanteId, estadioId, data, golsCasa, golsVisitante) VALUES 
((SELECT id FROM time WHERE nome = 'Flamengo'), (SELECT id FROM time WHERE nome = 'Palmeiras'), (SELECT id FROM estadio WHERE nome = 'Maracanã'), '2025-03-10', 2, 1),
((SELECT id FROM time WHERE nome = 'São Paulo'), (SELECT id FROM time WHERE nome = 'Corinthians'), (SELECT id FROM estadio WHERE nome = 'Morumbi'), '2025-03-11', 1, 1),
((SELECT id FROM time WHERE nome = 'Grêmio'), (SELECT id FROM time WHERE nome = 'Internacional'), (SELECT id FROM estadio WHERE nome = 'Arena do Grêmio'), '2025-03-12', 0, 2),
((SELECT id FROM time WHERE nome = 'Santos'), (SELECT id FROM time WHERE nome = 'Vasco'), (SELECT id FROM estadio WHERE nome = 'Vila Belmiro'), '2025-03-13', 2, 2),
((SELECT id FROM time WHERE nome = 'Botafogo'), (SELECT id FROM time WHERE nome = 'Fluminense'), (SELECT id FROM estadio WHERE nome = 'Nilton Santos'), '2025-03-14', 3, 1),
((SELECT id FROM time WHERE nome = 'Athletico-PR'), (SELECT id FROM time WHERE nome = 'Cruzeiro'), (SELECT id FROM estadio WHERE nome = 'Arena da Baixada'), '2025-03-15', 1, 0),
((SELECT id FROM time WHERE nome = 'Bahia'), (SELECT id FROM time WHERE nome = 'Fortaleza'), (SELECT id FROM estadio WHERE nome = 'Fonte Nova'), '2025-03-16', 1, 1),
((SELECT id FROM time WHERE nome = 'Atlético-MG'), (SELECT id FROM time WHERE nome = 'América-MG'), (SELECT id FROM estadio WHERE nome = 'Mineirão'), '2025-03-17', 2, 1),
((SELECT id FROM time WHERE nome = 'Cuiabá'), (SELECT id FROM time WHERE nome = 'Goiás'), (SELECT id FROM estadio WHERE nome = 'Arena Pantanal'), '2025-03-18', 1, 0),
((SELECT id FROM time WHERE nome = 'Coritiba'), (SELECT id FROM time WHERE nome = 'Sport'), (SELECT id FROM estadio WHERE nome = 'Couto Pereira'), '2025-03-19', 0, 2);

```

## Comandos Premium para vira DBA Master

```sql

DELETE FROM nome_tabela; -- without WHERE

TRUNCATE TABLE nome_tabela RESTART IDENTITY CASCADE;

```