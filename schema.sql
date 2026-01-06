create table equipment(
equipment_id int primary key,
equipment_name varchar(50),
equipment_type varchar(50),
installation_date date
)


create table maintenance_logs (
maintenance_id int primary key,
equipment_id int,
maintenance_date date,
maintenance_type varchar(20),
downtime_hours decimal(5,2),
foreign key (equipment_id) references equipment(equipment_id)

)


create table failures(
failure_id int primary key,
equipment_id int, 
failure_date date,
failure_type varchar(50),
foreign key (equipment_id) references equipment(equipment_id)
)