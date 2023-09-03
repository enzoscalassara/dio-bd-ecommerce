-- Para executar o script várias vezes
drop database ecommerce;

-- DB ecommerce
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Tabela Clientes
CREATE TABLE Clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    TipoCliente ENUM('PF', 'PJ') NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE,
    CNPJ CHAR(14) UNIQUE,
    Endereco VARCHAR(255),
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20),
    DataCadastro DATE NOT NULL
);

-- Tabela Produtos
CREATE TABLE Produtos (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Infantil BOOLEAN DEFAULT FALSE,
    Avaliacao DECIMAL(3, 2),
    Preco DECIMAL(10, 2),
    Descricao TEXT,
    DataCadastro DATE NOT NULL,
    Estoque INT NOT NULL DEFAULT 0
);

-- Tabela Métodos de Pagamento
CREATE TABLE MetodosPagamento (
    idMetodoPagamento INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- Populando a tabela Métodos de Pagamento
INSERT INTO MetodosPagamento (Nome)
VALUES ('Cartão de Crédito'), ('Cartão de Débito'), ('Boleto'), ('PIX');

-- Tabela Pagamentos
CREATE TABLE Pagamentos (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idMetodoPagamento INT,
    Valor DECIMAL(10, 2),
    DataPagamento DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente),
    FOREIGN KEY (idMetodoPagamento) REFERENCES MetodosPagamento (idMetodoPagamento)
);

-- Tabela Pedidos
CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    Status VARCHAR(50) NOT NULL,
    Descricao TEXT,
    Frete DECIMAL(10, 2),
    DataPedido DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
);

-- Tabela CarrinhoCompras
CREATE TABLE CarrinhoCompras (
    idCarrinho INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    DataCriacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
);

-- Tabela ItensCarrinho
CREATE TABLE ItensCarrinho (
    idItemCarrinho INT AUTO_INCREMENT PRIMARY KEY,
    idCarrinho INT,
    idProduto INT,
    Quantidade INT,
    FOREIGN KEY (idCarrinho) REFERENCES CarrinhoCompras (idCarrinho),
    FOREIGN KEY (idProduto) REFERENCES Produtos (idProduto)
);

-- Tabela HistoricoPedidos
CREATE TABLE HistoricoPedidos (
    idHistoricoPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idPedido INT,
    DataCompra DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente),
    FOREIGN KEY (idPedido) REFERENCES Pedidos (idPedido)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    StatusEntrega VARCHAR(50) NOT NULL,
    CodigoRastreio VARCHAR(100),
    FOREIGN KEY (idPedido) REFERENCES Pedidos (idPedido)
);

-- Tabela Promoções
CREATE TABLE Promocoes (
    idPromocao INT AUTO_INCREMENT PRIMARY KEY,
    idProduto INT,
    Desconto DECIMAL(5, 2) NOT NULL,
    DataInicio DATE NOT NULL,
    DataFim DATE NOT NULL,
    FOREIGN KEY (idProduto) REFERENCES Produtos (idProduto)
);

-- Inserindo valores na tabela Clientes (PF)

INSERT INTO Clientes (TipoCliente, Nome, CPF, Endereco, Email, Telefone, DataCadastro)
VALUES
    ('PF', 'João Silva', '12345678901', 'Rua A, 123', 'joao@gmail.com', '(11) 1234-5678', '2023-01-15'),
    ('PF', 'Maria Santos', '98765432109', 'Avenida B, 456', 'maria@gmail.com', '(22) 9876-5432', '2023-02-20'),
    ('PF', 'Carlos Pereira', '56789012345', 'Rua C, 789', 'carlos@gmail.com', '(33) 5678-9012', '2023-03-25'),
    ('PF', 'Ana Oliveira', '34567890123', 'Avenida D, 101', 'ana@gmail.com', '(44) 3456-7890', '2023-04-10'),
    ('PF', 'Fernanda Costa', '89012345678', 'Rua E, 222', 'fernanda@gmail.com', '(55) 8901-2345', '2023-05-05'),
    ('PF', 'Ricardo Santos', '65432109876', 'Avenida F, 333', 'ricardo@gmail.com', '(66) 6543-2109', '2023-06-30'),
    ('PF', 'Lúcia Silva', '43210987654', 'Rua G, 444', 'lucia@gmail.com', '(77) 4321-0987', '2023-07-12'),
    ('PF', 'Pedro Oliveira', '23456789012', 'Avenida H, 555', 'pedro@gmail.com', '(88) 2345-6789', '2023-08-22'),
    ('PF', 'Mariana Pereira', '12345098765', 'Rua I, 666', 'mariana@gmail.com', '(99) 1234-5098', '2023-09-01'),
    ('PF', 'Lucas Costa', '78901234567', 'Avenida J, 777', 'lucas@gmail.com', '(00) 7890-1234', '2023-09-15');


