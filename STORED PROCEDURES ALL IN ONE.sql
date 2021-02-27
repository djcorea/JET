
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
                            `HORASLABORALES`        = HORASLABORALES_,
                            `SUELDO_BASE`           = SUELDO_BASE_,
                            `ID_GRADO_ACADEMICO`    = ID_GRADO_ACADEMICO_

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
CREATE DEFINER=`ADMIN`@`localhost` PROCEDURE `SP_BANCOS`(
    IN `ID_BANCO_` INT(11),
    IN `NOMBRE_` VARCHAR(100),
    IN `OPCION_` ENUM('UPDATE','INSERT','DELETE'))
    NO SQL
IF (SELECT EXISTS(SELECT `NOMBRE` FROM `BANCOS` WHERE `NOMBRE` =NOMBRE_)=1 && OPCION_<>'DELETE') THEN
    SELECT ("EL BANCO YA EXISTE");
ELSE
    CASE OPCION_
        WHEN  'INSERT' THEN

            INSERT INTO `BANCOS`(
            `NOMBRE`)
            VALUES (
            NOMBRE_);


        WHEN  'UPDATE' THEN

                UPDATE `BANCOS`
                SET
                    `NOMBRE`     =  NOMBRE_
                WHERE `ID_BANCO` =  ID_BANCO_;

        WHEN  'DELETE' THEN

                DELETE FROM `BANCOS` WHERE `ID_BANCO` =  ID_BANCO_;

        ELSE
            SELECT ("OTHER OPTION");
    END CASE;

END IF$$
DELIMITER ;

-- -----------------------------------------------------------------------------


CREATE PROCEDURE `SP_ESTADOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `ID_ESTADO_` INT(11),
    IN `DESCRIPCION_` VARCHAR(100),
    IN `OPCION_` ENUM('UPDATE','INSERT','DELETE') )

NOT DETERMINISTIC
NO SQL
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `DESCRIPCION` FROM `ESTADOS` WHERE `DESCRIPCION` =DESCRIPCION_)=1 && OPCION_<>'DELETE') THEN
   SELECT ("EL ESTADO YA EXISTE");

ELSE

    CASE OPCION_
            WHEN  'INSERT' THEN

                INSERT INTO `ESTADOS`(
                `DESCRIPCION`)
            VALUES (
                DESCRIPCION_);


            WHEN  'UPDATE' THEN

                    UPDATE `ESTADOS`
                    SET
                        `DESCRIPCION`     =  DESCRIPCION_
                    WHERE `ID_ESTADO` =  ID_ESTADO_;

            WHEN  'DELETE' THEN

                    DELETE FROM `ESTADOS` WHERE `ID_ESTADO` =  ID_ESTADO_;

            ELSE
                SELECT ("OTHER OPTION");
    END CASE;

END IF ;;



-- -----------------------------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE `SP_DEPTOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
     IN `ID_DEPARTAMENTO_` INT(11),
    IN `OPCION_` ENUM('UPDATE','INSERT','DELETE') ,
    IN `NOMBRE_` VARCHAR(100) )

NOT DETERMINISTIC
NO SQL
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `NOMBRE` FROM `DEPARTAMENTOS` WHERE `NOMBRE` =NOMBRE_)=1 && OPCION_<>'DELETE') THEN
   SELECT ("EL DEPARTAMENTO YA EXISTE");

ELSE
    CASE OPCION_
            WHEN  'INSERT' THEN

                INSERT INTO `DEPARTAMENTOS`(
                    `NOMBRE`)
                VALUES (
                    NOMBRE_);


            WHEN  'UPDATE' THEN

                    UPDATE `DEPARTAMENTOS`
                    SET
                        `NOMBRE`       =  NOMBRE_
                    WHERE `ID_DEPARTAMENTO` =  ID_DEPARTAMENTO_;

            WHEN  'DELETE' THEN

                    DELETE FROM `DEPARTAMENTOS` WHERE `ID_DEPARTAMENTO` =  ID_DEPARTAMENTO_;

            ELSE
                SELECT ("OTHER OPTION");
    END CASE;

END IF$$

DELIMITER ;

-- -----------------------------------------------------------------------------


DELIMITER $$

CREATE PROCEDURE `SP_GRADOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
     IN `ID_GRADO_` INT(11),
    IN `OPCION_` ENUM('UPDATE','INSERT','DELETE') ,
    IN `DESCRIPCION_` VARCHAR(100) )

NOT DETERMINISTIC
NO SQL
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `DESCRIPCION` FROM `GRADOS_ACADEMICOS`  WHERE `DESCRIPCION` =DESCRIPCION_)=1 && OPCION_<>'DELETE') THEN
   SELECT ("EL GRADO YA EXISTE");

ELSE
    CASE OPCION_
            WHEN  'INSERT' THEN

                INSERT INTO `GRADOS_ACADEMICOS` (
                    `DESCRIPCION`)
                VALUES (
                    DESCRIPCION_);


            WHEN  'UPDATE' THEN

                    UPDATE `GRADOS_ACADEMICOS`
                    SET
                        `DESCRIPCION`       =  DESCRIPCION_
                    WHERE `ID_GRADO_ACADEMICO` =  ID_GRADO_;

            WHEN  'DELETE' THEN

                    DELETE FROM `GRADOS_ACADEMICOS`  WHERE `ID_GRADO_ACADEMICO` =  ID_GRADO_;

            ELSE
                SELECT ("OTHER OPTION");
    END CASE;

END IF$$

DELIMITER ;



-- -----------------------------------------------------------------------------


DELIMITER $$


CREATE PROCEDURE `SP_PREGUNTAS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `ID_PREGUNTA_`          INT(11),
    IN `PREGUNTA_`          VARCHAR(255),
    IN `USR_REGISTRO_`      VARCHAR(50),
    IN `FECHA_CREACION_`    DATE ,
    IN `OPCION_`            ENUM('UPDATE','INSERT','DELETE') )

