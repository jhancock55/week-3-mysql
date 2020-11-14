create database if not exists postTracker;

use postTracker;

drop table if exists commentTable;
drop table if exists postTable;
drop table if exists userData;

create table userData (
	user_id int(11) not null auto_increment,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	email varchar (25),
	user_name varchar (20) not null,
	password varchar (20) not null,
	primary key (user_id)
);

create table postTable (
	id int(11) not null auto_increment,
	user_id int(11) not null,
	post varchar(255),
	time_created datetime default current_timestamp,
	primary key(id),
	foreign key(user_id) references userData(user_id)
);

create table commentTable (
	id int(11) not null auto_increment,
	post_id int(11) not null,
	user_id int(11) not null,
	comment varchar(255),
	time_created datetime default current_timestamp,
	primary key (id),
	foreign key (post_id) references postTable(id),
	foreign key (user_id) references userData(user_id)
);