-- Inserindo valores na tabela Clientes (PJ)

INSERT INTO Clientes (TipoCliente, Nome, CNPJ, Endereco, Email, Telefone, DataCadastro)
VALUES
    ('PJ', 'Empresa ABC Ltda', '12345678901234', 'Rua X, 123', 'empresaabc@gmail.com', '(11) 1234-5678', '2023-01-15'),
    ('PJ', 'Comércio XYZ S/A', '98765432109876', 'Avenida Y, 456', 'comercioxyz@gmail.com', '(22) 9876-5432', '2023-02-20'),
    ('PJ', 'Indústria 1234 Ltda', '56789012345678', 'Rua Z, 789', 'industria1234@gmail.com', '(33) 5678-9012', '2023-03-25'),
    ('PJ', 'Distribuidora QWERTY S/A', '34567890123456', 'Avenida W, 101', 'distribuidoraqwert@gmail.com', '(44) 3456-7890', '2023-04-10'),
    ('PJ', 'Transportadora ABCD Ltda', '89012345678901', 'Rua V, 222', 'transportadoraabcd@gmail.com', '(55) 8901-2345', '2023-05-05'),
    ('PJ', 'Consultoria 5678 Ltda', '65432109876543', 'Avenida U, 333', 'consultoria5678@gmail.com', '(66) 6543-2109', '2023-06-30'),
    ('PJ', 'Educação EFGH Ltda', '43210987654321', 'Rua T, 444', 'educacaoefgh@gmail.com', '(77) 4321-0987', '2023-07-12'),
    ('PJ', 'Saúde IJKL S/A', '23456789012345', 'Avenida S, 555', 'saudeijkl@gmail.com', '(88) 2345-6789', '2023-08-22'),
    ('PJ', 'Tecnologia MNOP Ltda', '12345098765432', 'Rua R, 666', 'tecnologiamnop@gmail.com', '(99) 1234-5098', '2023-09-01'),
    ('PJ', 'Varejo QRSTU Ltda', '78901234567890', 'Avenida P, 777', 'varejoqrstu@gmail.com', '(00) 7890-1234', '2023-09-15');


-- Inserindo valores na tabela Produtos

INSERT INTO Produtos (Nome, Categoria, Infantil, Avaliacao, Preco, Descricao, DataCadastro, Estoque)
VALUES
    ('Camiseta Preta', 'Vestuário', FALSE, 4.5, 29.99, 'Camiseta de algodão preta', '2023-01-15', 100),
    ('Tênis Esportivo', 'Calçados', FALSE, 4.8, 129.99, 'Tênis para esportes', '2023-02-20', 50),
    ('Brinquedo Educativo', 'Brinquedos', TRUE, 4.2, 19.99, 'Brinquedo para crianças', '2023-03-25', 200),
    ('Smartphone Android', 'Eletrônicos', FALSE, 4.6, 899.99, 'Smartphone com sistema Android', '2023-04-10', 30),
    ('Livro de Ficção', 'Livros', FALSE, 4.7, 19.99, 'Livro de ficção popular', '2023-05-05', 75),
    ('Mochila Escolar', 'Acessórios', TRUE, 4.3, 39.99, 'Mochila para escola', '2023-06-30', 60),
    ('Câmera Digital', 'Eletrônicos', FALSE, 4.9, 299.99, 'Câmera fotográfica digital', '2023-07-12', 20),
    ('Sapato Social', 'Calçados', FALSE, 4.4, 59.99, 'Sapato social masculino', '2023-08-22', 40),
    ('Bicicleta Infantil', 'Esportes', TRUE, 4.1, 149.99, 'Bicicleta para crianças', '2023-09-01', 15),
    ('Tablet Android', 'Eletrônicos', TRUE, 4.5, 199.99, 'Tablet com sistema Android', '2023-09-15', 25);


