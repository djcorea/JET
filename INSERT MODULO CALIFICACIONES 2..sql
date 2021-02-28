DELIMITER $$

CREATE DEFINER=`master`@`%` PROCEDURE `Insert_Modulo_Calificaciones`(
 IN `nota_final`      decimal(10,0),
 IN `nota_historial` VARCHAR(255),
 IN `Promedio_anual` INT(10),
 IN `observacion`    VARCHAR(255),
 IN `id_asignatura`  int(10),
 IN `id_estudiante` INT (10),
 IN `id_docente`    INT(10),
 IN `ID_NOTA_final`  int(10),
 IN `Acumulativo_actividad` int(10),
in `id_periodo_academico` int(10),
in  `parcial`  int,
in  `numero_periodo` int(10))
BEGIN
start transaction;
insert into `Nota_final`
( `nota_final`,
  `observacion`,
  `id_asignatura`,
  `id_estudiante`,
  `id_docente`,
  `id_acumulativo_actividad`)
    Values (`nota_final`,
  `observacion`,
  `id_asignatura`,
  `id_estudiante`,
  `id_docente`,
  `id_acumulativo_actividad`
  );
  select @id_nota_final := max(Nota_final) From `Nota_final`;
insert into `Acumulativo_actividad`
(`acumulativo_actividad`, 
  `id_parcial`)
  values (`acumulativo_actividad`, 
  `id_parcial`);
  select @id_acumulativo_actividad := max(Acumulativo_actividad) from `acumulativo_actividad`;
  
  insert into`Historial_de_notas`
         (`nota_historial`,
         `promedio_anual`,
         `id_periodo_academico`,
         `id_nota_final`)
         values(`nota_historial`,
         `promedio_anual`,
         `id_periodo_academico`,
         @id_nota_final);
         select @historial_de_notas :=max(id_historial_de_notas) from `historial_de_notas`;
         
  insert into `periodo_academico`
	     (`numero_periodo`)
         values(`numero_periodo`);
         Select @id_periodo_academico :=max(periodo_academico) from `periodo_academico`;
       
       insert into `nota_final_historial_de_notas`
       (`id_nota_final`,
            `id_historial_de_notas`)
           values
           (@id_nota_final,
            @id_historial_de_notas
            );
                     
  insert into `parcial`
       (`Parcial`,
       `id_actividad`
       )
       values (`Parcial`,
       @Id_actividad);
       select @id_parcial :=max(parcial) from `Parcial`;
  commit;     
END
$$