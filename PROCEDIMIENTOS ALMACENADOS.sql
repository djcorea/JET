

CREATE PROCEDURE `SP_INSERT_EMPLEADOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `ID_EMPLEADO_` INT(11) ,
    IN `ID_PERSONA_` INT(11),
    IN `ID_GRADO_ACADEMICO_` INT(11),
    IN `FECHA_CONTRATACION_` DATE,
    IN `SUELDO_BASE_` DECIMAL(10,2),
    IN `HORASLABORALES_` DECIMAL(10,2),
    IN `OPCCION_` VARCHAR(20)) 

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER


IF (SELECT EXISTS(SELECT `ID_PERSONA` FROM `PERSONAS` WHERE `ID_PERSONA`=ID_PERSONA_)=1) THEN 
    -- CONDICIONAL QUE DETERMINA SI Y HAY UN EMPLEADO ASOCIADO AL ID DE PERSONA QUE SE QUIERE REGISTRAR
   
        IF (SELECT EXISTS(SELECT `ID_GRADO_ACADEMICO` FROM `GRADOS_ACADEMICOS` WHERE `ID_GRADO_ACADEMICO`=ID_GRADO_ACADEMICO_)=1) THEN 
        
            CASE OPCCION_
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

END IF -- PERSONA EXISTE

-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_DEPTOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `NOMBRE_` VARCHAR(100) )

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `NOMBRE` FROM `DEPARTAMENTOS` WHERE `NOMBRE` =NOMBRE_)=1) THEN 
   SELECT ("EL DEPARTAMENTO YA EXISTE");

ELSE
        INSERT INTO `DEPARTAMENTOS`(
            `ID_DEPARTAMENTO`,
            `NOMBRE`) 
        VALUES (
            NULL, 
            NOMBRE_);

END IF ;;

-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_PUESTOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `NOMBRE_` VARCHAR(100) ,
    IN `DESCRIPCION_` VARCHAR(200),
    IN `ID_DEPARTAMENTO_` INT(11))

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER





IF (SELECT EXISTS(SELECT `ID_DEPARTAMENTO` FROM `DEPARTAMENTOS` WHERE `ID_DEPARTAMENTO` =ID_DEPARTAMENTO_)=1) THEN 
   
    INSERT INTO `PUESTOS`(
        `NOMBRE` ,
        `DESCRIPCION`,
        `ID_DEPARTAMENTO` )

    VALUES ( 
        NOMBRE_,
        DESCRIPCION_,
        ID_DEPARTAMENTO_);

ELSE
   SELECT ("EL DEPARTAMENTO NO EXISTE");

END IF ;;

-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_ROLES`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `ID_ESTADO_` INT(11),
    IN `NOMBRE_` VARCHAR(100) )

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `ID_ESTADO` FROM `ESTADOS` WHERE `ID_ESTADO` =ID_ESTADO_)=1) THEN 
IF (SELECT EXISTS(SELECT `NOMBRE` FROM `ROLES` WHERE `NOMBRE` =NOMBRE_)=1) THEN 
   SELECT ("EL ROL YA EXISTE");

ELSE
        INSERT INTO `ROLES`(
            `NOMBRE`,
            `FECHACREACION`,
            `ID_ESTADO`) 
        VALUES (
            NOMBRE_,
            NOW(), 
            ID_ESTADO_);

END IF;

ELSE
SELECT ("EL ESTADO NO EXISTE");

END IF ;;

-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_BANCOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `NOMBRE_` VARCHAR(100) )

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `NOMBRE` FROM `BANCOS` WHERE `NOMBRE` =NOMBRE_)=1) THEN 
   SELECT ("EL BANCO YA EXISTE");

ELSE
        INSERT INTO `BANCOS`(
            `NOMBRE`) 
        VALUES (
            NOMBRE_);

