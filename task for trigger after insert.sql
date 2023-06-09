create table system_table ( 
username varchar(255), 
old_value varchar(255),
new_value varchar(255), 
date_time datetime 
); 
create table system_tableAuditlog ( 
username varchar(255),  
date_time datetime,
logintime time, 
logouttime time
); 
insert into system_table  values('defaultuser','nida','nidakhan', now()); 
insert into system_table  values('adminuser','ram','ramsharma', now());
delimiter //
create trigger T1 after insert on system_table
for each row 
begin
insert into system_tableAuditlog (username , date_time , logintime, logouttime) values(new.username , now(), current_time(), current_time()); 
end //
delimiter ; 
insert into system_table (username, old_value,new_value,date_time) values('adminuser','ram','ramsharma', now());
select * from system_tableAuditlog; 
