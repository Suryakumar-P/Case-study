
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `dept_name` VARCHAR(45) NULL,
  `dept_location` VARCHAR(45) NULL,
  `facilities` VARCHAR(45) NULL,
  UNIQUE INDEX `dept_name_UNIQUE` (`dept_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`All_doctors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`All_doctors` (
  `Doct_id_No` VARCHAR(50) NOT NULL,
  `dept_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Doct_id_No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doc_Reg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doc_Reg` (
  `Doc_Id_No` VARCHAR(50) NULL,
  `Doc_name` VARCHAR(45) NULL,
  `Qualification` VARCHAR(45) NULL,
  `Salary` DOUBLE NULL,
  `EN_Time` TIME NULL,
  `EX_Time` TIME NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_NO` VARCHAR(45) NULL,
  `Date_Of_join` DATE NULL,
  INDEX `Doc_id_No_idx` (`Doc_Id_No` ASC) VISIBLE,
  CONSTRAINT `Doc_id_No`
    FOREIGN KEY (`Doc_Id_No`)
    REFERENCES `mydb`.`All_doctors` (`Doct_id_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doc_ON_Call`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doc_ON_Call` (
  `Doc_id_NO` VARCHAR(50) NULL,
  `Doc_name` VARCHAR(45) NULL,
  `Qualification` VARCHAR(45) NULL,
  `fees_per_cal` VARCHAR(45) NULL,
  `payment_due` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  INDEX `Doc_id_NO_idx` (`Doc_id_NO` ASC) VISIBLE,
  CONSTRAINT `Doc_id_NO`
    FOREIGN KEY (`Doc_id_NO`)
    REFERENCES `mydb`.`All_doctors` (`Doct_id_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient_Entry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient_Entry` (
  `Pat_no` VARCHAR(50) NOT NULL,
  `pat_name` VARCHAR(45) NULL,
  `chlup_date` DATE NULL,
  `Pat_age` FLOAT NULL,
  `gender` VARCHAR(10) NULL,
  `RFRG_CSTNT` VARCHAR(45) NULL,
  `DIAGNOSIS` VARCHAR(45) NULL,
  `RFD` VARCHAR(45) NULL,
  `ADDRESS` VARCHAR(45) NULL,
  `CITY` VARCHAR(45) NULL,
  `PH_NO` VARCHAR(45) NULL,
  `DEPARTMENT` VARCHAR(45) NULL,
  PRIMARY KEY (`Pat_no`),
  INDEX `DEPARTMENT_idx` (`DEPARTMENT` ASC) VISIBLE,
  CONSTRAINT `DEPARTMENT`
    FOREIGN KEY (`DEPARTMENT`)
    REFERENCES `mydb`.`Department` (`dept_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PAT_CHKUP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAT_CHKUP` (
  `PAT_NO` VARCHAR(50) NULL,
  `DOC_NO` VARCHAR(45) NULL,
  `DIAGNOSIS` VARCHAR(45) NULL,
  `STATUS` VARCHAR(45) NULL,
  `PAT_CHKUPcol` VARCHAR(450) NULL,
  `TREATMENT` VARCHAR(405) NULL,
  INDEX `PAT_NO_idx` (`PAT_NO` ASC) VISIBLE,
  INDEX `DOC_NO_idx` (`DOC_NO` ASC) VISIBLE,
  CONSTRAINT `PAT_NO`
    FOREIGN KEY (`PAT_NO`)
    REFERENCES `mydb`.`Patient_Entry` (`Pat_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DOC_NO`
    FOREIGN KEY (`DOC_NO`)
    REFERENCES `mydb`.`All_doctors` (`Doct_id_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ROOM_DETAILS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ROOM_DETAILS` (
  `ROOM_NO` VARCHAR(45) NOT NULL,
  `TYPE_STATUS` VARCHAR(45) NULL,
  `RM_DL_CRG` VARCHAR(45) NULL,
  `OTHER_CRG` VARCHAR(45) NULL,
  PRIMARY KEY (`ROOM_NO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PAT_ADMIT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAT_ADMIT` (
  `PAT_NO` VARCHAR(50) NULL,
  `ADV_PYMT` VARCHAR(45) NULL,
  `MODE_PYMT` VARCHAR(45) NULL,
  `ROOM_NO` VARCHAR(45) NULL,
  `DEPT_NAME` VARCHAR(45) NULL,
  `ADMITD_ON` DATETIME(30) NULL,
  `COND_ON` VARCHAR(45) NULL,
  `INVSTGTN_DN` VARCHAR(45) NULL,
  `TRMT_SOT` VARCHAR(45) NULL,
  INDEX `PAT_NO_idx` (`PAT_NO` ASC) VISIBLE,
  INDEX `DEPT_NAME_idx` (`DEPT_NAME` ASC) VISIBLE,
  INDEX `ROOM_NO_idx` (`ROOM_NO` ASC) VISIBLE,
  CONSTRAINT `PAT_NO`
    FOREIGN KEY (`PAT_NO`)
    REFERENCES `mydb`.`Patient_Entry` (`Pat_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DEPT_NAME`
    FOREIGN KEY (`DEPT_NAME`)
    REFERENCES `mydb`.`Department` (`dept_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ROOM_NO`
    FOREIGN KEY (`ROOM_NO`)
    REFERENCES `mydb`.`ROOM_DETAILS` (`ROOM_NO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PAT_DIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAT_DIS` (
  `PAT_NO` VARCHAR(50) NULL,
  `TR_ADVS` VARCHAR(45) NULL,
  `TR_GVN` VARCHAR(45) NULL,
  `MEDICINES` VARCHAR(45) NULL,
  `PYMT_GV` VARCHAR(45) NULL,
  `DIS_ON` DATETIME(30) NULL,
  INDEX `PAT_NO_idx` (`PAT_NO` ASC) VISIBLE,
  CONSTRAINT `PAT_NO`
    FOREIGN KEY (`PAT_NO`)
    REFERENCES `mydb`.`Patient_Entry` (`Pat_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PAT_REG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAT_REG` (
  `PAT_NO` VARCHAR(50) NULL,
  `DATE_VIS` DATETIME(30) NULL,
  `CONDITION` VARCHAR(45) NULL,
  `TREATMENT` VARCHAR(45) NULL,
  `MEDICENES` VARCHAR(45) NULL,
  `DOC_NO` VARCHAR(45) NULL,
  `PAYMT` VARCHAR(45) NULL,
  INDEX `PAT_NO_idx` (`PAT_NO` ASC) VISIBLE,
  INDEX `DOC_NO_idx` (`DOC_NO` ASC) VISIBLE,
  CONSTRAINT `PAT_NO`
    FOREIGN KEY (`PAT_NO`)
    REFERENCES `mydb`.`Patient_Entry` (`Pat_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DOC_NO`
    FOREIGN KEY (`DOC_NO`)
    REFERENCES `mydb`.`All_doctors` (`Doct_id_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PAT_OPR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAT_OPR` (
  `PAT_NO` VARCHAR(30) NULL,
  `DATE_OPR` DATETIME(30) NULL,
  `IN_COND` VARCHAR(405) NULL,
  `AFOP_COND` VARCHAR(450) NULL,
  `TY_OPERATION` VARCHAR(45) NULL,
  `MEDICINES` VARCHAR(450) NULL,
  `DOC_NO` VARCHAR(45) NULL,
  `OPTH_NO` VARCHAR(45) NULL,
  `OTHER_SUG` VARCHAR(45) NULL,
  INDEX `PAT_NO_idx` (`PAT_NO` ASC) VISIBLE,
  INDEX `DOC_NO_idx` (`DOC_NO` ASC) VISIBLE,
  CONSTRAINT `PAT_NO`
    FOREIGN KEY (`PAT_NO`)
    REFERENCES `mydb`.`Patient_Entry` (`Pat_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DOC_NO`
    FOREIGN KEY (`DOC_NO`)
    REFERENCES `mydb`.`All_doctors` (`Doct_id_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