-- Inserindo valores na tabela MetodosPagamento

INSERT INTO MetodosPagamento (Nome)
VALUES
    ('Transferência Bancária'),
    ('Boleto'),
    ('Cartão de Crédito'),
    ('PIX'),
    ('Cartão de Débito');


-- Inserindo valores na tabela Pagamentos

INSERT INTO Pagamentos (idCliente, idMetodoPagamento, Valor, DataPagamento)
VALUES
    (1, 3, 49.99, '2023-01-20'),
    (2, 4, 129.99, '2023-02-22'),
    (3, 3, 29.99, '2023-03-25'),
    (4, 2, 899.99, '2023-04-12'),
    (5, 3, 19.99, '2023-05-08'),
    (6, 1, 39.99, '2023-06-30'),
    (7, 3, 299.99, '2023-07-15'),
    (8, 5, 59.99, '2023-08-28'),
    (9, 4, 149.99, '2023-09-05'),
    (10, 3, 199.99, '2023-09-16');


-- Inserindo valores na tabela Pedidos

INSERT INTO Pedidos (idCliente, Status, Descricao, Frete, DataPedido)
VALUES
    (1, 'Em Processamento', 'Pedido em processamento.', 12.99, '2023-01-21'),
    (2, 'Entregue', 'Pedido entregue com sucesso.', 9.99, '2023-02-25'),
    (3, 'Em Processamento', 'Pedido em processamento.', 7.99, '2023-03-28'),
    (4, 'Entregue', 'Pedido entregue com sucesso.', 14.99, '2023-04-15'),
    (5, 'Em Processamento', 'Pedido em processamento.', 10.99, '2023-05-10'),
    (6, 'Entregue', 'Pedido entregue com sucesso.', 16.99, '2023-07-02'),
    (7, 'Em Processamento', 'Pedido em processamento.', 19.99, '2023-07-18'),
    (8, 'Entregue', 'Pedido entregue com sucesso.', 22.99, '2023-08-30'),
    (9, 'Em Processamento', 'Pedido em processamento.', 8.99, '2023-09-08'),
    (10, 'Entregue', 'Pedido entregue com sucesso.', 11.99, '2023-09-20');


-- Inserindo valores na tabela CarrinhoCompras

INSERT INTO CarrinhoCompras (idCliente, DataCriacao)
VALUES
    (1, '2023-01-21 14:30:00'),
    (2, '2023-02-25 15:45:00'),
    (3, '2023-03-28 16:20:00'),
    (4, '2023-04-15 10:10:00'),
    (5, '2023-05-10 12:05:00'),
    (6, '2023-07-02 09:30:00'),
    (7, '2023-07-18 13:15:00'),
    (8, '2023-08-30 11:40:00'),
    (9, '2023-09-08 17:55:00'),
    (10, '2023-09-20 18:30:00');


-- Inserindo valores na tabela ItensCarrinho

INSERT INTO ItensCarrinho (idCarrinho, idProduto, Quantidade)
VALUES
    (1, 1, 2),
    (2, 3, 1),
    (3, 5, 3),
    (4, 7, 2),
    (5, 9, 4),
    (6, 2, 1),
    (7, 4, 2),
    (8, 6, 1),
    (9, 8, 3),
    (10, 10, 2);


-- Inserindo valores na tabela HistoricoPedidos

INSERT INTO HistoricoPedidos (idCliente, idPedido, DataCompra)
VALUES
    (1, 1, '2023-01-22 16:45:00'),
    (2, 2, '2023-02-26 17:30:00'),
    (3, 3, '2023-03-29 18:15:00'),
    (4, 4, '2023-04-16 14:20:00'),
    (5, 5, '2023-05-11 12:10:00'),
    (6, 6, '2023-07-03 10:25:00'),
    (7, 7, '2023-07-19 11:50:00'),
    (8, 8, '2023-08-31 09:40:00'),
    (9, 9, '2023-09-09 15:55:00'),
    (10, 10, '2023-09-21 16:40:00');


