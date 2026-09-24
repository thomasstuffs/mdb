-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/09/2026 às 13:50
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_appscholar`
--
CREATE DATABASE IF NOT EXISTS `bd_appscholar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_appscholar`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE `aluno` (
  `id_aluno` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno_responsavel`
--

DROP TABLE IF EXISTS `aluno_responsavel`;
CREATE TABLE `aluno_responsavel` (
  `id_aluno` int(11) NOT NULL,
  `id_responsavel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
CREATE TABLE `avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `id_disciplina` int(11) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `data_avaliacao` date DEFAULT NULL,
  `valor` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `boletim`
--

DROP TABLE IF EXISTS `boletim`;
CREATE TABLE `boletim` (
  `id_boletim` int(11) NOT NULL,
  `id_matricula` int(11) DEFAULT NULL,
  `media_final` decimal(4,2) DEFAULT NULL,
  `situacao_final` varchar(30) DEFAULT NULL,
  `frequencia_final` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coordenador`
--

DROP TABLE IF EXISTS `coordenador`;
CREATE TABLE `coordenador` (
  `id_coordenador` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `formacao` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `duracao` varchar(50) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `id_coordenador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE `disciplina` (
  `id_disciplina` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `frequencia`
--

DROP TABLE IF EXISTS `frequencia`;
CREATE TABLE `frequencia` (
  `id_frequencia` int(11) NOT NULL,
  `id_matricula` int(11) DEFAULT NULL,
  `percentual_frequencia` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE `matricula` (
  `id_matricula` int(11) NOT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `id_turma` int(11) DEFAULT NULL,
  `data_matricula` date DEFAULT NULL,
  `situacao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nota`
--

DROP TABLE IF EXISTS `nota`;
CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_matricula` int(11) DEFAULT NULL,
  `id_avaliacao` int(11) DEFAULT NULL,
  `nota` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE `professor` (
  `id_professor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `formacao` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `responsavel`
--

DROP TABLE IF EXISTS `responsavel`;
CREATE TABLE `responsavel` (
  `id_responsavel` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `parentesco` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

DROP TABLE IF EXISTS `turma`;
CREATE TABLE `turma` (
  `id_turma` int(11) NOT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `ano_letivo` year(4) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `sala` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id_aluno`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `aluno_responsavel`
--
ALTER TABLE `aluno_responsavel`
  ADD PRIMARY KEY (`id_aluno`,`id_responsavel`),
  ADD KEY `id_responsavel` (`id_responsavel`);

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices de tabela `boletim`
--
ALTER TABLE `boletim`
  ADD PRIMARY KEY (`id_boletim`),
  ADD UNIQUE KEY `id_matricula` (`id_matricula`);

--
-- Índices de tabela `coordenador`
--
ALTER TABLE `coordenador`
  ADD PRIMARY KEY (`id_coordenador`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `id_coordenador` (`id_coordenador`);

--
-- Índices de tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id_disciplina`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_professor` (`id_professor`);

--
-- Índices de tabela `frequencia`
--
ALTER TABLE `frequencia`
  ADD PRIMARY KEY (`id_frequencia`),
  ADD UNIQUE KEY `id_matricula` (`id_matricula`);

--
-- Índices de tabela `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `id_aluno` (`id_aluno`),
  ADD KEY `id_turma` (`id_turma`);

--
-- Índices de tabela `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_matricula` (`id_matricula`),
  ADD KEY `id_avaliacao` (`id_avaliacao`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id_professor`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD PRIMARY KEY (`id_responsavel`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `id_curso` (`id_curso`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `boletim`
--
ALTER TABLE `boletim`
  MODIFY `id_boletim` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `coordenador`
--
ALTER TABLE `coordenador`
  MODIFY `id_coordenador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `frequencia`
--
ALTER TABLE `frequencia`
  MODIFY `id_frequencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `responsavel`
--
ALTER TABLE `responsavel`
  MODIFY `id_responsavel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno_responsavel`
--
ALTER TABLE `aluno_responsavel`
  ADD CONSTRAINT `aluno_responsavel_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  ADD CONSTRAINT `aluno_responsavel_ibfk_2` FOREIGN KEY (`id_responsavel`) REFERENCES `responsavel` (`id_responsavel`);

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`);

--
-- Restrições para tabelas `boletim`
--
ALTER TABLE `boletim`
  ADD CONSTRAINT `boletim_ibfk_1` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`);

--
-- Restrições para tabelas `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_coordenador`) REFERENCES `coordenador` (`id_coordenador`);

--
-- Restrições para tabelas `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `disciplina_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`);

--
-- Restrições para tabelas `frequencia`
--
ALTER TABLE `frequencia`
  ADD CONSTRAINT `frequencia_ibfk_1` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`);

--
-- Restrições para tabelas `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`);

--
-- Restrições para tabelas `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_avaliacao`) REFERENCES `avaliacao` (`id_avaliacao`);

--
-- Restrições para tabelas `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
