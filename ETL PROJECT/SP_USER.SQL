

create or replace procedure sp_populate_user(p_etl_user_id in varchar2)
is
    v_id tar_user.id%type;
    v_first_name tar_user.first_name%type;
    v_middle_name tar_user.middle_name%type;
    v_last_name tar_user.last_name%type;
    v_gender tar_user.gender%type := 'M';
    v_is_active tar_user.is_active%type := 'TRUE';
    v_contact_number tar_user.contact_number%type;
    v_manabadi_email tar_user.manabadi_email%type;
    v_email  tar_user.personal_email%type;
    v_address_id tar_user.address_id%type := NULL;
    v_address src_users.address%type;
    
    cursor user_cursor is 
        select first_name , last_name, middle_name , contact_number , manabadi_id, email, address
        from src_users; 
    
begin
    open user_cursor;
    loop
        fetch user_cursor into v_first_name, v_last_name , v_middle_name,v_contact_number, v_manabadi_email, v_email, v_address;
        exit when user_cursor%NOTFOUND;
        
        v_id := sys_guid(); 
        
        select id into v_address_id from tar_address where address = v_address;
        
        
        insert into tar_user(id , first_name , last_name , middle_name , gender , is_active , contact_number , manabadi_email , personal_email, address_id ,created_by , updated_by)
        values (v_id , v_first_name , v_last_name , v_middle_name , v_gender , v_is_active , v_contact_number , v_manabadi_email , v_email, v_address_id ,p_etl_user_id , p_etl_user_id );
        
        commit;
    end loop;
    
    close user_cursor;
    
exception
    when others then
        if user_cursor%ISOPEN then
            close user_cursor;
        end if;
        raise;
end sp_populate_user;
/

declare 
v_etl_user varchar2(36) := sys_guid();
begin
sp_populate_user(v_etl_user);
end;
/





