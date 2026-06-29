DROP TABLE IF EXISTS CATEGORIA, GELEIA;

CREATE TABLE CATEGORIA (
id SERIAL PRIMARY KEY,
nome VARCHAR (30) UNIQUE
);

CREATE TABLE GELEIA (
id SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
sabor VARCHAR(30) NOT NULL,
ingredientes VARCHAR(200),
descricao TEXT,
harmonizacao VARCHAR(100),
peso INT,
preco DECIMAL(6,2),
validade DATE,
imagem VARCHAR(255),
categoria_id INT,
FOREIGN KEY (categoria_id) REFERENCES CATEGORIA (id)
);

INSERT INTO CATEGORIA (nome)
VALUES ('Frutas Vermelhas'),('Tropicais'),('Tradicionais'),('Cítricas');

INSERT INTO GELEIA
(nome, sabor, ingredientes, descricao, harmonizacao, peso, preco, validade, imagem, categoria_id)

VALUES ('Entrepotes Morango','Morango','Morango, açúcar e limão','Geleia artesanal feita com morangos frescos e selecionados.','Torradas, cheesecake e iogurte',250,24.90,'2027-01-15','morango.png',1),
('Entrepotes Amora','Amora','Amora, açúcar e limão','Sabor intenso e levemente ácido, preparado de forma artesanal.','Pães, bolos e queijos',250,26.90,'2027-01-20','amora.png',1),
('Entrepotes Framboesa','Framboesa','Framboesa, açúcar e limão','Produzida com framboesas selecionadas para um sabor delicado.','Croissants e panquecas',250,29.90,'2027-01-18','framboesa.png',1),
('Entrepotes Laranja','Laranja','Laranja, açúcar e raspas de casca','Geleia refrescante com aroma natural de laranja.','Bolos e torradas',250,22.90,'2027-02-01','laranja.png',4),
('Entrepotes Sicilia','Limão Siciliano','Limão siciliano, açúcar','Combinação equilibrada entre doçura e acidez.','Biscoitos amanteigados e chás',250,27.90,'2027-02-10','sicilia.png',4),
('Entrepotes Manga','Manga','Manga, açúcar e limão','Textura cremosa e sabor tropical marcante.','Iogurtes e sobremesas',250,23.90,'2027-01-28','manga.png',2),
('Entrepotes Tropical','Abacaxi com Hortelã','Abacaxi, hortelã, açúcar','Refrescante e aromática, perfeita para dias quentes.','Torradas e drinks',250,25.90,'2027-02-12','tropical.png',2),
('Entrepotes Mineira','Goiaba','Goiaba, açúcar e limão','Receita tradicional brasileira com textura aveludada.','Queijo minas e torradas',250,24.50,'2027-01-30','mineira.png',2),
('Entrepotes Pimenta','Abacaxi com pimenta','Abacaxi, pimenta e açúcar','Sabor aconchegante inspirado em receitas caseiras.','Queijos e carnes',250,26.50,'2027-02-05','pimenta.png',3),
('Entrepotes Mirtilo','Mirtilo','Mirtilo, açúcar, suco de limão e pectina natural','Preparada lentamente para preservar o sabor natural da fruta.','Croissants, torradas, iogurte natural, cheesecake e queijo Brie',250,29.90,'2027-02-15','mirtilo.png',3);
