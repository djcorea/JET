
-- -----------------------------------------------------------------------------
DROP `SP_EMPLEADOS`;
DELIMITER $$
CREATE  PROCEDURE `SP_EMPLEADOS`(
    IN `ID_EMPLEADO_` INT(11),
    IN `ID_PERSONA_` INT(11),
    IN `ID_GRADO_ACADEMICO_` INT(11), 
    IN `FECHA_CONTRATACION_` DATE, 
    IN `SUELDO_BASE_` DECIMAL(10,2), 
    IN `HORASLABORALES_` DECIMAL(10,2), 
    IN `OPCION_` ENUM('UPDATE','INSERT','DELETE')
    )
    NO SQL
IF (SELECT EXISTS(SELECT `ID_PERSONA` FROM `PERSONAS` WHERE `ID_PERSONA`=ID_PERSONA_)=1) THEN 
    -- CONDICIONAL QUE DETERMINA SI Y HAY UN EMPLEADO ASOCIADO AL ID DE PERSONA QUE SE QUIERE REGISTRAR
   
        IF (SELECT EXISTS(SELECT `ID_GRADO_ACADEMICO` FROM `GRADOS_ACADEMICOS` WHERE `ID_GRADO_ACADEMICO`=ID_GRADO_ACADEMICO_)=1) THEN 
        
            CASE OPCION_
                WHEN  'INSERT' THEN
                    IF (SELECT EXISTS(SELECT `ID_PERSONA` FROM `EMPLEADOS` WHERE `ID_PERSONA`=ID_PERSONA_)=1) THEN 
                        SELECT ("PERSONA ASOCIADA A UN EMPLEADO, INTENTE CON OTRA POR FAVOR.");
                    ELSE
    
                        INSERT INTO `EMPLEADOS`(
                            `ID_EMPLEADO`,
                            `ID_PERSONA`,
                            `ID_GRADO_ACADEMICO`,
                            `FECHA_CONTRATACION`,
                            `SUELDO_BASE`,
                            `HORASLABORALES`) 
                        VALUES (
                            NULL, 
                            ID_PERSONA_, 
                            ID_GRADO_ACADEMICO_, 
                            FECHA_CONTRATACION_, 
                            SUELDO_BASE_, 
                            HORASLABORALES_ );
                    END IF; -- PERSONA EMPLEADO
                WHEN  'UPDATE' THEN
                         UPDATE `EMPLEADOS` 
                        SET 
                            `HORASLABORALES` =  HORASLABORALES_,
                            `SUELDO_BASE` =  SUELDO_BASE_,
                            `ID_GRADO_ACADEMICO` =  ID_GRADO_ACADEMICO_  
                        
                        WHERE `ID_EMPLEADO` = ID_EMPLEADO_;
                        
                        
                ELSE
                    SELECT ("OTHER OPTION");
            END CASE;
        ELSE
            SELECT ("EL GRADO ACADEMICO NO EXISTE");  
        END IF; -- GRADO
    

ELSE
    SELECT ("EL ID DE PERSONA NO EXISTE");

END IF$$
DELIMITER ;


-- -----------------------------------------------------------------------------



DELIMITER $$
CREATE  PROCEDURE `SP_BANCOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `NOMBRE_` VARCHAR(100) )
    NO SQL
IF (SELECT EXISTS(SELECT `NOMBRE` FROM `BANCOS` WHERE `NOMBRE` =NOMBRE_)=1) THEN 
   SELECT ("EL BANCO YA EXISTE");

ELSE
        INSERT INTO `BANCOS`(
            `NOMBRE`) 
        VALUES (
            NOMBRE_);

END IF$$
DELIMITER ;



-- -----------------------------------------------------------------------------







-- -----------------------------------------------------------------------------





-- -----------------------------------------------------------------------------