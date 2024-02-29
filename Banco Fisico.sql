CREATE TABLE `aluno` (
  `id_Aluno` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Num_Matricula` decimal(10,0) DEFAULT NULL,
  `Estado_Matricula` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `aluno_has_curso` (
  `Aluno_id_Aluno` int(11) NOT NULL,
  `Curso_id_Curso` int(11) NOT NULL,
  PRIMARY KEY (`Aluno_id_Aluno`,`Curso_id_Curso`),
  KEY `fk_Aluno_has_Curso_Curso1_idx` (`Curso_id_Curso`),
  KEY `fk_Aluno_has_Curso_Aluno1_idx` (`Aluno_id_Aluno`),
  CONSTRAINT `fk_Aluno_has_Curso_Aluno1` FOREIGN KEY (`Aluno_id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Curso_Curso1` FOREIGN KEY (`Curso_id_Curso`) REFERENCES `curso` (`id_Curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `aluno_has_turma` (
  `Aluno_id_Aluno` int(11) NOT NULL,
  `Turma_id_Turma` int(11) NOT NULL,
  PRIMARY KEY (`Aluno_id_Aluno`,`Turma_id_Turma`),
  KEY `fk_Aluno_has_Turma_Turma1_idx` (`Turma_id_Turma`),
  KEY `fk_Aluno_has_Turma_Aluno1_idx` (`Aluno_id_Aluno`),
  CONSTRAINT `fk_Aluno_has_Turma_Aluno1` FOREIGN KEY (`Aluno_id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Turma_Turma1` FOREIGN KEY (`Turma_id_Turma`) REFERENCES `turma` (`id_Turma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `avaliação` (
  `id_Avaliacao` int(11) NOT NULL,
  `id_estudante` int(11) DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `Aluno_id_Aluno` int(11) NOT NULL,
  PRIMARY KEY (`id_Avaliacao`),
  KEY `fk_Avaliação_Aluno1_idx` (`Aluno_id_Aluno`),
  CONSTRAINT `fk_Avaliação_Aluno1` FOREIGN KEY (`Aluno_id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `coordenador` (
  `id_Coordenador` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `id_Curso` int(11) NOT NULL,
  PRIMARY KEY (`id_Coordenador`),
  KEY `fk_Coordenador_Curso1_idx` (`id_Curso`),
  CONSTRAINT `fk_Coordenador_Curso1` FOREIGN KEY (`id_Curso`) REFERENCES `curso` (`id_Curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `curso` (
  `id_Curso` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `duracao` decimal(10,0) DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `curso_has_disciplina` (
  `Curso_id_Curso` int(11) NOT NULL,
  `Disciplina_id_Disciplina` int(11) NOT NULL,
  PRIMARY KEY (`Curso_id_Curso`,`Disciplina_id_Disciplina`),
  KEY `fk_Curso_has_Disciplina_Disciplina1_idx` (`Disciplina_id_Disciplina`),
  KEY `fk_Curso_has_Disciplina_Curso1_idx` (`Curso_id_Curso`),
  CONSTRAINT `fk_Curso_has_Disciplina_Curso1` FOREIGN KEY (`Curso_id_Curso`) REFERENCES `curso` (`id_Curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Disciplina_Disciplina1` FOREIGN KEY (`Disciplina_id_Disciplina`) REFERENCES `disciplina` (`id_Disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `disciplina` (
  `id_Disciplina` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `carga_horaria` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_Disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pagamento` (
  `id_Pagamento` int(11) NOT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `taxa` decimal(10,0) DEFAULT NULL,
  `desconto` decimal(10,0) DEFAULT NULL,
  `Valor_Total` varchar(45) DEFAULT NULL,
  `Aluno_id_Aluno` int(11) NOT NULL,
  PRIMARY KEY (`id_Pagamento`),
  KEY `fk_Pagamento_Aluno1_idx` (`Aluno_id_Aluno`),
  CONSTRAINT `fk_Pagamento_Aluno1` FOREIGN KEY (`Aluno_id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `professor` (
  `id_Professor` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `especialidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `professor_has_disciplina` (
  `Professor_id_Professor` int(11) NOT NULL,
  `Disciplina_id_Disciplina` int(11) NOT NULL,
  PRIMARY KEY (`Professor_id_Professor`,`Disciplina_id_Disciplina`),
  KEY `fk_Professor_has_Disciplina_Disciplina1_idx` (`Disciplina_id_Disciplina`),
  KEY `fk_Professor_has_Disciplina_Professor_idx` (`Professor_id_Professor`),
  CONSTRAINT `fk_Professor_has_Disciplina_Disciplina1` FOREIGN KEY (`Disciplina_id_Disciplina`) REFERENCES `disciplina` (`id_Disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professor_has_Disciplina_Professor` FOREIGN KEY (`Professor_id_Professor`) REFERENCES `professor` (`id_Professor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `turma` (
  `id_Turma` int(11) NOT NULL,
  `ano` decimal(10,0) DEFAULT NULL,
  `semestre` decimal(10,0) DEFAULT NULL,
  `Curso_id_Curso` int(11) NOT NULL,
  PRIMARY KEY (`id_Turma`),
  KEY `fk_Turma_Curso1_idx` (`Curso_id_Curso`),
  CONSTRAINT `fk_Turma_Curso1` FOREIGN KEY (`Curso_id_Curso`) REFERENCES `curso` (`id_Curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
