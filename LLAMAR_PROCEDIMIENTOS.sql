------------ REGISTRAR HOSPITAL--------------
BEGIN
    SP_HOSPITAL_REGISTRAR(
        v_idHospital => 1,
        v_idDistrito => 2,
        v_nombre => 'Hospital Cayetano Heredia',
        v_antiguedad => 10,
        v_area => 900.50,
        v_idSede => 1,
        v_idGerente => 2,
        v_idCondicion => 3,
        v_fechaRegistro => TO_DATE('2025-03-01', 'YYYY-MM-DD')
    );
END;
/


------------------------------------------------------------------
------------ ACTUALIZAR HOSPITAL--------------

BEGIN
    SP_HOSPITAL_ACTUALIZAR(
        v_idHospital => 1,
        v_idDistrito => 3,
        v_nombre => 'Hospital General',
        v_antiguedad => 10,
        v_area => 850.90,
        v_idSede => 2,
        v_idGerente => 1,
        v_idCondicion => 2,
        v_fechaRegistro => TO_DATE('2025-03-14', 'YYYY-MM-DD')
    );
END;
/

------------ ELIMINAR HOSPITAL--------------

BEGIN
    SP_HOSPITAL_ELIMINAR;
END;
/


------------ LISTAR HOSPITAL--------------

BEGIN
    SP_HOSPITAL_LISTAR; 
    --SP_HOSPITAL_LISTAR(v_idHospital => 1); 
END;
/
