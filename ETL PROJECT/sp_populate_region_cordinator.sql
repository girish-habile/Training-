

CREATE OR REPLACE PROCEDURE sp_populate_region_cordinator(p_etl_user_id IN VARCHAR2)
IS 
    v_id VARCHAR2(36); 
    v_is_primary NUMBER := 1;
    v_region_id tar_region_cordinator.region_id%TYPE;
    v_user_id tar_region_cordinator.user_id%TYPE;
    
    
BEGIN
    FOR rec IN (
        SELECT region_name, regional_coordinator
        FROM SRC_REGIONS
    )
    LOOP
        v_id := SYS_GUID();
        
        SELECT id INTO v_region_id
        FROM tar_regions
        WHERE name = rec.region_name;
        
        SELECT id INTO v_user_id
        FROM tar_user
        WHERE first_name = rec.regional_coordinator;
        
        INSERT INTO tar_region_cordinator(id, is_primary, region_id, user_id, created_by, updated_by, deleted_by)
        VALUES (v_id, v_is_primary, v_region_id, v_user_id, p_etl_user_id, p_etl_user_id, NULL);
        v_is_primary := 0;
    END LOOP;
    
    COMMIT;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for lookup.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; 
        RAISE;
END sp_populate_region_cordinator;
/


