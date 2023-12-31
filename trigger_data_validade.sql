CREATE DATABASE validade;

USE validade;

CREATE TABLE tb_produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255),
  marca VARCHAR(255),
  data_validade DATE
);

DELIMITER //

CREATE TRIGGER tg_validar_data_validade
BEFORE INSERT ON tb_produtos
FOR EACH ROW
BEGIN
    IF NEW.data_validade < '2023-11-06' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de validade vencida';
    END IF;
END //

DELIMITER ;

INSERT INTO tb_produtos (nome, marca, data_validade) 
VALUES ('Arroz', 'Tio João', '2023-10-01');

INSERT INTO tb_produtos (nome, marca, data_validade) 
VALUES ('Feijão', 'Camil', '2023-11-20');
