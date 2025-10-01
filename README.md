# Bike Store Inc – Desafio SQL (DBA 20240802)

Solução do desafio usando o modelo **Bike Store Inc** para responder perguntas de Marketing/Comercial com SQL.

## Objetivos
- Desenvolver consultas com `JOIN` (INNER/LEFT/RIGHT), `GROUP BY`, `COUNT` e agregações.
- Documentar como reproduzir os resultados.
- Entregar repositório versionado com instruções claras.

## Tecnologias
- SQL padrão. Testado em **PostgreSQL**.
- Testado via https://sqlfiddle.com/postgresql/online-compiler

## Tabelas utilizadas (resumo)
`customers`, `orders`, `order_items`, `products`, `brands`, `categories`, `stocks`, `stores`, `staffs`.

## Como instalar e executar
1. **Crie o schema** no SGBD de sua escolha:
   - PostgreSQL: executar `ddl/schema_postgres.sql`
   
2. **Carregue dados mínimos**: executar `data/seed_minimo.sql`
3. **Execute as consultas** em `consultas.sql` (estão numeradas e comentadas).
   - Para filtrar por marca na *Consulta 4b*, troque o literal `'Trek'` pela marca desejada.

## Consultas entregues
1. Clientes que **nunca** compraram  
2. Produtos **nunca** comprados  
3. Produtos **sem estoque**  
4a. Quantidade vendida por **Marca** e **Loja**  
4b. Quantidade vendida por **Loja** para **uma Marca específica**  
5. Funcionários **sem** pedidos

## Validação
- Consultas de ausência usam `LEFT JOIN ... IS NULL`.
- Agregações por dimensões solicitadas; `SUM(oi.quantity)`.
- Scripts de DDL e seed garantem execução rápida local.

## Estrutura
dll
data
/data/seed_minimo.sql
/ddl/schema_postgres.sql
amostras
/model.png
/.gitignore
/README.md
/consultas.sql





============================================================================================================================
# DBA Challenge 20240802


## Introdução

Nesse desafio trabalharemos utilizando a base de dados da empresa Bike Stores Inc com o objetivo de obter métricas relevantes para equipe de Marketing e Comercial.

Com isso, teremos que trabalhar com várioas consultas utilizando conceitos como `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `GROUP BY` e `COUNT`.

### Antes de começar
 
- O projeto deve utilizar a Linguagem específica na avaliação. Por exempo: SQL, T-SQL, PL/SQL e PSQL;
- Considere como deadline da avaliação a partir do início do teste. Caso tenha sido convidado a realizar o teste e não seja possível concluir dentro deste período, avise a pessoa que o convidou para receber instruções sobre o que fazer.
- Documentar todo o processo de investigação para o desenvolvimento da atividade (README.md no seu repositório); os resultados destas tarefas são tão importantes do que o seu processo de pensamento e decisões à medida que as completa, por isso tente documentar e apresentar os seus hipóteses e decisões na medida do possível.
 
 

## O projeto

- Criar as consultas utilizando a linguagem escolhida;
- Entregar o código gerado do Teste.

### Modelo de Dados:

Para entender o modelo, revisar o diagrama a seguir:

![<img src="samples/model.png" height="500" alt="Modelo" title="Modelo"/>](samples/model.png)


## Selects

Construir as seguintes consultas:

- Listar todos Clientes que não tenham realizado uma compra;
- Listar os Produtos que não tenham sido comprados
- Listar os Produtos sem Estoque;
- Agrupar a quantidade de vendas que uma determinada Marca por Loja. 
- Listar os Funcionarios que não estejam relacionados a um Pedido.

## Readme do Repositório

- Deve conter o título do projeto
- Uma descrição sobre o projeto em frase
- Deve conter uma lista com linguagem, framework e/ou tecnologias usadas
- Como instalar e usar o projeto (instruções)
- Não esqueça o [.gitignore](https://www.toptal.com/developers/gitignore)
- Se está usando github pessoal, referencie que é um challenge by coodesh:  

>  This is a challenge by [Coodesh](https://coodesh.com/)

## Finalização e Instruções para a Apresentação

1. Adicione o link do repositório com a sua solução no teste
2. Verifique se o Readme está bom e faça o commit final em seu repositório;
3. Envie e aguarde as instruções para seguir. Caso o teste tenha apresentação de vídeo, dentro da tela de entrega será possível gravar após adicionar o link do repositório. Sucesso e boa sorte. =)


## Suporte

Para tirar dúvidas sobre o processo envie uma mensagem diretamente a um especialista no chat da plataforma. 
