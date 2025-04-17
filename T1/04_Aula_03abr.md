**Projeto Integrador: Estação Separadora de Materiais para Reciclagem**  

## Contexto

Uma estação separadora de materiais para reciclagem foi projetada para classificar e direcionar peças de diferentes materiais para seus respectivos destinos. O sistema conta com uma esteira transportadora, sensores para detecção dos materiais e atuadores para separação das peças.  

### **Componentes do Sistema:**  

1. **Esteira Transportadora:**  
   - Responsável por movimentar as peças ao longo da estação de separação.  

2. **Sensores:**  
   - **Sensor Indutivo:** Detecta se a peça é metálica.  
   - **Sensor Capacitivo:** Confirma a presença da peça na esteira.  
   - **Sensor Ótico:** Identifica peças grandes, independentemente do material, para descarte ou refugo.  

3. **Atuadores:**  
   - Mecanismos para direcionar as peças para três rampas distintas:  
     - **Rampa de Metal:** Para peças metálicas identificadas pelo sensor indutivo.  
     - **Rampa de Plástico:** Para peças não metálicas, considerando a presença confirmada pelo sensor capacitivo.  
     - **Rampa de Refugo:** Para peças grandes detectadas pelo sensor ótico, independentemente do material.  

### **Funcionamento do Sistema:**  
1. A peça entra na esteira e é detectada pelo sensor capacitivo.  
2. O sensor indutivo verifica se a peça é metálica.  
   - Se for metálica, a peça será direcionada para a rampa de metal.  
   - Se não for metálica, segue para a próxima verificação.  
3. O sensor ótico avalia se a peça é grande.  
   - Se for grande, será enviada para a rampa de refugo.  
   - Se não for grande e não for metálica, será direcionada para a rampa de plástico.  

O sistema garante uma separação eficiente e automatizada de materiais para reciclagem, otimizando o processo de reaproveitamento dos resíduos.

## DER
![Diagrama ER](06.Aula_17abr.png)

## DDL

```sql

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
    descricao VARCHAR(255)
);


CREATE TABLE deteccao_sensor (
    id_deteccao SERIAL PRIMARY KEY,
    id_sensor INT REFERENCES sensor(id_sensor),
    timestamp_deteccao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

```



## Exercícios

Gere o DQL que responda as perguntas abaixo:

- Histórico de funcionamento da estação: Verificar quando a estação esteve em funcionamento e os ciclos processados nesse período.
```sql

SELECT estacao.nome, estacao_estado.timestamp_estado, ciclo.tempo_inicial, ciclo_tempo_final
FROM estacao
INNER JOIN estacao_estado ON estacao.id_estacao = estacao_estado.id_estacao
INNER JOIN ciclo ON estacao.id_estacao = ciclo.id_estacao
WHERE estacao_estado.em_funcionamento = TRUE 
AND estacao_estado.timestamp_estado BETWEEN ciclo.tempo_inicial AND ciclo_tempo_final

```
- Peças processadas por estação: Mostrar todas as peças e verificar se foram processadas por alguma estação.
- Sensores que Não Detectaram Nenhuma Peça
- Peças com Última Detecção
- Resumo de Processamento por Estação e Sensores