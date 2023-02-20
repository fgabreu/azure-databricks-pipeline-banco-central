-- 1 - CRIANDO O SCHEMA

CREATE SCHEMA [dolar_felipe_abreu]


-- 2 - CRIANDO A TABELA STAGE

CREATE TABLE [dolar_felipe_abreu].[dolar_stage_felipe_abreu](
	cotacaoCompra	VARCHAR(40),
	cotacaoVenda	VARCHAR(40),	
	dataHoraCotacao	VARCHAR(40))


-- 3 - CRIANDO A TABELA FINAL

CREATE TABLE [dolar_felipe_abreu].[dolar_final_felipe_abreu](
	cotacaoCompra	FLOAT,
	cotacaoVenda	FLOAT,	
	dataHoraCotacao	DATETIME)



-- 4 - CRIANDO A PROCEDURE

CREATE PROCEDURE [dolar_felipe_abreu].[converter_dolar_felipe_abreu]
AS
BEGIN

TRUNCATE TABLE [dolar_felipe_abreu].[dolar_final_felipe_abreu]

INSERT INTO [dolar_felipe_abreu].[dolar_final_felipe_abreu]
SELECT
	CAST((REPLACE(cotacaoCompra, ',', '.')) AS FLOAT) AS cotacaoCompra,
	CAST((REPLACE(cotacaoVenda,',', '.')) AS FLOAT) AS cotacaoVenda,
	CAST(dataHoraCotacao AS DATETIME) AS dataHoraCotacao
FROM
	[dolar_felipe_abreu].[dolar_stage_felipe_abreu];

TRUNCATE TABLE [dolar_felipe_abreu].[dolar_stage_felipe_abreu];  -- Para limpar a tabela stage

END