END IF ;;
-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_ESTADOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `DESCRIPCION_` VARCHAR(100) )

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `DESCRIPCION` FROM `ESTADOS` WHERE `DESCRIPCION` =DESCRIPCION_)=1) THEN 
   SELECT ("EL ESTADO YA EXISTE");

ELSE
        INSERT INTO `ESTADOS`(
            `DESCRIPCION`) 
        VALUES (
            DESCRIPCION_);

END IF ;;

-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_CUENTAS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `ID_BANCO_` INT(11),
    IN `ID_EMPLEADO_` INT(11),
    IN `CUENTA_` BIGINT(50) )

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `ID_BANCO` FROM `BANCOS` WHERE `ID_BANCO` =ID_BANCO_)=1) THEN 
    IF (SELECT EXISTS(SELECT `ID_EMPLEADO_` FROM `EMPLEADOS` WHERE `ID_EMPLEADO` =ID_EMPLEADO_)=1) THEN 
    

            INSERT INTO `CUENTAS_BANCARIAS`(
                `ID_BANCO`,
                `ID_EMPLEADO`,
                `CUENTA`) 
            VALUES (
                ID_BANCO_,
                ID_EMPLEADO_,
                CUENTA_);
    ELSE
            SELECT ("EL EMPLEADO NO EXISTE");
    END IF;

ELSE
    SELECT ("EL BANCO NO EXISTE");

END IF ;;

-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_GRADOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `DESCRIPCION_` VARCHAR(100) )

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `DESCRIPCION` FROM `GRADOS_ACADEMICOS` WHERE `DESCRIPCION` =DESCRIPCION_)=1) THEN 
   SELECT ("EL GRADO ACADEMICO YA EXISTE");

ELSE
        INSERT INTO `GRADOS_ACADEMICOS`(
            `DESCRIPCION`) 
        VALUES (
            DESCRIPCION_);

END IF ;;

-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_HISTORIAL_PUESTO`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `ID_PUESTO_` INT(11),
    IN `ID_EMPLEADO_` INT(11),
    IN `FECHA_INICIO_` DATE,
    IN `FECHA_FINAL_` DATE )

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `ID_PUESTO` FROM `PUESTOS` WHERE `ID_PUESTO` =ID_PUESTO_)=1) THEN 
    IF (SELECT EXISTS(SELECT `ID_EMPLEADO_` FROM `EMPLEADOS` WHERE `ID_EMPLEADO` =ID_EMPLEADO_)=1) THEN 
    

            INSERT INTO `HISTORIAL_PUESTO_EMPLEADO`(
                `ID_PUESTO`,
                `ID_EMPLEADO`,
                `FECHA_INICIO_PUESTO`,
                `FECHA_FINAL_PUESTO`) 
            VALUES (
                ID_PUESTO_,
                ID_EMPLEADO_,
                FECHA_INICIO_,
                FECHA_FINAL_);
    ELSE
            SELECT ("EL EMPLEADO NO EXISTE");
    END IF;

ELSE
    SELECT ("EL PUESTO NO EXISTE");

END IF ;;

-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_HISTORIAL_SALARIO`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
  
    IN `ID_EMPLEADO_` INT(11),
    IN `FECHA_INICIO_` DATE,
    IN `FECHA_FINAL_` DATE,
    IN `MONTO_` DECIMAL(10,2) )

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER
IF (SELECT EXISTS(SELECT `ID_EMPLEADO_` FROM `EMPLEADOS` WHERE `ID_EMPLEADO` =ID_EMPLEADO_)=1) THEN 
    
    IF(FECHA_FINAL_>FECHA_INICIO_) THEN

            INSERT INTO `HISTORIAL_SALARIOS`(
                `ID_EMPLEADO`,
                `FECHA_INICIO_SALARIO`,
                `FECHA_FINAL_SALARIO`,
                `MONTO`) 
            VALUES (
                ID_EMPLEADO_,
                FECHA_INICIO_,
                FECHA_FINAL_,
                MONTO_);
    ELSE 
             SELECT "LA FECHA FINAL DEBE SER POSTERIOR A LA DE INICIO";
    END IF;
