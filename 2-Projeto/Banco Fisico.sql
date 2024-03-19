CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `id_Professor` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Professor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `id_Curso` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `duracao` DECIMAL NULL,
  `valor` DECIMAL NULL,
  PRIMARY KEY (`id_Curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Coordenador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Coordenador` (
  `id_Coordenador` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `id_Curso` INT NOT NULL,
  PRIMARY KEY (`id_Coordenador`),
  INDEX `fk_Coordenador_Curso1_idx` (`id_Curso` ASC) ,
  CONSTRAINT `fk_Coordenador_Curso1`
    FOREIGN KEY (`id_Curso`)
    REFERENCES `mydb`.`Curso` (`id_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `id_Aluno` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Num_Matricula` DECIMAL NULL,
  `Estado_Matricula` VARCHAR(45) NULL,
  `Secretária_id_Secretária` INT NOT NULL,
  `Secretária_id_Secretária1` INT NOT NULL,
  PRIMARY KEY (`id_Aluno`, `Secretária_id_Secretária1`),
  INDEX `fk_Aluno_Secretária1_idx` (`Secretária_id_Secretária1` ASC) ,
  CONSTRAINT `fk_Aluno_Secretária1`
    FOREIGN KEY (`Secretária_id_Secretária1`)
    REFERENCES `mydb`.`Secretária` (`id_Secretária`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Turma` (
  `id_Turma` INT NOT NULL,
  `ano` DECIMAL NULL,
  `semestre` DECIMAL NULL,
  `Curso_id_Curso` INT NOT NULL,
  PRIMARY KEY (`id_Turma`),
  INDEX `fk_Turma_Curso1_idx` (`Curso_id_Curso` ASC) ,
  CONSTRAINT `fk_Turma_Curso1`
    FOREIGN KEY (`Curso_id_Curso`)
    REFERENCES `mydb`.`Curso` (`id_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplina` (
  `id_Disciplina` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `carga_horaria` DECIMAL NULL,
  PRIMARY KEY (`id_Disciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Secretária`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Secretária` (
  `id_Secretária` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Secretária`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `id_Aluno` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Num_Matricula` DECIMAL NULL,
  `Estado_Matricula` VARCHAR(45) NULL,
  `Secretária_id_Secretária` INT NOT NULL,
  `Secretária_id_Secretária1` INT NOT NULL,
  PRIMARY KEY (`id_Aluno`, `Secretária_id_Secretária1`),
  INDEX `fk_Aluno_Secretária1_idx` (`Secretária_id_Secretária1` ASC) ,
  CONSTRAINT `fk_Aluno_Secretária1`
    FOREIGN KEY (`Secretária_id_Secretária1`)
    REFERENCES `mydb`.`Secretária` (`id_Secretária`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Avaliação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliação` (
  `id_Avaliacao` INT NOT NULL,
  `id_estudante` INT NULL,
  `valor` DECIMAL NULL,
  `data` DATE NULL,
  `Aluno_id_Aluno` INT NOT NULL,
  PRIMARY KEY (`id_Avaliacao`),
  INDEX `fk_Avaliação_Aluno1_idx` (`Aluno_id_Aluno` ASC) ,
  CONSTRAINT `fk_Avaliação_Aluno1`
    FOREIGN KEY (`Aluno_id_Aluno`)
    REFERENCES `mydb`.`Aluno` (`id_Aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagamento` (
  `id_Pagamento` INT NOT NULL,
  `valor` DECIMAL NULL,
  `data` DATE NULL,
  `taxa` DECIMAL NULL,
  `desconto` DECIMAL NULL,
  `Valor_Total` VARCHAR(45) NULL,
  `Aluno_id_Aluno` INT NOT NULL,
  PRIMARY KEY (`id_Pagamento`),
  INDEX `fk_Pagamento_Aluno1_idx` (`Aluno_id_Aluno` ASC) ,
  CONSTRAINT `fk_Pagamento_Aluno1`
    FOREIGN KEY (`Aluno_id_Aluno`)
    REFERENCES `mydb`.`Aluno` (`id_Aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor_has_Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor_has_Disciplina` (
  `Professor_id_Professor` INT NOT NULL,
  `Disciplina_id_Disciplina` INT NOT NULL,
  PRIMARY KEY (`Professor_id_Professor`, `Disciplina_id_Disciplina`),
  INDEX `fk_Professor_has_Disciplina_Disciplina1_idx` (`Disciplina_id_Disciplina` ASC) ,
  INDEX `fk_Professor_has_Disciplina_Professor_idx` (`Professor_id_Professor` ASC) ,
  CONSTRAINT `fk_Professor_has_Disciplina_Professor`
    FOREIGN KEY (`Professor_id_Professor`)
    REFERENCES `mydb`.`Professor` (`id_Professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professor_has_Disciplina_Disciplina1`
    FOREIGN KEY (`Disciplina_id_Disciplina`)
    REFERENCES `mydb`.`Disciplina` (`id_Disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Curso_has_Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso_has_Disciplina` (
  `Curso_id_Curso` INT NOT NULL,
  `Disciplina_id_Disciplina` INT NOT NULL,
  PRIMARY KEY (`Curso_id_Curso`, `Disciplina_id_Disciplina`),
  INDEX `fk_Curso_has_Disciplina_Disciplina1_idx` (`Disciplina_id_Disciplina` ASC) ,
  INDEX `fk_Curso_has_Disciplina_Curso1_idx` (`Curso_id_Curso` ASC) ,
  CONSTRAINT `fk_Curso_has_Disciplina_Curso1`
    FOREIGN KEY (`Curso_id_Curso`)
    REFERENCES `mydb`.`Curso` (`id_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Disciplina_Disciplina1`
    FOREIGN KEY (`Disciplina_id_Disciplina`)
    REFERENCES `mydb`.`Disciplina` (`id_Disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno_has_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno_has_Curso` (
  `Aluno_id_Aluno` INT NOT NULL,
  `Curso_id_Curso` INT NOT NULL,
  PRIMARY KEY (`Aluno_id_Aluno`, `Curso_id_Curso`),
  INDEX `fk_Aluno_has_Curso_Curso1_idx` (`Curso_id_Curso` ASC) ,
  INDEX `fk_Aluno_has_Curso_Aluno1_idx` (`Aluno_id_Aluno` ASC) ,
  CONSTRAINT `fk_Aluno_has_Curso_Aluno1`
    FOREIGN KEY (`Aluno_id_Aluno`)
    REFERENCES `mydb`.`Aluno` (`id_Aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Curso_Curso1`
    FOREIGN KEY (`Curso_id_Curso`)
    REFERENCES `mydb`.`Curso` (`id_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno_has_Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno_has_Turma` (
  `Aluno_id_Aluno` INT NOT NULL,
  `Turma_id_Turma` INT NOT NULL,
  PRIMARY KEY (`Aluno_id_Aluno`, `Turma_id_Turma`),
  INDEX `fk_Aluno_has_Turma_Turma1_idx` (`Turma_id_Turma` ASC) ,
  INDEX `fk_Aluno_has_Turma_Aluno1_idx` (`Aluno_id_Aluno` ASC) ,
  CONSTRAINT `fk_Aluno_has_Turma_Aluno1`
    FOREIGN KEY (`Aluno_id_Aluno`)
    REFERENCES `mydb`.`Aluno` (`id_Aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Turma_Turma1`
    FOREIGN KEY (`Turma_id_Turma`)
    REFERENCES `mydb`.`Turma` (`id_Turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
