
-------------------------------------
--								   --
--		FOLHA_DE_PAGAMENTO		   --

--		EDUARDO PATRICK			   --
--		IUMY PIMENTEL			   --
-------------------------------------

-------------------------------------
--								   --
--			BANCO D.			   --
--								   --
-------------------------------------

CREATE DATABASE FOLHA_DE_PAGAMENTO

-------------------------------------
--								   --
--			TABELAS				   --
--								   --
-------------------------------------
CREATE TABLE FUNCIONARIOS
(
	MATRICULA VARCHAR(4) NOT NULL,
	CPF VARCHAR(15) NOT NULL,
	NOME VARCHAR(40) NOT NULL,
	LOCAL_NASC VARCHAR(20) NOT NULL,
	ESCOLARIDADE CHAR(1) NOT NULL,
	CARGO INT,
	ADMISSAO DATE NOT NULL,
	NASCIMENTO DATE NOT NULL,
	DEPENDENTES INT,
	VALE_TRANSP CHAR(1) NOT NULL,
	PLANO_SAUDE CHAR(1) NOT NULL,
	PRIMARY KEY (MATRICULA)
)
--DROP TABLE FUNCIONARIOS
--SELECT * FROM LOG_FUNCIONARIOS
--SELECT * FROM FUNCIONARIOS

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CARGOS
(
	CARGO INT NOT NULL,
	NOMECARGO VARCHAR(40) NOT NULL,
	SALARIO NUMERIC(10,2) NOT NULL,
	PRIMARY KEY (CARGO)
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE LOG_FUNCIONARIOS 
( 
    LogID INT PRIMARY KEY IDENTITY(1,1),
    DataHoraInsercao DATETIME,
    Matricula VARCHAR(4),
    NomeFuncionario NVARCHAR(40)
)
--DROP TABLE LOG_FUNCIONARIOS

------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------
--			PROVENTOS			   --
-------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE REP_REMUNERADO
(
	DESCRICAO CHAR(20),
	VALOR_PORCENTO NUMERIC (10,2)
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE G_ESCOLARIDADE
(
	COD CHAR(1),
	DESCRICAO CHAR(20),
	VALOR_PORCENTO NUMERIC (10,2),

	PRIMARY KEY (COD)
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE AUXILIO_ALIMENTACAO
(
	DESCRICAO CHAR(20),
	VALOR MONEY
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE SALARIO_FAMILIA
(
	DESCRICAO CHAR(20),
	VALOR MONEY,
	TETO MONEY
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ANUENIO
(
	DESCRICAO CHAR(20),
	VALOR MONEY
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE VALE_CULTURA
(
	DESCRICAO CHAR(20),
	VALOR MONEY
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE FGTS
(
	DESCRICAO CHAR(20),
	VALOR_PORCENTO NUMERIC (10,2)
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------
--			DESCONTOS			   --
-------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE INSS
(
	DESCRICAO CHAR(20),
	VALOR_PORCENTO NUMERIC (10,2),
	PISO MONEY,
	TETO MONEY,
	TETO_INSS MONEY
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE VALE_TRANSPORTE
(
	DESCRICAO CHAR(20),
	VALOR_PORCENTO NUMERIC (10,2)
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IMPOSTO_RENDA
(
	DESCRICAO CHAR(20),
	PISO MONEY,
	TETO MONEY,
	ALIQUOTA NUMERIC (10,2),
	VALOR_DEDUZIR MONEY,
	DEDUCAO_DEPENDENTE MONEY
)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE PLANO_SAUDE
(
	DESCRICAO CHAR(20),
	VALOR_PORCENTO NUMERIC (10,2),
	VALOR_DEPENDENTE NUMERIC (10,2)
)

------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------
--								   --
--			GATILHO 			   --
--								   --
-------------------------------------

USE FOLHA_DE_PAGAMENTO
GO
CREATE TRIGGER TG_INSERT_FUNCIONARIOS
	ON FUNCIONARIOS
	FOR INSERT
AS
BEGIN
    DECLARE @DataHoraInsercao DATETIME = GETDATE();
    DECLARE @Matricula INT, @NomeFuncionario VARCHAR(40);
    
    SELECT	@Matricula = MATRICULA, 
			@NomeFuncionario = NOME 
	FROM FUNCIONARIOS
    
    INSERT INTO LOG_FUNCIONARIOS VALUES (@DataHoraInsercao, @Matricula, @NomeFuncionario)
END


--SELECT * FROM LOG_FUNCIONARIOS

------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------
--								   --
--			INSERÇÕES			   --
--								   --
-------------------------------------
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1002','333.145.271-87','DIONE MARGARETE SOUZA DA SILVA','AFUA','G',3,'2002-08-06','1997-02-21','0','S','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1005','186.403.622-20','LUCAS DA CRUZ POMPEU','BELEM','M',2,'2004-08-25','1962-09-05','0','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1006','393.467.572-72','ERICKSON REINALDO VIEIRA ISABEL','CAPITAO POCO','G',4,'2005-01-21','1986-07-03','2','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1010','45.317.887.2-91','ANTONIO CARLOS MARQUES DA SILVA','MARABA','S',1,'2005-09-03','1995-06-05','1','S','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1015','22.760.547.2-72','HELENI BRITO DA SILVA','BRAGANCA','S',1,'2005-06-06','1954-12-14','2','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1020','46.276.254.2-15','ALBERTO SILVA MARQUES','MOJU','M',2,'2006-10-07','1991-10-10','2','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1026','52.260.569.2-34','IVETE CORDEIRO DA SILVA','BELEM','D',6,'2010-06-16','1995-03-25','1','N','N')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1038','37.509.195.2-68','ARNALDO BESSA RODRIGUES','BELEM','D',6,'2010-06-12','1972-09-23','1','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1040','03.829.430.2-30','SÉRGIO GAMA MOREIRA','TAILANDIA','M',1,'2010-11-22','1980-07-21','1','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1042','09.740.821.2-00','KLEIBER DE SOUSA','SALVATERRA','M',1,'2010-11-23','1951-11-09','1','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1044','06.716.301.9-92','DIARACY ROFFE FERREIRA DE LEMOS','BELEM','G',5,'2011-09-18','1957-06-23','0','N','N')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1045','01.017.507.2-28','CARLOS CLEYSON DAVID DE SOUZA','CASTANHAL','S',1,'2012-08-19','1985-01-15','0','S','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1050','83.609.695.2-34','ANTONIO MARCOS CARDOSO DA SILVA','BELEM','E',4,'2012-09-17','1982-12-20','3','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1052','65.516.265.2-15','ANTONIA DA SILVA MORAES OLIVEIRA','SANTAR•EM','G',4,'2013-06-19','1980-10-12','2','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1054','24.771.228.2-72','RAFAEL BARROS PRATES','PARAGOMINAS','S',1,'2013-10-10','1944-12-29','1','S','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1055','97.327.875.2-04','CARLOS BARBOSA IBIAPINO','BELEM','D',5,'2013-10-11','1992-06-16','3','N','N')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1060','29.501.210.2-00','ARNALDO MONTEIRO DA SILVA','MOJU','G',4,'2013-12-15','1936-05-17','1','N','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1065','01.861.833.2-10','MARIA SEMIRAMES DA LUZ','BELEM','G',4,'2015-02-16','1982-09-14','1','S','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1067','10.831.010.2-15','RAYMUNDO NONNATO MORAES','BELEM','S',1,'2015-02-24','1981-01-22','0','S','S')
INSERT INTO FUNCIONARIOS (MATRICULA,CPF,NOME,LOCAL_NASC,ESCOLARIDADE,CARGO,ADMISSAO,NASCIMENTO,DEPENDENTES,VALE_TRANSP,PLANO_SAUDE) VALUES ('1068','04.855.159.2-04','ALUIZIO MACIEL FERREIRA','MOJU','D',6,'2015-02-26','1943-09-04','1','N','S')
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO CARGOS (CARGO, NOMECARGO,SALARIO) VALUES
(1, 'AUXILIAR ADMINISTRATIVO', 954),
(2, 'TECNICO ADMINISTRATIVO', 1200),
(3, 'GESTAO.AUXILIAR', 2000),
(4, 'PROF.AUXILIAR', 3000),
(5, 'PROF.ASSISTENTE', 6000),
(6, 'PROF.ADJUNTO', 10000)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO REP_REMUNERADO VALUES ('REPOUSO REMUNERADO', 1)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO G_ESCOLARIDADE VALUES 
('S', 'MEDIO', 0),
('G', 'GRADUADO', 18),
('E', 'ESPECIALIZAÇÃO', 25),
('M', 'MESTRADO', 54),
('D', 'DOUTORADO', 104)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO AUXILIO_ALIMENTACAO VALUES ('AUXILIO ALIMENTAÇÃO', 750.00)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO SALARIO_FAMILIA VALUES ('SALARIO FAMILIA', 56.47, 1655.98)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ANUENIO VALUES ('ANUÊNIO', 125.00)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO VALE_CULTURA VALUES ('VALE CULTURA', 80.00)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO FGTS VALUES ('FGTS', 8)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO INSS VALUES 
('FAIXA 1', 7.5, 0.00, 1212.00, NULL),
('FAIXA 2', 9.0, 1212.01, 2427.35, NULL),
('FAIXA 3', 12, 2427.36, 3641.03, NULL),
('FAIXA 4', 13, 3641.04, 7087.22, NULL),
('FAIXA 5', NULL, 7087.23, NULL, 992.21)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO VALE_TRANSPORTE VALUES ('VALE TRANSPORTE', 6)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO IMPOSTO_RENDA VALUES
('FAIXA 1', 0.00, 1903.98, 0, 0.00, 189.59),
('FAIXA 2', 1903.98, 2826.65, 7.50, 142.80, 189.59),
('FAIXA 3', 2826.65, 3751.06, 15, 354.80, 189.59),
('FAIXA 4', 3751.06, 4664.68, 22.50, 636.13, 189.59),
('FAIXA 5', 4664.69, NULL, 27.50, 869.36, 189.59)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO PLANO_SAUDE VALUES ('PLANO DE SAÚDE', 3.75, 1.15)
------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------
--								   --
--			PROCEDURES			   --
--								   --
-------------------------------------
SELECT * FROM FUNCIONARIOS
SELECT * FROM CARGOS
--SELECT * FROM INSS
-------------------------------------
--			PROVENTOS			   --
-------------------------------------

USE FOLHA_DE_PAGAMENTO
GO
ALTER PROCEDURE SP_REP_REMUNERADO (@SALARIO_BRUTO MONEY, @REP_REMUNERADO MONEY OUTPUT)
AS
BEGIN
	DECLARE @VALOR_PORCENTO NUMERIC(10,2)

	SELECT @VALOR_PORCENTO = VALOR_PORCENTO FROM REP_REMUNERADO

	SET @REP_REMUNERADO = (@SALARIO_BRUTO * @VALOR_PORCENTO)/100

END

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE FOLHA_DE_PAGAMENTO
GO
ALTER PROCEDURE SP_G_ESCOLARIDADE (@NUM_MATRICULA VARCHAR(4), @SALARIO_BRUTO MONEY, @GRATIFICACAO MONEY OUTPUT)
AS
BEGIN 
    DECLARE @Escolaridade CHAR(1), @VALOR_PORCENTO NUMERIC(10,2)

    SELECT @Escolaridade = ESCOLARIDADE
    FROM FUNCIONARIOS
    WHERE MATRICULA = @NUM_MATRICULA

    SELECT @VALOR_PORCENTO = VALOR_PORCENTO
    FROM G_ESCOLARIDADE
    WHERE COD = @Escolaridade;

    SET @GRATIFICACAO = (@SALARIO_BRUTO * @VALOR_PORCENTO) / 100
END

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE FOLHA_DE_PAGAMENTO
GO
CREATE PROCEDURE SP_AUXILIO_ALIMENTACAO (@VALOR MONEY OUTPUT)
AS
BEGIN
	SELECT @VALOR = VALOR FROM AUXILIO_ALIMENTACAO
END

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE FOLHA_DE_PAGAMENTO
GO
ALTER PROCEDURE SP_SALARIO_FAMILIA (@NUM_MATRICULA VARCHAR(4), @SALARIO_BRUTO MONEY, @SALARIO_FAMILIA MONEY OUTPUT)
AS
BEGIN
    DECLARE @NUM_DEPENDENTES INT, @VALOR_POR_DEPENDENTE MONEY, @TETO MONEY

    SELECT @VALOR_POR_DEPENDENTE = VALOR FROM SALARIO_FAMILIA
	SELECT @TETO = TETO FROM SALARIO_FAMILIA

    SELECT @NUM_DEPENDENTES = DEPENDENTES
    FROM FUNCIONARIOS
    WHERE MATRICULA = @NUM_MATRICULA

    IF @SALARIO_BRUTO <= @TETO
		BEGIN
			SET @SALARIO_FAMILIA = @VALOR_POR_DEPENDENTE * @NUM_DEPENDENTES
		END
    ELSE
		BEGIN
			SET @SALARIO_FAMILIA = 00.00
		END
END

/*
DECLARE @RETORNO MONEY
EXEC SP_SALARIO_FAMILIA '1006', 1000, @RETORNO OUTPUT
PRINT CAST(@RETORNO AS VARCHAR(20))
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE FOLHA_DE_PAGAMENTO
GO
CREATE PROCEDURE SP_CALCULAR_ANUENIO (@NUM_MATRICULA VARCHAR(4), @ANUENIO MONEY OUTPUT)
AS
BEGIN
    DECLARE @DATA_ADMISSAO DATE, @ANOS_TRABALHADOS INT, @VALOR_ANUENIO MONEY
	
	SELECT @VALOR_ANUENIO = VALOR FROM ANUENIO

    SELECT @DATA_ADMISSAO = ADMISSAO
    FROM FUNCIONARIOS
    WHERE MATRICULA = @NUM_MATRICULA

    SET @ANOS_TRABALHADOS = DATEDIFF(YEAR, @DATA_ADMISSAO, GETDATE())

    SET @ANUENIO = @VALOR_ANUENIO * @ANOS_TRABALHADOS
END

/*
DECLARE @RETORNO MONEY
EXEC SP_CALCULAR_ANUENIO'1006', @RETORNO OUTPUT
PRINT CAST(@RETORNO AS VARCHAR(20))
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE FOLHA_DE_PAGAMENTO
GO
CREATE PROCEDURE SP_VALE_CULTURA (@VALOR MONEY OUTPUT)
AS
BEGIN
	SELECT @VALOR = VALOR FROM VALE_CULTURA
END

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

USE FOLHA_DE_PAGAMENTO
GO
CREATE PROCEDURE SP_FGTS (@TOTAL_PROVENTOS MONEY, @SALARIO_BRUTO MONEY, @VALOR_FGTS MONEY OUTPUT)
AS
BEGIN
	DECLARE @PORCENTAGEM NUMERIC(10,2)
	SELECT @PORCENTAGEM = VALOR_PORCENTO
	FROM FGTS


	SET @VALOR_FGTS = ((@SALARIO_BRUTO + @TOTAL_PROVENTOS)*@PORCENTAGEM)/100
END

------------------------------------------------------------------------------------------------------------------------------------------------------------



-------------------------------------
--			DESCONTOS			   --
-------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

USE FOLHA_DE_PAGAMENTO 
GO
ALTER PROCEDURE SP_INSS (@SALARIO_BRUTO MONEY, @VALOR_INSS MONEY OUTPUT)
AS
BEGIN

	DECLARE @PISO MONEY, @TETO MONEY, @TETO_INSS MONEY
    DECLARE @PORCENTAGEM NUMERIC(10, 2)

    DECLARE CURSOR_INSS CURSOR FOR
    SELECT PISO, TETO, TETO_INSS, VALOR_PORCENTO
    FROM INSS


    OPEN CURSOR_INSS

    FETCH NEXT FROM CURSOR_INSS INTO @PISO, @TETO, @TETO_INSS, @PORCENTAGEM

    WHILE @@FETCH_STATUS = 0
    BEGIN
   
		IF(@SALARIO_BRUTO BETWEEN @PISO AND @TETO AND @TETO_INSS IS NULL)
			BEGIN
				SET @VALOR_INSS = (@SALARIO_BRUTO * @PORCENTAGEM) / 100
				BREAK
			END

		ELSE IF(@TETO_INSS IS NOT NULL)
			BEGIN
				SET @VALOR_INSS = @TETO_INSS
				BREAK
			END
			
		FETCH NEXT FROM CURSOR_INSS INTO @PISO, @TETO, @TETO_INSS, @PORCENTAGEM
    END

    CLOSE CURSOR_INSS
	DEALLOCATE CURSOR_INSS

END

/*
DECLARE @RETORNO MONEY
EXEC SP_INSS 3000, @RETORNO OUTPUT
PRINT CAST(@RETORNO AS VARCHAR(20))
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
USE FOLHA_DE_PAGAMENTO 
GO 
ALTER PROCEDURE SP_VALE_TRANSPORTE(@NUM_MATRICULA VARCHAR(4), @SALARIO_BRUTO MONEY, @VALOR_VALE MONEY OUTPUT)
AS
BEGIN
	DECLARE @PORCENTAGEM NUMERIC(10,2)
	DECLARE @ESTADO CHAR(1)

	SELECT @ESTADO = VALE_TRANSP 
	FROM FUNCIONARIOS
	WHERE MATRICULA = @NUM_MATRICULA 

	IF(@ESTADO = 'S')
		BEGIN
			SELECT @PORCENTAGEM = VALOR_PORCENTO 
			FROM VALE_TRANSPORTE

			SET @VALOR_VALE = (@SALARIO_BRUTO * @PORCENTAGEM)/100
			
		END
	ELSE
		BEGIN
			SET @VALOR_VALE = 00.00
			
		END

END

/*
DECLARE @RETORNO MONEY
EXEC SP_VALE_TRANSPORTE '1005', 1500, @RETORNO OUTPUT -- '1002'
PRINT CAST(@RETORNO AS VARCHAR(20))
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

USE FOLHA_DE_PAGAMENTO
GO
CREATE PROCEDURE SP_IMPOSTO_RENDA (@NUM_MATRICULA VARCHAR(4), @SALARIO_BRUTO MONEY, @IRRF MONEY OUTPUT)
AS
BEGIN

	DECLARE @PISO MONEY, 
			@TETO MONEY, 
			@ALIQUOTA NUMERIC(10,2), 
			@VALOR_DEDUCAO MONEY, 
			@VALOR_DEPENDENTE MONEY

	DECLARE @BASE_CALCULO MONEY, 
			@NUM_DEPENDENTES INT,
			@VALOR_INSS MONEY

	EXEC SP_INSS @SALARIO_BRUTO, @VALOR_INSS OUTPUT

	SELECT @NUM_DEPENDENTES = DEPENDENTES
	FROM FUNCIONARIOS
	WHERE MATRICULA = @NUM_MATRICULA


    DECLARE CURSOR_IRRF CURSOR FOR
    SELECT PISO, TETO, ALIQUOTA, VALOR_DEDUZIR, DEDUCAO_DEPENDENTE
    FROM IMPOSTO_RENDA


    OPEN CURSOR_IRRF

    FETCH NEXT FROM CURSOR_IRRF INTO @PISO, @TETO, @ALIQUOTA, @VALOR_DEDUCAO, @VALOR_DEPENDENTE

    WHILE @@FETCH_STATUS = 0
		BEGIN

			SET @BASE_CALCULO = @SALARIO_BRUTO - @VALOR_INSS - (@VALOR_DEPENDENTE * @NUM_DEPENDENTES)

			IF(@BASE_CALCULO BETWEEN @PISO AND @TETO AND @TETO IS NOT NULL)
				BEGIN
					SET @IRRF = ((@BASE_CALCULO * @ALIQUOTA)/100) - @VALOR_DEDUCAO
					BREAK
				END
			ELSE IF(@BASE_CALCULO >= @PISO AND @TETO IS NULL)
				BEGIN
					SET @IRRF = ((@BASE_CALCULO * @ALIQUOTA)/100) - @VALOR_DEDUCAO
				END
			
			
			FETCH NEXT FROM CURSOR_IRRF INTO @PISO, @TETO, @ALIQUOTA, @VALOR_DEDUCAO, @VALOR_DEPENDENTE
		END

    CLOSE CURSOR_IRRF
	DEALLOCATE CURSOR_IRRF

END

/*
SELECT * FROM IMPOSTO_RENDA

DECLARE @RIRRF MONEY;
EXEC SP_IMPOSTO_RENDA '1010', 3000, @RIRRF OUTPUT;
PRINT 'Resultado IRRF: ' + CAST(@RIRRF AS VARCHAR(20));
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

USE FOLHA_DE_PAGAMENTO 
GO 
CREATE PROCEDURE SP_PLANO_SAUDE(@NUM_MATRICULA VARCHAR(4), @SALARIO_BRUTO MONEY, @VALOR_PLANO_SAUDE MONEY OUTPUT)
AS
BEGIN
	DECLARE @PORCENTAGEM NUMERIC(10,2), @PORCENTAGEM_DEP NUMERIC(10,2)
	DECLARE @ESTADO CHAR(1)
	DECLARE @NUM_DEPENDENTES INT
	DECLARE @PLANO_IND MONEY, @PLANO_DEP MONEY

	SELECT	@ESTADO = PLANO_SAUDE, 
			@NUM_DEPENDENTES = DEPENDENTES
	FROM FUNCIONARIOS
	WHERE MATRICULA = @NUM_MATRICULA 

	IF(@ESTADO = 'S')
		BEGIN
			SELECT	@PORCENTAGEM = VALOR_PORCENTO, 
					@PORCENTAGEM_DEP = VALOR_DEPENDENTE
			FROM PLANO_SAUDE

			SET @PLANO_IND = (@SALARIO_BRUTO * @PORCENTAGEM)/100
			SET @PLANO_DEP = ((@SALARIO_BRUTO * @PORCENTAGEM_DEP)/100)*@NUM_DEPENDENTES

			SET @VALOR_PLANO_SAUDE = @PLANO_IND + @PLANO_DEP
	
		END
	ELSE
		BEGIN
			SET @VALOR_PLANO_SAUDE = 00.00
			
		END

END

/*
SELECT * FROM PLANO_SAUDE
SELECT * FROM FUNCIONARIOS
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------


USE FOLHA_DE_PAGAMENTO
GO
ALTER PROCEDURE SP_PRINCIPAL (@OPC INT, @NUM_MATRICULA VARCHAR(4))
AS
BEGIN

	DECLARE @SALARIO_BRUTO MONEY
	DECLARE @MATRICULA_ATUAL VARCHAR(4), 
			@CARGO_ATUAL INT,
			@DESC_CARGO_ATUAL VARCHAR(40),
			@NOME_ATUAL VARCHAR(40), 
			@CPF_ATUAL VARCHAR(15)

	DECLARE @RETORNO_REP_REMUNERADO MONEY, 
			@RETORNO_ESCOLARIDADE MONEY, 
			@RETORNO_AUX_ALIMENTACAO MONEY, 
			@RETORNO_SAL_FAMILIA MONEY, 
			@RETORNO_ANUENIO MONEY,
			@RETORNO_VALE_CULTURA MONEY,
			@RETORNO_FGTS MONEY

    DECLARE @RETORNO_INSS MONEY, 
			@RETORNO_VALE_TRANSPORTE MONEY, 
			@RETORNO_PLANO_SAUDE MONEY,
			@RETORNO_IRRF MONEY
			
	DECLARE @TOTAL_PROVENTOS MONEY,
			@TOTAL_DESCONTOS MONEY,
			@SALARIO_LIQUIDO MONEY
    

	IF(@OPC = 1)
		BEGIN

			SET @SALARIO_BRUTO = (
				SELECT C.SALARIO 
				FROM CARGOS C
				INNER JOIN FUNCIONARIOS F
				ON C.CARGO = F.CARGO
				WHERE F.MATRICULA = @NUM_MATRICULA
			)

			SELECT	@CARGO_ATUAL = C.CARGO, 
					@DESC_CARGO_ATUAL = C.NOMECARGO, 
					@NOME_ATUAL = F.NOME, 
					@CPF_ATUAL = F.CPF
			FROM CARGOS C
				INNER JOIN FUNCIONARIOS F
			ON C.CARGO = F.CARGO
			WHERE F.MATRICULA = @NUM_MATRICULA

		------------- PROVENTOS ---------------
		----------------------------------------

			EXEC SP_REP_REMUNERADO @SALARIO_BRUTO, @RETORNO_REP_REMUNERADO OUTPUT

		----------------------------------------
			EXEC SP_G_ESCOLARIDADE @NUM_MATRICULA, @SALARIO_BRUTO, @RETORNO_ESCOLARIDADE OUTPUT

		----------------------------------------

			EXEC SP_AUXILIO_ALIMENTACAO @RETORNO_AUX_ALIMENTACAO OUTPUT
		----------------------------------------

			EXEC SP_SALARIO_FAMILIA @NUM_MATRICULA, @SALARIO_BRUTO, @RETORNO_SAL_FAMILIA OUTPUT

		----------------------------------------
			
			EXEC SP_CALCULAR_ANUENIO @NUM_MATRICULA, @RETORNO_ANUENIO OUTPUT

		----------------------------------------

			EXEC SP_VALE_CULTURA @RETORNO_VALE_CULTURA OUTPUT

		------------- DESCONTOS ---------------
		----------------------------------------

			EXEC SP_INSS @SALARIO_BRUTO, @RETORNO_INSS OUTPUT

		----------------------------------------
			EXEC SP_VALE_TRANSPORTE @NUM_MATRICULA, @SALARIO_BRUTO, @RETORNO_VALE_TRANSPORTE OUTPUT

		----------------------------------------

			EXEC SP_IMPOSTO_RENDA @NUM_MATRICULA, @SALARIO_BRUTO, @RETORNO_IRRF OUTPUT

		----------------------------------------

			EXEC SP_PLANO_SAUDE @NUM_MATRICULA, @SALARIO_BRUTO, @RETORNO_PLANO_SAUDE OUTPUT

		-------------- CALCULOS ----------------
		----------------------------------------

			SET @TOTAL_PROVENTOS =	(@RETORNO_REP_REMUNERADO + 
									@RETORNO_ESCOLARIDADE + 
									@RETORNO_AUX_ALIMENTACAO + 
									@RETORNO_SAL_FAMILIA + 
									@RETORNO_ANUENIO + 
									@RETORNO_VALE_CULTURA)

			SET @TOTAL_DESCONTOS = (@RETORNO_INSS + 
									@RETORNO_VALE_TRANSPORTE + 
									@RETORNO_PLANO_SAUDE + 
									@RETORNO_IRRF)

			SET @SALARIO_LIQUIDO = (@SALARIO_BRUTO + @TOTAL_PROVENTOS)-@TOTAL_DESCONTOS

			EXEC SP_FGTS @TOTAL_PROVENTOS, @SALARIO_BRUTO, @RETORNO_FGTS OUTPUT


				----------- CONTRA-CHEQUE --------------
				----------------------------------------

				PRINT '____________________________________________________________________________________________________'

				PRINT '--------------------------------------COMPROVANTE DE PAGAMENTO--------------------------------------'

				PRINT '____________________________________________________________________________________________________'

				PRINT 'N° MATRICULA:									' + CAST(@NUM_MATRICULA AS VARCHAR(4))
				PRINT 'NOME:											' + CAST(@NOME_ATUAL AS VARCHAR(40))
				PRINT 'CPF:											' + CAST(@CPF_ATUAL AS VARCHAR(15))
				PRINT 'CARGO:											' + CAST(@DESC_CARGO_ATUAL AS VARCHAR(40)) 
				PRINT 'COD. CARGO:										' + CAST(@CARGO_ATUAL AS VARCHAR(1))

				PRINT '____________________________________________________________________________________________________'

				PRINT '-------------------------------------------- PROVENTOS ---------------------------------------------'

				PRINT '____________________________________________________________________________________________________'

				PRINT 'REPOUSO REMUNERADO:								' + CAST(@RETORNO_REP_REMUNERADO AS VARCHAR(40))
				PRINT 'GRATIFICAÇÃO ESCOLARIDADE:						' + CAST(@RETORNO_ESCOLARIDADE AS VARCHAR(40))
				PRINT 'AUXILIO ALIMENTAÇÃO:							' + CAST(@RETORNO_AUX_ALIMENTACAO AS VARCHAR(40))
				PRINT 'SALARIO FAMÍLIA:								' + CAST(@RETORNO_SAL_FAMILIA AS VARCHAR(40))
				PRINT 'ANUÊNIO:										' + CAST(@RETORNO_ANUENIO AS VARCHAR(40))
				PRINT 'VALE CULTURA:									' + CAST(@RETORNO_VALE_CULTURA AS VARCHAR(40))


				PRINT '____________________________________________________________________________________________________'

				PRINT '-------------------------------------------- DESCONTOS ---------------------------------------------'

				PRINT '____________________________________________________________________________________________________'

				PRINT 'INSS:											' + CAST(@RETORNO_INSS AS VARCHAR(40))
				PRINT 'VALE TRANPORTE:									' + CAST(@RETORNO_VALE_TRANSPORTE AS VARCHAR(40))
				PRINT 'IMPOSTO DE RENDA:								' + CAST(@RETORNO_IRRF AS VARCHAR(40))
				PRINT 'PLANO DE SAÚDE:									' + CAST(@RETORNO_PLANO_SAUDE AS VARCHAR(40))
				
				PRINT '____________________________________________________________________________________________________'

				PRINT '-----------------------------------------CALCULO DO SALÁRIO-----------------------------------------'

				PRINT '____________________________________________________________________________________________________'


				PRINT 'TOTAL DE PROVENTOS:		' + CAST(@TOTAL_PROVENTOS AS VARCHAR(40)) + '					TOTAL DE DESCONTOS:		'  + CAST(@TOTAL_DESCONTOS AS VARCHAR(40))

				PRINT '____________________________________________________________________________________________________'
					
				PRINT 'FGTS:											' + CAST(@RETORNO_FGTS AS VARCHAR(40))

				PRINT '____________________________________________________________________________________________________'

				PRINT 'SALARIO LIQUIDO:								' + CAST(@SALARIO_LIQUIDO AS VARCHAR(40))

				PRINT '____________________________________________________________________________________________________'
				PRINT ' '

		END

	IF(@OPC = 0)
		BEGIN
			DECLARE CURSOR_MAIN CURSOR FOR
			SELECT C.SALARIO, C.CARGO, C.NOMECARGO, F.NOME, F.CPF, F.MATRICULA
			FROM CARGOS C
				INNER JOIN FUNCIONARIOS F
			ON C.CARGO = F.CARGO

			OPEN CURSOR_MAIN

			FETCH NEXT FROM CURSOR_MAIN INTO @SALARIO_BRUTO, @CARGO_ATUAL, @DESC_CARGO_ATUAL, @NOME_ATUAL, @CPF_ATUAL, @MATRICULA_ATUAL

			WHILE @@FETCH_STATUS = 0
				BEGIN

				------------- PROVENTOS ---------------

					EXEC SP_REP_REMUNERADO @SALARIO_BRUTO, @RETORNO_REP_REMUNERADO OUTPUT

				----------------------------------------
					EXEC SP_G_ESCOLARIDADE @MATRICULA_ATUAL, @SALARIO_BRUTO, @RETORNO_ESCOLARIDADE OUTPUT

				----------------------------------------

					EXEC SP_AUXILIO_ALIMENTACAO @RETORNO_AUX_ALIMENTACAO OUTPUT

				----------------------------------------

					EXEC SP_SALARIO_FAMILIA @MATRICULA_ATUAL, @SALARIO_BRUTO, @RETORNO_SAL_FAMILIA OUTPUT

				----------------------------------------

					EXEC SP_CALCULAR_ANUENIO @MATRICULA_ATUAL, @RETORNO_ANUENIO OUTPUT

				----------------------------------------

					EXEC SP_VALE_CULTURA @RETORNO_VALE_CULTURA OUTPUT

				----------------------------------------
				------------- DESCONTOS ----------------

					EXEC SP_INSS @SALARIO_BRUTO, @RETORNO_INSS OUTPUT

				----------------------------------------

					EXEC SP_VALE_TRANSPORTE @MATRICULA_ATUAL, @SALARIO_BRUTO, @RETORNO_VALE_TRANSPORTE OUTPUT

				----------------------------------------

					EXEC SP_IMPOSTO_RENDA @MATRICULA_ATUAL, @SALARIO_BRUTO, @RETORNO_IRRF OUTPUT

				----------------------------------------

					EXEC SP_PLANO_SAUDE @MATRICULA_ATUAL, @SALARIO_BRUTO, @RETORNO_PLANO_SAUDE OUTPUT

				----------------------------------------
					
				-------------- CALCULOS ----------------
				----------------------------------------

					SET @TOTAL_PROVENTOS =	(@RETORNO_REP_REMUNERADO + 
											@RETORNO_ESCOLARIDADE + 
											@RETORNO_AUX_ALIMENTACAO + 
											@RETORNO_SAL_FAMILIA + 
											@RETORNO_ANUENIO + 
											@RETORNO_VALE_CULTURA)

					SET @TOTAL_DESCONTOS = (@RETORNO_INSS + 
											@RETORNO_VALE_TRANSPORTE + 
											@RETORNO_PLANO_SAUDE + 
											@RETORNO_IRRF)

					SET @SALARIO_LIQUIDO = (@SALARIO_BRUTO + @TOTAL_PROVENTOS)-@TOTAL_DESCONTOS

					EXEC SP_FGTS @TOTAL_PROVENTOS, @SALARIO_BRUTO, @RETORNO_FGTS OUTPUT


				----------- CONTRA-CHEQUE --------------
				----------------------------------------
					
					PRINT '____________________________________________________________________________________________________'

					PRINT '--------------------------------------COMPROVANTE DE PAGAMENTO--------------------------------------'

					PRINT '____________________________________________________________________________________________________'

					PRINT 'N° MATRICULA:									' + CAST(@MATRICULA_ATUAL AS VARCHAR(4))
					PRINT 'NOME:											' + CAST(@NOME_ATUAL AS VARCHAR(40))
					PRINT 'CPF:											' + CAST(@CPF_ATUAL AS VARCHAR(15))
					PRINT 'CARGO:											' + CAST(@DESC_CARGO_ATUAL AS VARCHAR(40)) 
					PRINT 'COD. CARGO:										' + CAST(@CARGO_ATUAL AS VARCHAR(1))

					PRINT '____________________________________________________________________________________________________'

					PRINT '-------------------------------------------- PROVENTOS ---------------------------------------------'

					PRINT '____________________________________________________________________________________________________'

					PRINT 'REPOUSO REMUNERADO:								' + CAST(@RETORNO_REP_REMUNERADO AS VARCHAR(40))
					PRINT 'GRATIFICAÇÃO ESCOLARIDADE:						' + CAST(@RETORNO_ESCOLARIDADE AS VARCHAR(40))
					PRINT 'AUXILIO ALIMENTAÇÃO:							' + CAST(@RETORNO_AUX_ALIMENTACAO AS VARCHAR(40))
					PRINT 'SALARIO FAMÍLIA:								' + CAST(@RETORNO_SAL_FAMILIA AS VARCHAR(40))
					PRINT 'ANUÊNIO:										' + CAST(@RETORNO_ANUENIO AS VARCHAR(40))
					PRINT 'VALE CULTURA:									' + CAST(@RETORNO_VALE_CULTURA AS VARCHAR(40))


					PRINT '____________________________________________________________________________________________________'

					PRINT '-------------------------------------------- DESCONTOS ---------------------------------------------'

					PRINT '____________________________________________________________________________________________________'

					PRINT 'INSS:											' + CAST(@RETORNO_INSS AS VARCHAR(40))
					PRINT 'VALE TRANPORTE:									' + CAST(@RETORNO_VALE_TRANSPORTE AS VARCHAR(40))
					PRINT 'IMPOSTO DE RENDA:								' + CAST(@RETORNO_IRRF AS VARCHAR(40))
					PRINT 'PLANO DE SAÚDE:									' + CAST(@RETORNO_PLANO_SAUDE AS VARCHAR(40))
				
					PRINT '____________________________________________________________________________________________________'

					PRINT '-----------------------------------------CALCULO DO SALÁRIO-----------------------------------------'

					PRINT '____________________________________________________________________________________________________'


					PRINT 'TOTAL DE PROVENTOS:		' + CAST(@TOTAL_PROVENTOS AS VARCHAR(40)) + '					TOTAL DE DESCONTOS:		'  + CAST(@TOTAL_DESCONTOS AS VARCHAR(40))

					PRINT '____________________________________________________________________________________________________'
					
					PRINT 'FGTS:											' + CAST(@RETORNO_FGTS AS VARCHAR(40))

					PRINT '____________________________________________________________________________________________________'

					PRINT 'SALARIO LIQUIDO:								' + CAST(@SALARIO_LIQUIDO AS VARCHAR(40))

					PRINT '____________________________________________________________________________________________________'
					PRINT '																										'
					PRINT '																										'
					PRINT '																										'


					FETCH NEXT FROM CURSOR_MAIN INTO @SALARIO_BRUTO, @CARGO_ATUAL, @DESC_CARGO_ATUAL, @NOME_ATUAL, @CPF_ATUAL, @MATRICULA_ATUAL
				END

			CLOSE CURSOR_MAIN
			DEALLOCATE CURSOR_MAIN
		END
	
END

EXEC SP_PRINCIPAL 1, '1010'
EXEC SP_PRINCIPAL 1, '1005'
EXEC SP_PRINCIPAL 0, '0000'

--DROP PROCEDURE SP_MAIN
--SELECT * FROM FUNCIONARIOS
--SELECT * FROM CARGOS 