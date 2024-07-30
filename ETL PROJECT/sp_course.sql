
CREATE OR REPLACE PROCEDURE sp_populate_course(p_etl_user_id IN VARCHAR2)
IS
    v_id VARCHAR2(36);
    v_course_name src_courseenrollement.course_name%TYPE;
BEGIN
    FOR rec IN (SELECT DISTINCT course_name FROM src_courseenrollement) LOOP
       
        v_id := SYS_GUID();
        v_course_name := rec.course_name;

        INSERT INTO tar_course(id, name, created_by, updated_by, deleted_by)
        VALUES (v_id, v_course_name, p_etl_user_id, p_etl_user_id, NULL);

        COMMIT; 
    END LOOP;

EXCEPTION
    
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; 
        RAISE;
END sp_populate_course;
/
