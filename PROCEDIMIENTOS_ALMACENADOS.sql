/* >>>>>>>>>   SP_HOSPITAL_REGISTRAR <<<<<<<< */

CREATE OR REPLACE PROCEDURE SP_HOSPITAL_REGISTRAR (
    v_idHospital        hospital.idhospital%type,
    v_idDistrito        hospital.iddistrito%type,
    v_nombre            hospital.nombre%type,
    v_antiguedad        hospital.antiguedad%type,
    v_area              hospital.area%type,
    v_idSede            hospital.idsede%type,
    v_idGerente         hospital.idgerente%type,
    v_idCondicion       hospital.idcondicion%type,
    v_fechaRegistro     hospital.fecharegistro%type
) IS
    v_existe number;
     
    CURSOR comprobar_datos IS
        SELECT 1
        FROM dual
        WHERE EXISTS (SELECT 1 FROM distrito WHERE idDistrito = v_idDistrito)
          AND EXISTS (SELECT 1 FROM sede WHERE idSede = v_idSede)
          AND EXISTS (SELECT 1 FROM gerente WHERE idGerente = v_idGerente)
          AND EXISTS (SELECT 1 FROM condicion WHERE idCondicion = v_idCondicion);
    
   
    
BEGIN
    OPEN comprobar_datos;
    FETCH comprobar_datos INTO v_existe;
    CLOSE comprobar_datos;
    
    IF v_existe IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Hubo un error... Porfavor, validar los datos nuevamente.');
    END IF;

    INSERT INTO hospital (idHospital, idDistrito, nombre, antiguedad, area, idSede, idGerente, idCondicion, fechaRegistro) 
    VALUES (v_idHospital,v_idDistrito,v_nombre,v_antiguedad,v_area,v_idSede,v_idGerente,v_idCondicion,v_fechaRegistro
    );
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Se registro el hospital de manera correcta.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Mensaje de Error: ' || SQLERRM);
END SP_HOSPITAL_REGISTRAR;
/

/* >>>>>>>>>   SP_HOSPITAL_ACTUALIZAR <<<<<<<< */

CREATE OR REPLACE PROCEDURE SP_HOSPITAL_ACTUALIZAR (
    v_idHospital       hospital.idhospital%type,
    v_idDistrito       hospital.iddistrito%type,
    v_nombre           hospital.nombre%type,
    v_antiguedad       hospital.antiguedad%type,
    v_area             hospital.area%type,
    v_idSede           hospital.idsede%type,
    v_idGerente        hospital.idgerente%type,
    v_idCondicion      hospital.idcondicion%type,
    v_fechaRegistro    hospital.fecharegistro%type
) IS

     v_existe number;
     
    CURSOR comprobar_datos IS
        SELECT 1
        FROM dual
        WHERE EXISTS (SELECT 1 FROM distrito WHERE idDistrito = v_idDistrito)
          AND EXISTS (SELECT 1 FROM sede WHERE idSede = v_idSede)
          AND EXISTS (SELECT 1 FROM gerente WHERE idGerente = v_idGerente)
          AND EXISTS (SELECT 1 FROM condicion WHERE idCondicion = v_idCondicion);
    
BEGIN
    OPEN comprobar_datos;
    FETCH comprobar_datos INTO v_existe;
    CLOSE comprobar_datos;
    
    IF v_existe IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Hubo un error... Porfavor, validar los datos nuevamente.');
    END IF;

    UPDATE hospital
    SET 
        idDistrito = v_idDistrito,
        nombre = v_nombre,
        antiguedad = v_antiguedad,
        area = v_area,
        idSede = v_idSede,
        idGerente = v_idGerente,
        idCondicion = v_idCondicion,
        fechaRegistro = v_fechaRegistro
    WHERE idHospital = v_idHospital;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se encontró el hospital con el id proporcionado.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Se actualizo el hospital correctamente');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END SP_HOSPITAL_ACTUALIZAR;
/


/* >>>>>>>>>   SP_HOSPITAL_ELIMINAR <<<<<<<< */

CREATE OR REPLACE PROCEDURE SP_HOSPITAL_ELIMINAR (
    v_idHospital  hospital.idhospital%type
) IS
    
    v_contador NUMBER;

    CURSOR consultar_hospital IS
        SELECT count(*) 
        FROM hospital 
        WHERE idHospital = v_idHospital;

BEGIN
    OPEN consultar_hospital;
    FETCH consultar_hospital INTO v_contador;
    CLOSE consultar_hospital;

    IF v_contador = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se encontró el hospital con el id proporcionado.');
    ELSE
    
        DELETE FROM hospital 
        WHERE idHospital = v_idHospital;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20003, 'No se pudo eliminar el hospital. Verifique los datos.');
        ELSE
            COMMIT; 
            DBMS_OUTPUT.PUT_LINE('El hospital fue eliminado correctamente.');
        END IF;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END SP_HOSPITAL_ELIMINAR;
/

/* >>>>>>>>>   SP_HOSPITAL_LISTAR <<<<<<<< */

CREATE OR REPLACE PROCEDURE SP_HOSPITAL_LISTAR (
    v_idHospital NUMBER DEFAULT NULL 
) IS
    cursor l_hospitales  IS 
    SELECT h.idHospital, h.nombre, d.descDistrito, s.descSede, g.descGerente, c.descCondicion, h.fechaRegistro
        FROM hospital h
        JOIN distrito d ON h.idDistrito = d.idDistrito
        JOIN sede s ON h.idSede = s.idSede
        JOIN gerente g ON h.idGerente = g.idGerente
        JOIN condicion c ON h.idCondicion = c.idCondicion
        WHERE (v_idHospital IS NULL OR h.idHospital = v_idHospital);
        
    v_encontrado BOOLEAN := FALSE;
BEGIN

    FOR r_hospital IN l_hospitales
    LOOP
        v_encontrado := TRUE;
        DBMS_OUTPUT.PUT_LINE('ID Hospital: ' || r_hospital.idHospital); 
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || r_hospital.nombre);  
        DBMS_OUTPUT.PUT_LINE('Distrito: ' || r_hospital.descDistrito); 
        DBMS_OUTPUT.PUT_LINE('Sede: ' || r_hospital.descSede); 
        DBMS_OUTPUT.PUT_LINE('Gerente: ' || r_hospital.descGerente); 
        DBMS_OUTPUT.PUT_LINE('Condición: ' || r_hospital.descCondicion);  
        DBMS_OUTPUT.PUT_LINE('Fecha de Registro: ' || TO_CHAR(r_hospital.fechaRegistro, 'YYYY-MM-DD'));  
        DBMS_OUTPUT.PUT_LINE('>>>>>>>>>>>><<<<<<<<<<<<<<<<<');
    END LOOP;
    
    IF NOT v_encontrado THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se encontró el hospital con el id proporcionado.');
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END SP_HOSPITAL_LISTAR;
/

