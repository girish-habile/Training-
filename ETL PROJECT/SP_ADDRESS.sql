


CREATE OR REPLACE PROCEDURE SP_POPULATE_ADDRESS(P_ETL_USER_ID IN VARCHAR2)
IS
    V_ADDRESS_id VARCHAR2(36); 
    V_CITY CONSTANT VARCHAR2(100) := 'NY';
    V_COUNTRY CONSTANT VARCHAR2(100) := 'USA';
    V_STATE CONSTANT VARCHAR2(100) := 'Manhattan';
    V_ZIPCODE CONSTANT VARCHAR2(20) := '10001';
    
    CURSOR CUR_SRC_ADDRESS IS 
        SELECT address
        FROM src_users
        UNION
        SELECT address
        FROM src_centers
        UNION
        SELECT academic_school AS address
        FROM src_courseenrollement;

    SRC_ADDRESS VARCHAR2(500); 
BEGIN
    OPEN CUR_SRC_ADDRESS;

    LOOP
        FETCH CUR_SRC_ADDRESS INTO SRC_ADDRESS;
        EXIT WHEN CUR_SRC_ADDRESS%NOTFOUND;

        v_ADDRESS_id := SYS_GUID(); 
     
     
        INSERT INTO TAR_ADDRESS(
            ID,
            ADDRESS,
            CITY,
            COUNTRY,
            STATE,
            ZIPCODE,
            CREATED_BY,
            UPDATED_BY
        ) VALUES (
            v_ADDRESS_id,
            SRC_ADDRESS,
            V_CITY,
            V_COUNTRY,
            V_STATE,
            V_ZIPCODE,
            P_ETL_USER_ID,
            P_ETL_USER_ID
        );

    END LOOP;

    CLOSE CUR_SRC_ADDRESS;
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        CLOSE CUR_SRC_ADDRESS;
        RAISE;
END SP_POPULATE_ADDRESS;
/



DECLARE
    v_etl_user_id VARCHAR2(100) := sys_guid();
BEGIN
    sp_populate_address(v_etl_user_id);
END;
/

select * from tar_address;