-- Inserindo valores na tabela Entrega

INSERT INTO Entrega (idPedido, StatusEntrega, CodigoRastreio)
VALUES
    (1, 'Em Trânsito', 'ABC123'),
    (2, 'Entregue', 'XYZ456'),
    (3, 'Em Trânsito', 'LMN789'),
    (4, 'Entregue', 'PQR101'),
    (5, 'Em Trânsito', 'DEF202'),
    (6, 'Entregue', 'GHI303'),
    (7, 'Em Trânsito', 'JKL404'),
    (8, 'Entregue', 'STU505'),
    (9, 'Em Trânsito', 'VWX606'),
    (10, 'Entregue', 'NOP707');


-- Inserindo valores na tabela Promocoes

INSERT INTO Promocoes (idProduto, Desconto, DataInicio, DataFim)
VALUES
    (1, 10.00, '2023-01-15', '2023-01-31'),
    (3, 15.00, '2023-02-01', '2023-02-28'),
    (5, 8.00, '2023-03-01', '2023-03-31'),
    (7, 12.00, '2023-04-01', '2023-04-30'),
    (9, 5.00, '2023-05-01', '2023-05-31'),
    (2, 10.00, '2023-06-01', '2023-06-30'),
    (4, 15.00, '2023-07-01', '2023-07-31'),
    (6, 8.00, '2023-08-01', '2023-08-31'),
    (8, 12.00, '2023-09-01', '2023-09-30'),
    (10, 5.00, '2023-09-01', '2023-09-30');


-- Quantos pedidos foram feitos por cada cliente?

SELECT C.Nome AS NomeCliente, COUNT(P.idPedido) AS TotalPedidos
FROM Clientes C
LEFT JOIN Pedidos P ON C.idCliente = P.idCliente
GROUP BY C.idCliente, C.Nome;

-- Quais são os produtos em estoque?

SELECT Nome, Estoque
FROM Produtos
WHERE Estoque > 0;

-- Qual é o total de vendas para cada método de pagamento?

SELECT MP.Nome AS MetodoPagamento, SUM(Valor) AS TotalVendas
FROM MetodosPagamento MP
LEFT JOIN Pagamentos P ON MP.idMetodoPagamento = P.idMetodoPagamento
GROUP BY MP.idMetodoPagamento, MP.Nome;

-- Quais são os produtos em promoção atualmente?

SELECT Pr.Nome AS Produto, Pr.Preco, Promo.Desconto
FROM Produtos Pr
INNER JOIN Promocoes Promo ON Pr.idProduto = Promo.idProduto
WHERE CURDATE() BETWEEN Promo.DataInicio AND Promo.DataFim;

-- Quantos pedidos estão em trânsito?

SELECT COUNT(*) AS PedidosEmTransito
FROM Pedidos P
INNER JOIN Entrega E ON P.idPedido = E.idPedido
WHERE E.StatusEntrega = 'Em Trânsito';


-- Quais clientes fizeram compras nos últimos 30 dias?

SELECT DISTINCT C.Nome AS NomeCliente
FROM Clientes C
INNER JOIN HistoricoPedidos HP ON C.idCliente = HP.idCliente
WHERE HP.DataCompra >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Total de vendas por método de pagamento:

SELECT mp.Nome AS MetodoPagamento, SUM(p.Valor) AS TotalVendas
FROM Pagamentos AS p
INNER JOIN MetodosPagamento AS mp ON p.idMetodoPagamento = mp.idMetodoPagamento
GROUP BY mp.Nome
ORDER BY TotalVendas DESC;

-- Clientes que mais compraram:

SELECT c.Nome AS NomeCliente, COUNT(hp.idPedido) AS NumeroCompras
FROM Clientes AS c
LEFT JOIN HistoricoPedidos AS hp ON c.idCliente = hp.idCliente
GROUP BY c.Nome
ORDER BY NumeroCompras DESC;
