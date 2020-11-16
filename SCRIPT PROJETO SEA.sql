---------------------------------------Tabela interessado---------------------------
--BEGIN TRAN  --ROLLBACK COMMIT
CREATE TABLE Interessado --DROP TABLE Interessado
(
    ID_INTERESSADO              INT IDENTITY (1,1) PRIMARY KEY 
    ,NOME                       VARCHAR(200) NOT NULL
    ,EMAIL                      VARCHAR(200) NOT NULL
    ,TELEFONE                   BIGINT NOT NULL
    ,ESTUDOU_INGLES             VARCHAR(50) NOT NULL
    ,QUANTO_TEMPO_INGLES        SMALLINT --PRECISA ESPECIFICAR QUAL O TEMPO A SER CALCULADO, MESES, ANOS?
    /*,DATA_AULA VARCHAR(50)      PERGUNTAR PARA O CLIENTE QUAL A PREFERENCIA
    ,FORMATO_AULA VARCHAR(50)                                                   */
    ,NOTA_TESTE                 INT NOT NULL
    ,IMG_TESTE                  IMAGE --NOT NULL
    ,MENSAGEM                   VARCHAR(1000)
    ,DATA                       DATE NOT NULL
)
-------------------------------------Tabela Matricula----------------------------------
--BEGIN TRAN  --ROLLBACK COMMIT
CREATE TABLE Matricula --DROP TABLE Matricula
(
    ID_MATRICULA INT IDENTITY (1,1) PRIMARY KEY
    ,ID_INTERESSADO INT 
    ,EMAIL VARCHAR(200) 
    ,STATUS VARCHAR(200) 
    ,ENTREVISTA_REALIZADA varchar(50) 
    ,OBSERVACOES VARCHAR(1000)
    ,DESENVOLVER VARCHAR(1000)
    ,DATA_AULA VARCHAR (50)
    ,FORMATO_AULA VARCHAR (50)
    ,VALOR VARCHAR(100)
    ,DATA_RESPOSTA_PROPOSTA DATE
    ,REG_ATV SMALLINT
    CONSTRAINT FK_INTERESSADO FOREIGN KEY (ID_INTERESSADO)
    REFERENCES INTERESSADO(ID_INTERESSADO)
)
-------------------------------Insert teste----------------------------
INSERT INTO Interessado (NOME,EMAIL,TELEFONE,ESTUDOU_INGLES,QUANTO_TEMPO_INGLES,NOTA_TESTE,/*IMG_TESTE VAMOS TESTAR EM PRODUÇÃO RS,*/MENSAGEM,DATA) VALUES ('Driely','driely@gmail.com',11998878111,'SIM','15','10','OIE',GETDATE())

INSERT INTO Matricula (ID_INTERESSADO,EMAIL,STATUS,ENTREVISTA_REALIZADA,OBSERVACOES,DESENVOLVER,DATA_AULA,FORMATO_AULA,VALOR,DATA_RESPOSTA_PROPOSTA,REG_ATV) 
VALUES (2,'driely@gmail.com','CANDIDATO','SIM','NENHUMA','SPEAKING','Terças e quintas','Grupo','1200,00',GETDATE(),1)
--DELETE MATRICULA WHERE ID_MATRICULA = 4
---------------------------Select teste----------------------------------
SELECT * FROM Interessado
SELECT * FROM Matricula

SELECT 
    * 
FROM 
    Interessado AS INTE 
    INNER JOIN Matricula AS MAT 
        ON INTE.ID_INTERESSADO = MAT.ID_INTERESSADO
WHERE MAT.REG_ATV = 1