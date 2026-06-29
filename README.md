# 🍓 Entrepotes

Projeto de desenvolvimento web para consulta de geleias artesanais, permitindo visualizar os produtos disponíveis, uma tabela com informações sobre as geleias e filtrar por categorias.

---

## Sobre o projeto

A Entrepotes é uma marca fictícia de geleias artesanais criada para o projeto da disciplina de Desenvolvimento Web.

O sistema possui integração entre front-end, back-end e banco de dados PostgreSQL, realizando consultas aos produtos cadastrados através de rotas desenvolvidas em Node.js.

---

## Tecnologias utilizadas

- HTML
- CSS
- JavaScript
- Node.js
- Express
- PostgreSQL
- dotenv
- pg

---

## Banco de dados

O banco de dados é composto por duas tabelas relacionadas:

### Categoria

- id
- nome

### Geleia

- id
- nome
- sabor
- ingredientes
- descricao
- harmonizacao
- peso
- preco
- validade
- imagem
- categoria_id (foreign key)

As tabelas possuem relacionamento através da chave estrangeira **categoria_id**.

---

## Rotas da API

### Listar todas as geleias

```
GET /geleias
```
Retorna todas as geleias cadastradas.

---

### Buscar geleia por ID

```
GET /api/geleia/:id
```
Retorna os detalhes de uma geleia específica.

---

### Listar geleias por categoria

```
GET /categoria/:id
```
Retorna todas as geleias pertencentes à categoria selecionada.

---

## Funcionalidades

- Exibição das geleias em formato de cards
- Consulta de todas as geleias em tabela
- Filtro por categoria
- Consulta da API utilizando Fetch API
- Integração com banco de dados PostgreSQL

---

## Como executar

1. Clone o repositório

```
git clone https://github.com/julianacoga/juliana_2bim_entrepotes
```

2. Instale as dependências

npm install

3. Configure o arquivo `.env`

```
DB_HOST=
DB_PORT=
DB_NAME=
DB_USER=
DB_PASSWORD=
PORT=3001
```

4. Execute o servidor

```
node server.js
```

5. Abra o arquivo `inicio.html` no navegador.

---

## Desenvolvido por

Juliana Coga