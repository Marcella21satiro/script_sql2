CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    CPF VARCHAR(11) UNIQUE NOT NULL,  -- CPF único e obrigatório
    Nome_Completo VARCHAR(100) NOT NULL  -- Nome completo do cliente
);

/*Inserção*/
INSERT INTO Cliente (ID_Cliente, Tipo_Cliente, CPF, Nome_Completo)
VALUES (1, 'PF', '12345678901', 'João Silva');

/*Seleção*/
SELECT Nome_Completo FROM Cliente WHERE Tipo_Cliente = 'PF';

/*Filtro com were*/
SELECT * FROM Ordem_Servico WHERE Status = 'Em Andamento';

/*Ordenação com ORDER BY:*/
SELECT Nome_Completo, CPF FROM Cliente
ORDER BY Nome_Completo;

/*Junções entre tabelas:*/
SELECT Cliente.Nome_Completo, Veículo.Modelo, Ordem_Servico.Data_Emissao
FROM Ordem_Servico
JOIN Cliente ON Ordem_Servico.ID_Cliente = Cliente.ID_Cliente
JOIN Veículo ON Ordem_Servico.ID_Veículo = Veículo.ID_Veículo;

/*Condições de filtro com HAVING:*/
SELECT ID_Cliente, COUNT(ID_Ordem_Servico) AS Total_Ordem_Servico
FROM Ordem_Servico
GROUP BY ID_Cliente
HAVING COUNT(ID_Ordem_Servico) > 5;

/*Atributos derivados:*/
SELECT ID_Cliente, Nome_Completo, COUNT(ID_Ordem_Servico) AS Total_Ordem_Servico
FROM Cliente
JOIN Ordem_Servico ON Cliente.ID_Cliente = Ordem_Servico.ID_Cliente
GROUP BY ID_Cliente;
