

CREATE OR REPLACE PROCEDURE sp_enrolled_course(p_etl_user_id IN VARCHAR2)
IS
    v_id VARCHAR2(36);
    v_student_id VARCHAR2(36);
    v_academic_year src_courseenrollement.academic_year%TYPE;
    v_academic_grade src_courseenrollement.academic_grade%TYPE;
    v_academic_school src_courseenrollement.academic_school%TYPE;
    v_average_score src_courseenrollement.average_score%TYPE;
    v_result src_courseenrollement.result%TYPE;
    v_is_course_completed src_courseenrollement.course_completed%TYPE;
    v_tshirt_size src_courseenrollement.shirt_size%TYPE;
    v_course_id VARCHAR2(36);
    v_center_id VARCHAR2(36);
    v_course_name varchar2(36);
    v_center_name varchar2(36);
    
    CURSOR enrollment_cursor IS
        SELECT academic_year, academic_grade, academic_school, average_score,
               result, course_completed, shirt_size, course_name, center_name
        FROM src_courseenrollement;
    
BEGIN
    OPEN enrollment_cursor;
    
    LOOP
        FETCH enrollment_cursor INTO v_academic_year, v_academic_grade, v_academic_school,
                                     v_average_score, v_result, v_is_course_completed,
                                     v_tshirt_size, v_course_name, v_center_name;
        EXIT WHEN enrollment_cursor%NOTFOUND;
        
        v_id := SYS_GUID();
        v_student_id := SYS_GUID();
        
        SELECT id INTO v_course_id
        FROM tar_course
        WHERE name = v_course_name;
        
        SELECT id INTO v_center_id
        FROM tar_exam_center
        WHERE name = v_center_name;
        
        INSERT INTO tar_enrolled_course(id, student_id, academic_year, academic_grade,
                                        academic_school, average_score, result,
                                        is_course_completed, tshirt_size, course_id,
                                        center_id, created_by, updated_by, deleted_by)
        VALUES (v_id, v_student_id, v_academic_year, v_academic_grade, v_academic_school,
                v_average_score, v_result, v_is_course_completed, v_tshirt_size,
                v_course_id, v_center_id, p_etl_user_id, p_etl_user_id, NULL);
        
        COMMIT; 
    END LOOP;

    CLOSE enrollment_cursor;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK; 
        RAISE;
END sp_enrolled_course;
/