ELSE
        SELECT ("EL EMPLEADO NO EXISTE");
END IF;;



-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_PREGUNTAS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `PREGUNTA_` VARCHAR(255),
    IN `USR_REGISTRO_` VARCHAR(50),
    IN `FECHA_CREACION_` DATE )

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `PREGUNTA` FROM `PREGUNTAS` WHERE `PREGUNTA` =PREGUNTA_)=1) THEN 
   SELECT ("LA PREGUNTA YA EXISTE");

ELSE
        INSERT INTO `PREGUNTAS`(
            `PREGUNTA`,
            `USUARIO_REGISTRO`,
            `FECHA_CREACION`) 
        VALUES (
            PREGUNTA_, 
            USR_REGISTRO_,
            FECHA_CREACION_);

END IF ;;



-- --------------------------------------------------------------------------------------


CREATE PROCEDURE `SP_INSERT_USUARIO`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `ID_ROL_` INT(11),
    IN `ID_EMPLEADO_` INT(11),
    IN `ID_ESTADO_` INT(11),
    IN `FECHA_CREACION_` DATE,
    IN `NOMBRE_USUARIO_` VARCHAR(255),
    IN `PASSWORD_` VARCHAR(255),
    IN `USUARIO_REGISTRO_` VARCHAR(50))

NOT DETERMINISTIC
NO SQL 
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `ID_ROL` FROM `ROLES` WHERE `ID_ROL` =ID_ROL_)=1) THEN 
    IF (SELECT EXISTS(SELECT `ID_EMPLEADO_` FROM `EMPLEADOS` WHERE `ID_EMPLEADO` =ID_EMPLEADO_)=1) THEN 
        IF (SELECT EXISTS(SELECT `ID_ESTADO` FROM `ESTADOS` WHERE `ID_ESTADO` =ID_ESTADO_)=1) THEN 

            INSERT INTO `HISTORIAL_PUESTO_EMPLEADO`(
                `ID_ROL`,
                `ID_EMPLEADO`,
                `ID_ESTADO`,
                `FECHA_CREACION`,
                `NOMBRE_USUARIO`,
                `PASSWORD`,
                `USUARIO_REGISTRO`) 
            VALUES (
                ID_ROL_ ,
                ID_EMPLEADO_ ,
                ID_ESTADO_ ,
                FECHA_CREACION_ ,
                NOMBRE_USUARIO_ ,
                PASSWORD_ ,
                USUARIO_REGISTRO_ );
        ELSE
            SELECT ("EL ESTADO NO EXISTE");
        END IF;
    ELSE
            SELECT ("EL EMPLEADO NO EXISTE");
    END IF;

ELSE
    SELECT ("EL ROL NO EXISTE");

END IF ;;


/*
*QUERY NEEDED AFTER
*/
SELECT HPE.*, P.NOMBRE FROM PUESTOS P 

RIGHT JOIN HISTORIAL_PUESTO_EMPLEADO HPE ON HPE.ID_PUESTO= P.ID_PUESTO


WHERE HPE.FECHA_FINAL_PUESTO IS NULL


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
    IN `OPCCION_` ENUM('UPDATE','INSERT','DELETE')
    )
    NO SQL
IF (SELECT EXISTS(SELECT `ID_PERSONA` FROM `PERSONAS` WHERE `ID_PERSONA`=ID_PERSONA_)=1) THEN 
    -- CONDICIONAL QUE DETERMINA SI Y HAY UN EMPLEADO ASOCIADO AL ID DE PERSONA QUE SE QUIERE REGISTRAR
   
        IF (SELECT EXISTS(SELECT `ID_GRADO_ACADEMICO` FROM `GRADOS_ACADEMICOS` WHERE `ID_GRADO_ACADEMICO`=ID_GRADO_ACADEMICO_)=1) THEN 
        
            CASE OPCCION_
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