
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema job_portal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema job_portal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `job_portal` ;
USE `job_portal` ;

-- -----------------------------------------------------
-- Table `job_portal`.`regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`regions` (
  `region_id` VARCHAR(4) NOT NULL,
  `region_name` VARCHAR(15) NOT NULL,
  `last_updated_by` VARCHAR(45) NULL,
  `last_updated_date` DATE NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE INDEX `region_id_UNIQUE` (`region_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`countries` (
  `country_cd` VARCHAR(4) NOT NULL,
  `country_name` VARCHAR(45) NOT NULL,
  `region_id` VARCHAR(4) NOT NULL,
  `last_updated_by` VARCHAR(45) NULL,
  `last_updated_date` DATE NULL,
  PRIMARY KEY (`country_cd`),
  UNIQUE INDEX `countries_cd_UNIQUE` (`country_cd` ASC) VISIBLE,
  UNIQUE INDEX `country_name_UNIQUE` (`country_name` ASC) VISIBLE,
  INDEX `fk_countries_regions_idx` (`region_id` ASC) VISIBLE,
  CONSTRAINT `fk_countries_regions`
    FOREIGN KEY (`region_id`)
    REFERENCES `job_portal`.`regions` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`departments` (
  `dept_id` INT NOT NULL,
  `dept_name` VARCHAR(45) NULL,
  `last_updated_by` VARCHAR(45) NULL,
  `last_updated_date` DATE NULL,
  PRIMARY KEY (`dept_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`job_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`job_types` (
  `job_type_cd` INT NOT NULL,
  `job_type_name` VARCHAR(25) NULL,
  `last_updated_date` DATE NULL,
  `last_updated_by` VARCHAR(45) NULL,
  PRIMARY KEY (`job_type_cd`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`job_status_codes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`job_status_codes` (
  `job_status_cd` INT NOT NULL,
  `status_desc` VARCHAR(10) NULL,
  `last_updated_by` VARCHAR(45) NULL,
  `last_updated_date` DATE NULL,
  PRIMARY KEY (`job_status_cd`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`appl_status_codes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`appl_status_codes` (
  `appl_status_cd` INT NOT NULL,
  `status_desc` VARCHAR(20) NULL,
  `last_updated_by` VARCHAR(45) NULL,
  `last_updated_date` DATE NULL,
  PRIMARY KEY (`appl_status_cd`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`education_levels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`education_levels` (
  `edu_level_cd` INT NOT NULL,
  `edu_level_name` VARCHAR(20) NULL,
  `last_updated_by` VARCHAR(45) NULL,
  `last_updated_date` DATE NULL,
  PRIMARY KEY (`edu_level_cd`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`education_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`education_type` (
  `education_type_cd` INT NOT NULL,
  `edu_type_name` VARCHAR(10) NULL,
  `last_updated_by` VARCHAR(45) NULL,
  `last_updated_date` DATE NULL,
  PRIMARY KEY (`education_type_cd`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`jobs` (
  `job_id` INT NOT NULL AUTO_INCREMENT,
  `job_title` VARCHAR(45) NULL,
  `job_desc` VARCHAR(4000) NULL,
  `job_type_cd` INT NULL,
  `dept_id` INT NULL,
  `country_cd` VARCHAR(4) NULL,
  `job_status_cd` INT NULL,
  `date_opened` DATE NULL,
  `date_closed` DATE NULL,
  `last_updated_by` VARCHAR(45) NULL,
  `last_update_date` DATE NULL,
  PRIMARY KEY (`job_id`),
  INDEX `fk_jobs_job_types1_idx` (`job_type_cd` ASC) VISIBLE,
  INDEX `fk_jobs_departments1_idx` (`dept_id` ASC) VISIBLE,
  INDEX `fk_jobs_countries1_idx` (`country_cd` ASC) VISIBLE,
  INDEX `fk_jobs_job_status_codes1_idx` (`job_status_cd` ASC) VISIBLE,
  CONSTRAINT `fk_jobs_job_types1`
    FOREIGN KEY (`job_type_cd`)
    REFERENCES `job_portal`.`job_types` (`job_type_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jobs_departments1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `job_portal`.`departments` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jobs_countries1`
    FOREIGN KEY (`country_cd`)
    REFERENCES `job_portal`.`countries` (`country_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jobs_job_status_codes1`
    FOREIGN KEY (`job_status_cd`)
    REFERENCES `job_portal`.`job_status_codes` (`job_status_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`applicants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`applicants` (
  `appl_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NULL,
  `last_name` VARCHAR(20) NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(10) NULL,
  `address` VARCHAR(100) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(6) NULL,
  `country_cd` VARCHAR(4) NULL,
  `edu_level_cd` INT NULL,
  `appl_status_cd` INT NULL,
  `edu_type_cd` INT NULL,
  `resume_file_name` VARCHAR(45) NULL,
  `cover_letter_text` VARCHAR(45) NULL,
  `date_applied` DATE NULL,
  `employed_flag` TINYINT NULL,
  `current_employer_name` VARCHAR(45) NULL,
  `years_of_exp` INT NULL,
  `last_updated_date` DATE NULL,
  `last_updated_by` VARCHAR(45) NULL,
  PRIMARY KEY (`appl_id`),
  INDEX `fk_applicants_countries1_idx` (`country_cd` ASC) VISIBLE,
  INDEX `fk_applicants_education_levels1_idx` (`edu_level_cd` ASC) VISIBLE,
  INDEX `fk_applicants_appl_status_codes1_idx` (`appl_status_cd` ASC) VISIBLE,
  INDEX `fk_applicants_education_type1_idx` (`edu_type_cd` ASC) VISIBLE,
  CONSTRAINT `fk_applicants_countries1`
    FOREIGN KEY (`country_cd`)
    REFERENCES `job_portal`.`countries` (`country_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_applicants_education_levels1`
    FOREIGN KEY (`edu_level_cd`)
    REFERENCES `job_portal`.`education_levels` (`edu_level_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_applicants_appl_status_codes1`
    FOREIGN KEY (`appl_status_cd`)
    REFERENCES `job_portal`.`appl_status_codes` (`appl_status_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_applicants_education_type1`
    FOREIGN KEY (`edu_type_cd`)
    REFERENCES `job_portal`.`education_type` (`education_type_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_portal`.`applicant_jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_portal`.`applicant_jobs` (
  `appl_id` INT NOT NULL,
  `job_id` INT NOT NULL,
  `appl_status_cd` INT NULL,
  `date_applied` DATE NULL,
  `written_test_date` DATE NULL,
  `interview1_date` DATE NULL,
  `interview2_date` DATE NULL,
  `last_updated_by` VARCHAR(45) NULL,
  `last_updated_date` DATE NULL,
  PRIMARY KEY (`appl_id`, `job_id`),
  INDEX `fk_applicant_jobs_jobs1_idx` (`job_id` ASC) VISIBLE,
  INDEX `fk_applicant_jobs_appl_status_codes1_idx` (`appl_status_cd` ASC) VISIBLE,
  CONSTRAINT `fk_applicant_jobs_applicants1`
    FOREIGN KEY (`appl_id`)
    REFERENCES `job_portal`.`applicants` (`appl_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_applicant_jobs_jobs1`
    FOREIGN KEY (`job_id`)
    REFERENCES `job_portal`.`jobs` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_applicant_jobs_appl_status_codes1`
    FOREIGN KEY (`appl_status_cd`)
    REFERENCES `job_portal`.`appl_status_codes` (`appl_status_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Data for table `job_portal`.`regions`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`regions` (`region_id`, `region_name`, `last_updated_by`, `last_updated_date`) VALUES ('NA', 'North America', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`regions` (`region_id`, `region_name`, `last_updated_by`, `last_updated_date`) VALUES ('SA', 'South America', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`regions` (`region_id`, `region_name`, `last_updated_by`, `last_updated_date`) VALUES ('A', 'Asia', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`regions` (`region_id`, `region_name`, `last_updated_by`, `last_updated_date`) VALUES ('AUS', 'Australia', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`regions` (`region_id`, `region_name`, `last_updated_by`, `last_updated_date`) VALUES ('EUR', 'Europe', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`regions` (`region_id`, `region_name`, `last_updated_by`, `last_updated_date`) VALUES ('ANT', 'Antartica', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`regions` (`region_id`, `region_name`, `last_updated_by`, `last_updated_date`) VALUES ('AFR', 'Africa', 'Surya', '2022-02-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`countries`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('IN', 'India', 'A', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('CN', 'China', 'A', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('JP', 'Japan', 'A', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('US', 'USA', 'NA', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('CAN', 'Canada', 'NA', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('ARG', 'Argentina', 'SA', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('BR', 'Brazil', 'SA', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('UK', 'United Kingdom', 'EUR', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('IRE', 'Ireland', 'EUR', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('AUS', 'Australia', 'AUS', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('NZ', 'New zealand', 'AUS', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('SA', 'South africa', 'AFR', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`countries` (`country_cd`, `country_name`, `region_id`, `last_updated_by`, `last_updated_date`) VALUES ('KEN', 'Kenya', 'AFR', 'Surya', '2022-02-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`departments`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`departments` (`dept_id`, `dept_name`, `last_updated_by`, `last_updated_date`) VALUES (1, 'IT', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`departments` (`dept_id`, `dept_name`, `last_updated_by`, `last_updated_date`) VALUES (2, 'Production', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`departments` (`dept_id`, `dept_name`, `last_updated_by`, `last_updated_date`) VALUES (3, 'Teaching', 'Surya', '2022-02-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`job_types`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`job_types` (`job_type_cd`, `job_type_name`, `last_updated_date`, `last_updated_by`) VALUES (1, 'Art teacher', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`job_types` (`job_type_cd`, `job_type_name`, `last_updated_date`, `last_updated_by`) VALUES (2, 'IT Manager', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`job_types` (`job_type_cd`, `job_type_name`, `last_updated_date`, `last_updated_by`) VALUES (3, 'HR trainee', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`job_types` (`job_type_cd`, `job_type_name`, `last_updated_date`, `last_updated_by`) VALUES (4, 'IT developer', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`job_types` (`job_type_cd`, `job_type_name`, `last_updated_date`, `last_updated_by`) VALUES (5, 'Production head', 'Surya', '2022-02-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`job_status_codes`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`job_status_codes` (`job_status_cd`, `status_desc`, `last_updated_by`, `last_updated_date`) VALUES (1, 'Open', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`job_status_codes` (`job_status_cd`, `status_desc`, `last_updated_by`, `last_updated_date`) VALUES (2, 'closed', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`job_status_codes` (`job_status_cd`, `status_desc`, `last_updated_by`, `last_updated_date`) VALUES (3, 'Pending', 'Surya', '2022-02-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`appl_status_codes`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`appl_status_codes` (`appl_status_cd`, `status_desc`, `last_updated_by`, `last_updated_date`) VALUES (1, 'Pending', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`appl_status_codes` (`appl_status_cd`, `status_desc`, `last_updated_by`, `last_updated_date`) VALUES (2, 'Written test passed', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`appl_status_codes` (`appl_status_cd`, `status_desc`, `last_updated_by`, `last_updated_date`) VALUES (3, 'Rejected', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`appl_status_codes` (`appl_status_cd`, `status_desc`, `last_updated_by`, `last_updated_date`) VALUES (4, 'Interview1 passed', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`appl_status_codes` (`appl_status_cd`, `status_desc`, `last_updated_by`, `last_updated_date`) VALUES (5., 'Interview2 passed', 'Surya', '2022-02-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`education_levels`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`education_levels` (`edu_level_cd`, `edu_level_name`, `last_updated_by`, `last_updated_date`) VALUES (1, 'High school', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`education_levels` (`edu_level_cd`, `edu_level_name`, `last_updated_by`, `last_updated_date`) VALUES (2, 'UG', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`education_levels` (`edu_level_cd`, `edu_level_name`, `last_updated_by`, `last_updated_date`) VALUES (3, 'PG', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`education_levels` (`edu_level_cd`, `edu_level_name`, `last_updated_by`, `last_updated_date`) VALUES (4, 'Doctorate', 'Surya', '2022-02-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`education_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`education_type` (`education_type_cd`, `edu_type_name`, `last_updated_by`, `last_updated_date`) VALUES (1, 'Engineering', NULL, '2022-02-02');
INSERT INTO `job_portal`.`education_type` (`education_type_cd`, `edu_type_name`, `last_updated_by`, `last_updated_date`) VALUES (2, 'Medical', NULL, '2022-02-02');
INSERT INTO `job_portal`.`education_type` (`education_type_cd`, `edu_type_name`, `last_updated_by`, `last_updated_date`) VALUES (3, 'Arts', NULL, '2022-02-02');
INSERT INTO `job_portal`.`education_type` (`education_type_cd`, `edu_type_name`, `last_updated_by`, `last_updated_date`) VALUES (4, 'Science', NULL, '2022-02-02');
INSERT INTO `job_portal`.`education_type` (`education_type_cd`, `edu_type_name`, `last_updated_by`, `last_updated_date`) VALUES (5, 'Technology', NULL, '2022-02-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`jobs`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`jobs` (`job_id`, `job_title`, `job_desc`, `job_type_cd`, `dept_id`, `country_cd`, `job_status_cd`, `date_opened`, `date_closed`, `last_updated_by`, `last_update_date`) VALUES (, 'Java developer', 'Opening for java developer', 1, 1, 'IN', 3, '2022-01-10', '2022-01-12', 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`jobs` (`job_id`, `job_title`, `job_desc`, `job_type_cd`, `dept_id`, `country_cd`, `job_status_cd`, `date_opened`, `date_closed`, `last_updated_by`, `last_update_date`) VALUES (, 'Assembly engineer', 'Opening for assembly engineer', 2, 2, 'US', 1, '2021-12-12', NULL, 'Surya', '2022-02-02');
INSERT INTO `job_portal`.`jobs` (`job_id`, `job_title`, `job_desc`, `job_type_cd`, `dept_id`, `country_cd`, `job_status_cd`, `date_opened`, `date_closed`, `last_updated_by`, `last_update_date`) VALUES (, 'Science teacher', 'Opening for science teacher for 12th students', 3, 3, 'UK', 2, '2022-01-01', NULL, 'Surya', '2022-02-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`applicants`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`applicants` (`appl_id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `state`, `zip`, `country_cd`, `edu_level_cd`, `appl_status_cd`, `edu_type_cd`, `resume_file_name`, `cover_letter_text`, `date_applied`, `employed_flag`, `current_employer_name`, `years_of_exp`, `last_updated_date`, `last_updated_by`) VALUES (DEFAULT, 'Surya', 'kumar', 'surya@gmail.com', '9923434323', 'Near anna statue,choolaimedu', 'chennai', 'Tamilnadu', '624421', 'IN', 2, 2, 2, 'resume.txt', 'coverletter.txt', '2022-01-10', 0, NULL, 0, '2022-02-02', 'Surya');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_portal`.`applicant_jobs`
-- -----------------------------------------------------
START TRANSACTION;
USE `job_portal`;
INSERT INTO `job_portal`.`applicant_jobs` (`appl_id`, `job_id`, `appl_status_cd`, `date_applied`, `written_test_date`, `interview1_date`, `interview2_date`, `last_updated_by`, `last_updated_date`) VALUES (1, 1, 5, '2022-01-10', '2022-01-11', '2022-01-12', NULL, 'Surya', '2022-02-02');

COMMIT;

