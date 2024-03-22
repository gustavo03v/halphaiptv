-- Script SQL para criar um banco de dados IPTV básico

-- Criação da tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    nivel_acesso INT NOT NULL
);

-- Criação da tabela de canais
CREATE TABLE canais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_canal VARCHAR(100) NOT NULL,
    url_streaming VARCHAR(255) NOT NULL,
    categoria VARCHAR(50)
);

-- Criação da tabela de EPG
CREATE TABLE epg (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_canal INT,
    titulo_programa VARCHAR(100) NOT NULL,
    descricao TEXT,
    inicio DATETIME NOT NULL,
    fim DATETIME NOT NULL,
    FOREIGN KEY (id_canal) REFERENCES canais(id)
);

-- Criação da tabela de controle parental
CREATE TABLE controle_parental (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_canal INT,
    restricao BOOLEAN NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_canal) REFERENCES canais(id)
);
