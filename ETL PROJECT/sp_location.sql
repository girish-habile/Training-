
 set serveroutput on ;
 
CREATE OR REPLACE PROCEDURE sp_populate_location(p_etl_user_id IN VARCHAR2)
IS
    v_id VARCHAR2(36);
    v_name src_centers.name%TYPE;
    v_is_active NUMBER(1,0);
    v_is_default NUMBER(1,0) := NULL;
    v_start_time TIMESTAMP := TO_TIMESTAMP('09:00:00', 'HH24:MI:SS');
    v_end_time TIMESTAMP := TO_TIMESTAMP('17:00:00', 'HH24:MI:SS');
    v_class_timing TIMESTAMP := TO_TIMESTAMP('10:00:00', 'HH24:MI:SS');
    v_region_id VARCHAR2(36);
    v_address_id VARCHAR2(36);
BEGIN

    FOR rec IN (
        SELECT name, active_status, region, address
        FROM src_centers
    )
    LOOP
        v_id := SYS_GUID();
        
        v_name := rec.name;
        IF rec.active_status = 'TRUE' THEN
            v_is_active := 1; 
        ELSE
            v_is_active := 0;
        END IF;

        SELECT id INTO v_region_id
        FROM tar_regions
        WHERE name = rec.region;


        SELECT id INTO v_address_id
        FROM tar_address
        WHERE address = rec.address;
        
        INSERT INTO tar_location(id, name, is_active, is_default, start_time, end_time, class_timing, region_id, address_id, created_by, updated_by, deleted_by)
        VALUES (v_id, v_name, v_is_active, v_is_default, v_start_time, v_end_time, v_class_timing, v_region_id, v_address_id, p_etl_user_id, p_etl_user_id, NULL);
        
        COMMIT;
    END LOOP;
    
EXCEPTION
  
    WHEN OTHERS THEN
        
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; 
        RAISE;
END sp_populate_location;
/

declare 
v_etl_user_id varchar2(36) := 100;
begin
sp_populate_location(v_etl_user_id);
end;
/
