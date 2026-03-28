# Data Pipeline Databricks API Banco Central
Projeto 02 Big Data - Azure 

Usando o Azure Databricks, crie um pipeline para coletar os valores do dólar da API do Banco Central e inserir essas informações no Azure SQL, conforme apresentado no desenho abaixo. No Azure SQL crie uma Stored Procedure para converte o tipo dos dados para data e float/money/decimal e depois retornar um arquivo (via Data Factory) PARQUET no Blob Azure. 

Arquitetura Proposta:

![ARQUITETURA2](https://user-images.githubusercontent.com/57818977/220190593-4ce2c19e-aa37-4f85-b0e4-7d2fc8d50bb9.png)

O link API do Banco Central com os valores do dólar: https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoDolarPeriodo(dataInicial=@dataInicial,dataFinalCotacao=@dataFinalCotacao)?@dataInicial='01-01-2019'&@dataFinalCotacao='12-31-2025'&$top=9000&$format=text/csv&$select=cotacaoCompra,cotacaoVenda,dataHoraCotacao

Estruturação do Projeto:

![DICIONARIO DE DADOS](https://user-images.githubusercontent.com/57818977/220191118-37c808a2-e5c2-436f-b73d-3b7821a538de.png)


To Do:

Azure SQL
Schemas:
- Criar uma tabela stage chamada schema.dolar_Stage_seu_nome com o tipo de dado Varchar;
- Os campos da tabela serão: cotacaoCompra, cotacaoVenda, dataHoraCotacao 
- Criar uma tabela final para receber os dados convertidos schema.dolar_final_seu_nome
- Criar uma procedure (qualquer nome) para popular a tabela final com os dados convertidos.

Databricks:
- Crie um algoritmo em Python para extrair os dados da API e inserir os dados no SQL Server. Você pode utilizar a biblioteca de sua preferencia.

Data Factory:
- Criar uma atividade de procedure para executar a procedure de conversão do Azure SQL;
- Criar uma atividade de copiar buscando os dados da tabela final com dados convertidos e salvar como PARQUET no blob.

RESULTADO FINAL PIPELINE AZURE DATAFACTORY:

![Pipeline-lab02](https://user-images.githubusercontent.com/57818977/220191189-ef2c9b01-57ef-44df-bb6a-fb7faf70e4ce.png)
