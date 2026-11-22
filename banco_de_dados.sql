CREATE DATABASE IF NOT EXISTS controle_estoque;
USE controle_estoque;

CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL CHECK (preco > 0),
    estoque INT NOT NULL CHECK (estoque >= 0),
    fornecedor_id INT NOT NULL,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id)
);

-- 4 FORNECEDORES DIFERENTES
INSERT INTO fornecedores (nome, cnpj, email, telefone) VALUES
('Suco do Vale', '60.035.047/0001-12', 'contato@sucodovale.com', '87982061293'),
('Papelaria Central', '11.222.333/0001-81', 'vendas@papelariacentral.com', '87991234567'),
('Tech Import', '12.345.678/0001-95', 'contato@techimport.com', '87999887766'),
('Padaria Bom Pao', '04.520.010/0001-50', 'pedidos@bompao.com', '87991112233');

-- PRODUTOS DE CADA UM - OLHA O fornecedor_id
INSERT INTO produtos (nome, categoria, preco, estoque, fornecedor_id) VALUES
-- Fornecedor 1 = Suco do Vale
('Polpa de Maracuja', 'Sucos', 12.50, 100, 1),
('Polpa de Manga', 'Sucos', 10.00, 80, 1),
-- Fornecedor 2 = Papelaria
('Caderno 10 Materias', 'Papelaria', 25.90, 50, 2),
('Caneta Azul', 'Papelaria', 2.50, 200, 2),
-- Fornecedor 3 = Tech
('Mouse Sem Fio', 'Informatica', 59.90, 30, 3),
('Teclado Mecanico', 'Informatica', 189.90, 15, 3),
-- Fornecedor 4 = Padaria
('Pao de Forma', 'Padaria', 8.50, 40, 4),
('Bolo de Chocolate', 'Padaria', 35.00, 10, 4);

-- MOSTRA TUDO JUNTO COM O JOIN
SELECT p.nome AS produto, p.categoria, p.preco, p.estoque, f.nome AS fornecedor
FROM produtos p
JOIN fornecedores f ON p.fornecedor_id = f.id;

-- EXEMPLO DE UPDATE E DELETE SEM APAGAR TUDO
UPDATE produtos SET estoque = 90 WHERE id = 1;