NOT DETERMINISTIC
NO SQL
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `PREGUNTA` FROM `PREGUNTAS` WHERE `PREGUNTA` =PREGUNTA_)=1 && OPCION_<>'DELETE') THEN
   SELECT ("LA PREGUNTA YA EXISTE");

ELSE
    CASE OPCION_
            WHEN  'INSERT' THEN
                    INSERT INTO `PREGUNTAS`(
                        `PREGUNTA`,
                        `USUARIO_REGISTRO`,
                        `FECHA_CREACION`)
                    VALUES (
                        PREGUNTA_,
                        USR_REGISTRO_,
                        now());

            WHEN  'UPDATE' THEN

                    UPDATE `PREGUNTAS`
                    SET
                        `PREGUNTA`          =  PREGUNTA_,
                        `USUARIO_REGISTRO`  =  USR_REGISTRO_
                    WHERE `ID_PREGUNTA`     =  ID_PREGUNTA_;

            WHEN  'DELETE' THEN

                    DELETE FROM `PREGUNTAS`  WHERE `ID_PREGUNTA` =  ID_PREGUNTA_;

            ELSE
                SELECT ("OTHER OPTION");
    END CASE;


END IF$$

DELIMITER ;


-- -----------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE `SP_ROLES`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `ID_ROL_`            INT(11),
    IN `ID_ESTADO_`         INT(11),
    IN `NOMBRE_`            VARCHAR(100),
    IN `OPCION_`            ENUM('UPDATE','INSERT','DELETE') )

NOT DETERMINISTIC
NO SQL
SQL SECURITY DEFINER

IF (SELECT EXISTS(SELECT `ID_ESTADO` FROM `ESTADOS` WHERE `ID_ESTADO` =ID_ESTADO_)=0 && OPCION_ <>'DELETE') THEN

    SELECT ("EL ESTADO NO EXISTE");

ELSE
    IF (SELECT EXISTS(SELECT `NOMBRE` FROM `ROLES` WHERE `NOMBRE` =NOMBRE_)=1 && OPCION_<>'DELETE') THEN
        SELECT ("EL ROL YA EXISTE");
    ELSE

        CASE OPCION_
            WHEN  'INSERT' THEN
                INSERT INTO `ROLES`(
                    `NOMBRE`,
                    `FECHACREACION`,
                    `ID_ESTADO`)
                VALUES (
                    NOMBRE_,
                    NOW(),
                    ID_ESTADO_);



            WHEN  'UPDATE' THEN

                    UPDATE `ROLES`
                    SET
                        `NOMBRE`        = NOMBRE_,
                        `ID_ESTADO`     = ID_ESTADO_
                    WHERE `ID_ROL` =  ID_ROL_;

            WHEN  'DELETE' THEN

                    DELETE FROM `ROLES`  WHERE `ID_ROL` =  ID_ROL_;

            ELSE
                SELECT ("OTHER OPTION");
        END CASE;

    END IF;

END IF$$


DELIMITER ;

-- -----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `SP_PUESTOS`(
    -- DEFINICIÓN DE PARAMETROS QUE VA A RECIBIR EL PROCEDIMIENTO
    IN `ID_PUESTO_`          INT(11),
    IN `NOMBRE_`             VARCHAR(100) ,
    IN `DESCRIPCION_`        VARCHAR(200),
    IN `ID_DEPARTAMENTO_`    INT(11),
    IN `OPCION_`             ENUM('UPDATE','INSERT','DELETE'))

NOT DETERMINISTIC
NO SQL
SQL SECURITY DEFINER





IF (SELECT EXISTS(SELECT `ID_DEPARTAMENTO` FROM `DEPARTAMENTOS` WHERE `ID_DEPARTAMENTO` =ID_DEPARTAMENTO_)=0 && OPCION_ <>'DELETE') THEN
   SELECT ("EL DEPARTAMENTO NO EXISTE");
ELSE

CASE OPCION_
        WHEN  'INSERT' THEN
            INSERT INTO `PUESTOS`(
                `NOMBRE` ,
                `DESCRIPCION`,
                `ID_DEPARTAMENTO` )

            VALUES (
                NOMBRE_,
                DESCRIPCION_,
                ID_DEPARTAMENTO_);



        WHEN  'UPDATE' THEN

                UPDATE `PUESTOS`
                SET
                    `NOMBRE`            = NOMBRE_,
                    `DESCRIPCION`       = DESCRIPCION_,
                    `ID_DEPARTAMENTO`   = ID_DEPARTAMENTO_
                WHERE `ID_PUESTO`  =  ID_PUESTO_;

        WHEN  'DELETE' THEN

                DELETE FROM `PUESTOS`  WHERE `ID_PUESTO` =  ID_PUESTO_;

        ELSE
            SELECT ("OTHER OPTION");
END CASE;




END IF$$
DELIMITER;


-- -----------------------------------------------------------------------------





-- -----------------------------------------------------------------------------

/*##############################################
#################CASE STRUCTURE#################
##############################################*/
CASE OPCION_
        WHEN  'INSERT' THEN




        WHEN  'UPDATE' THEN

                UPDATE `GRADOS_ACADEMICOS`
                SET
                    `DESCRIPCION`       =  DESCRIPCION_
                WHERE `ID_GRADO_ACADEMICO` =  ID_GRADO_;

        WHEN  'DELETE' THEN

                DELETE FROM `GRADOS_ACADEMICOS`  WHERE `ID_GRADO_ACADEMICO` =  ID_GRADO_;

        ELSE
            SELECT ("OTHER OPTION");
END CASE;
