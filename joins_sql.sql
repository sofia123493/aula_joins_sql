
CREATE DATABASE livraria3D;
USE livraria3D;

-- Tabelas

CREATE TABLE autores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL
);

CREATE TABLE livros(
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE vendas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT,
    data_venda DATE,
    quantidade INT,
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

INSERT INTO autores (nome, nacionalidade) VALUES 
('Machado de Assis', 'Brasileiro'),
('J. K. Rowling', 'Britânica'),
('Georgee Orwell ', 'Britânica'),
('Autor Fantasma', 'Desconhecida');


INSERT INTO livros (titulo, preco, autor_id) VALUES
('Dom Casmurro', 39.90, 1),
('Harry Potter', 59.90, 2),
('1984', 45.00, 3),
('Livros sem Vendas', 22.00, 4),
('Livro sem autor', 10.00, null);


INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES
(1, '2025-06-01', 2),
(1, '2025-06-10', 1),
(2, '2025-06-03', 5),
(3, '2025-06-05', 1);


# INNER JOIN
-- Lista o livros com seus respectivos autores
SELECT
	livros.titulo, autores.nome
FROM 
	livros
INNER JOIN autores ON livros.autor_id = autores.id;

-- Pega o titulo da tabela de livros, e pega nome da tabela de autores
-- Os dados dos titilos vêm da tabela de livros
-- O ineer join inclui os dados de nome que vem da tabela dos autores, onde os id de autores e id de livros_autor são iguais

-- Alias
SELECT
	L.titulo, A.nome
FROM
	livros AS L
INNER JOIN autores AS A ON L.autor_id = A.id;
-- Faz a mesma cousa que  a outra versão, só tão inventando moda.



# LEFT JOIN
-- Lista os lisvros  e o total de vendas (mesmo os livros que não foram vendidos)
SELECT
	livros.titulo, vendas.quantidade
FROM
	livros
LEFT JOIN vendas ON livros.id = vendas.livro_id






































