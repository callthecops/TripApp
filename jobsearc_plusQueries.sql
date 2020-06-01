SELECT * FROM jobsearch_plus.leads;

create table activities(
	activity_id INT NOT NULL AUTO_INCREMENT,
    lead_id INT NOT NULL,
    activity_date DATETIME NOT NULL DEFAULT
    CURRENT_TIMESTAMP,
    activity_type VARCHAR(30) NOT NULL,
    activity_details VARCHAR(1024) NULL,
    complete BIT(1) NULL DEFAULT 0,
    reference_link VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY(activity_id),
    INDEX activity_date_idx (activity_date ASC),
    INDEX activity_type_idx (activity_type ASC));
    
    create table activity_types(
    activity_type VARCHAR(30) NOT NULL,
    PRIMARY KEY(activity_type));
    
    select activity_type from activity_types ORDER BY activity_type;
    
    create table sources(
		source_id int not null auto_increment,
        source_name varchar(50) not null,
        source_type varchar(50) not null,
        source_link varchar(255) null default null,
        source_desc varchar(1024) null default null,
        PRIMARY KEY(source_id),
        INDEX source_name_idx (source_name ASC),
        index source_type_idx (source_type ASC));
        
        
    create table companies(
    company_id INT NOT NULL AUTO_INCREMENT,
    company_name VARCHAR(75) NOT NULL,
    address1 VARCHAR(75) NULL DEFAULT NULL,
    address2 VARCHAR(75) NULL DEFAULT NULL,
    city VARCHAR(50) NULL DEFAULT NULL,
    co_state CHAR(2) NULL DEFAULT NULL,
    zip CHAR(10) NULL DEFAULT NULL,
    phone CHAR(14) NULL DEFAULT NULL,
    fax CHAR(14) NULL DEFAULT NULL,
    email VARCHAR(50) NULL DEFAULT NULL,
    website VARCHAR(50) NULL DEFAULT NULL,
    company_desc VARCHAR(1024) NULL DEFAULT NULL,
    business_type VARCHAR(30) NULL DEFAULT NULL,
    agency BIT(1) NOT NULL DEFAULT b'0',
    PRIMARY KEY(company_id),
    INDEX company_name_idx (company_name ASC),
    INDEX city_idx (city ASC),
    INDEX state_idx (co_state ASC),
    INDEX zip_idx (zip ASC),
    INDEX business_type_idx (business_type ASC));
    
    create table contacts(
    contact_id INT NOT NULL AUTO_INCREMENT,
    company_id INT NOT NULL,
    courtesy_title VARCHAR(25) NOT NULL,
    contact_first VARCHAR(35) NULL DEFAULT NULL,
    contact_last VARCHAR(35) NOT NULL,
    title VARCHAR(35) NOT NULL,
    phone CHAR(14) NULL DEFAULT NULL,
    fax CHAR(14) NULL DEFAULT NULL,
    email VARCHAR(50) NULL DEFAULT NULL,
    comments VARCHAR(1024) NULL DEFAULT NULL,
    active BIT(1) NOT NULL DEFAULT b'1',
    PRIMARY KEY (contact_id),
    INDEX company_idx (company_id ASC),
    INDEX last_name_idx (contact_last ASC),
    INDEX first_name_idx (contact_first ASC));
    
    create table business_types(
    business_type VARCHAR(30) NOT NULL,
    PRIMARY KEY(business_type));