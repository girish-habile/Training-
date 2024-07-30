

CREATE TABLE TAR_ADDRESS (
    ID VARCHAR2(36) DEFAULT SYS_GUID() PRIMARY KEY,
    ADDRESS VARCHAR2(250),
    APTSUITE VARCHAR2(20) DEFAULT NULL,
    LONGITUDE FLOAT DEFAULT NULL,
    LATITUDE FLOAT DEFAULT NULL,
    CITY VARCHAR2(100) DEFAULT 'NY',
    COUNTRY VARCHAR2(100) DEFAULT 'USA',
    STATE VARCHAR2(100) DEFAULT 'Manhattan',
    ZIPCODE VARCHAR2(100) DEFAULT '10001',
    CREATED_BY VARCHAR2(36) NOT NULL,
    UPDATED_BY VARCHAR2(36) NOT NULL,
    DELETED_BY VARCHAR2(36) DEFAULT NULL
);


CREATE TABLE TAR_USER (
    ID VARCHAR2(36) DEFAULT SYS_GUID() PRIMARY KEY,
    FIRST_NAME VARCHAR2(250),
    LAST_NAME VARCHAR2(250),
    MIDDLE_NAME VARCHAR2(250),
    GENDER VARCHAR2(20) DEFAULT 'M',
    IS_ACTIVE VARCHAR2(14) DEFAULT 'TRUE',
    CONTACT_NUMBER VARCHAR2(34),
    MANABADI_EMAIL VARCHAR2(70),
    PERSONAL_EMAIL VARCHAR2(54),
    ADDRESS_ID VARCHAR2(36),
    CREATED_BY VARCHAR2(36) NOT NULL,
    UPDATED_BY VARCHAR2(36) NOT NULL,
    DELETED_BY VARCHAR2(36) DEFAULT NULL
);

ALTER TABLE TAR_USER
ADD CONSTRAINT FK_TAR_USER_ADDRESS
FOREIGN KEY (ADDRESS_ID)
REFERENCES TAR_ADDRESS(ID);





CREATE TABLE TAR_REGIONS(
    ID VARCHAR2(36) DEFAULT SYS_GUID() PRIMARY KEY,
    NAME VARCHAR(250),
    DESCRIPTION VARCHAR2(250),
    CREATED_BY VARCHAR2(36) NOT NULL,
    UPDATED_BY VARCHAR2(36) NOT NULL,
    DELETED_BY VARCHAR2(36) DEFAULT NULL
);


CREATE TABLE tar_region_cordinator (
    id VARCHAR2(36) PRIMARY KEY,
    is_primary NUMBER(1,0),
    region_id VARCHAR2(36),
    user_id VARCHAR2(36),
    created_by VARCHAR2(36),
    updated_by VARCHAR2(36),
    deleted_by VARCHAR2(36),
    CONSTRAINT fk_region_id FOREIGN KEY (region_id) REFERENCES tar_regions(id),
    CONSTRAINT fk_coordinator_id FOREIGN KEY (user_id) REFERENCES tar_user(id)
);

CREATE TABLE tar_location (
    id VARCHAR2(36) PRIMARY KEY,
    name VARCHAR2(100),
    is_active NUMBER(1,0),
    is_default NUMBER(1,0),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    class_timing TIMESTAMP,
    region_id VARCHAR2(36),
    address_id VARCHAR2(36),
    created_by VARCHAR2(36),
    updated_by VARCHAR2(36),
    deleted_by VARCHAR2(36),
    CONSTRAINT fk_region_id_ FOREIGN KEY (region_id) REFERENCES tar_regions(id),
    CONSTRAINT fk_address_id_ FOREIGN KEY (address_id) REFERENCES tar_address(id)
);

CREATE TABLE tar_exam_center (
    id VARCHAR2(36) PRIMARY KEY,
    name VARCHAR2(100),
    is_active NUMBER(1,0),
    address_id VARCHAR2(36),
    location_id VARCHAR2(36),
    created_by VARCHAR2(36),
    updated_by VARCHAR2(36),
    deleted_by VARCHAR2(36),
    CONSTRAINT fk_address_id FOREIGN KEY (address_id) REFERENCES tar_address(id),
    CONSTRAINT fk_location_id FOREIGN KEY (location_id) REFERENCES tar_location(id)
);

CREATE TABLE tar_location_cordinator (
    id VARCHAR2(36) PRIMARY KEY,
    location_id VARCHAR2(36),
    user_id VARCHAR2(36),
    is_primary NUMBER(1,0),
    created_by VARCHAR2(36),
    updated_by VARCHAR2(36),
    deleted_by VARCHAR2(36),
    CONSTRAINT fk_location_id_  FOREIGN KEY (location_id) REFERENCES tar_location(id),
    CONSTRAINT fk_user_id_  FOREIGN KEY (user_id) REFERENCES tar_user(id)
);

create table tar_course(
     id varchar2(36) default sys_guid() primary key,
     name varchar(250),
     base_course varchar2(30) default 'TRUE',
     is_active varchar2(30) default 'TRUE',
     CREATED_BY VARCHAR2(36) NOT NULL,
    UPDATED_BY VARCHAR2(36) NOT NULL,
    DELETED_BY VARCHAR2(36) DEFAULT NULL
    );
     
     
     
CREATE TABLE tar_enrolled_course (
    id VARCHAR2(36) PRIMARY KEY,
    student_id VARCHAR2(36),
    academic_year VARCHAR2(50),
    academic_grade VARCHAR2(50),
    academic_school VARCHAR2(100),
    average_score NUMBER(5, 2),
    result VARCHAR2(50),
    is_course_completed VARCHAR2(5), 
    tshirt_size VARCHAR2(10),
    course_id VARCHAR2(36),
    center_id VARCHAR2(36),
    created_by VARCHAR2(36),
    updated_by VARCHAR2(36),
    deleted_by VARCHAR2(36),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES tar_course(id),
    CONSTRAINT fk_center_id FOREIGN KEY (center_id) REFERENCES tar_exam_center(id)
);






