-- Active: 1788283799476@@127.0.0.1@5432@catalogo_filmes
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW(),
    atualizado_em TIMESTAMP NULL
);


CREATE TABLE filmes (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    ano_lancamento DATE NOT NULL,
    genero VARCHAR(100) NOT NULL,
    nota DECIMAL(3,1) NULL CHECK (nota >= 0 AND nota <= 10),
    capa_url TEXT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW(),
    atualizado_em TIMESTAMP NULL,
    CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);




INSERT INTO usuarios (nome, email, senha) VALUES 
('Ana Souza', 'ana@email.com', 'senha123'),
('Carlos Silva', 'carlos@email.com', 'senha456'),
('Mariana Dias', 'mariana@email.com', 'senha789'),
('João Pedro', 'joao@email.com', 'senha321'),
('Fernanda Lima', 'fernanda@email.com', 'senha654');


INSERT INTO filmes (usuario_id, titulo, ano_lancamento, genero, nota, capa_url) VALUES 
(1, 'A Origem', '2010-07-16', 'Ficção Científica', 9.0, 'https://exemplo.com/origem.jpg'),
(2, 'O Poderoso Chefão', '1972-03-24', 'Drama', 9.2, 'https://exemplo.com/chefao.jpg'),
(3, 'Interestelar', '2014-11-06', 'Ficção Científica', 8.8, 'https://exemplo.com/interestelar.jpg'),
(4, 'Matrix', '1999-05-21', 'Ação', 8.7, 'https://exemplo.com/matrix.jpg'),
(5, 'O Senhor dos Anéis: A Sociedade do Anel', '2001-12-19', 'Fantasia', 9.1, 'https://exemplo.com/senhor.jpg');

SELECT * FROM usuarios;

SELECT * FROM filmes;
