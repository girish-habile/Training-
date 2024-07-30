

CREATE OR REPLACE PROCEDURE sp_populate_exam_center(p_etl_user_id IN VARCHAR2)
IS
    v_id VARCHAR2(36);
    v_name SRC_CENTERS.name%TYPE;
    v_is_active VARCHAR2(20);
    v_address_id VARCHAR2(36);
    v_location_id VARCHAR2(36);
BEGIN
    FOR rec IN (
        SELECT name, active_status, address
        FROM SRC_CENTERS
    )
    LOOP
    
        v_id := SYS_GUID();

        v_name := rec.name;

        IF rec.active_status = 'TRUE' THEN
            v_is_active := 'TRUE';
        ELSE
            v_is_active := 'FALSE';
        END IF;

        SELECT id INTO v_address_id
        FROM tar_address
        WHERE address = rec.address;

        SELECT id INTO v_location_id
        FROM tar_location
        WHERE name = rec.name;


        INSERT INTO tar_exam_center(id, name, is_active, address_id, location_id, created_by, updated_by, deleted_by)
        VALUES (v_id, v_name, v_is_active, v_address_id, v_location_id, p_etl_user_id, p_etl_user_id, NULL);
        
        COMMIT; 
    END LOOP;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
        RAISE;
END sp_populate_exam_center;
/

DECLARE
v_etl_user_id varchar2(36) := 100;
begin
sp_populate_exam_center(v_etl_user_id);
end;
/
