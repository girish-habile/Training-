SELECT * FROM src_regions;
   
create or replace procedure sp_populate_regions(p_etl_user_id in varchar2)
is
    v_id tar_regions.id%type;
    v_name src_regions.region_name%type; 
    v_description tar_regions.description%type;
    
    cursor regions_cursor is 
        select region_name 
        from src_regions; 
    
begin
    open regions_cursor;
    
    loop
        fetch regions_cursor into v_name;
        exit when regions_cursor%NOTFOUND;
        
        v_id := sys_guid(); 
        insert into tar_regions(id, name, description, created_by, updated_by)
        values (v_id, v_name, v_name, p_etl_user_id, p_etl_user_id);
        
        commit;
    end loop;
    
    close regions_cursor;
    
exception
    when others then
        if regions_cursor%ISOPEN then
            close regions_cursor;
        end if;
        raise;
end sp_populate_regions;
/


DECLARE
    v_etl_user_id VARCHAR2(100) := 100;
BEGIN
    sp_populate_regions(v_etl_user_id);
END;
/

select * from tar_regions;
  