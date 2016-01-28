CREATE TABLE `users` ( 
`username` varchar(45) CHARACTER SET utf8 NOT NULL, 
`enabled` bit(1) NOT NULL,
`password` varchar(60) CHARACTER SET utf8 NOT NULL, 
`name` varchar(30) CHARACTER SET utf8 NOT NULL,
`surname` varchar(30) CHARACTER SET utf8 NOT NULL,
`email` varchar(50) CHARACTER SET utf8 NOT NULL,
`gender` varchar(30) CHARACTER SET utf8 NOT NULL,
`age` varchar(2) NOT NULL,
`weight` varchar(2) NOT NULL,
`height` varchar(3) NOT NULL,
`sport` varchar(50) CHARACTER SET utf8 NOT NUlL,
`place` varchar(400) CHARACTER SET utf8 NOT NULL,
`photo` varchar(100) NOT NULL,
`checkusr` boolean,
PRIMARY KEY (`username`) 
) ENGINE=InnoDB DEFAULT CHARSET=UTF8; 

CREATE TABLE `user_roles` ( 
`user_role_id` int(11) NOT NULL auto_increment, 
`role` varchar(45) NOT NULL, 
`username` varchar(45) NOT NULL, 
PRIMARY KEY (`user_role_id`), 
KEY `FK_9ry105icat2dux14oyixybw9l` (`username`), 
CONSTRAINT `FK_9ry105icat2dux14oyixybw9l` FOREIGN KEY (`username`) REFERENCES `users` (`username`) 
) ENGINE=InnoDB DEFAULT CHARSET=UTF8; 

create table feedback
(
`idfeed` int auto_increment,
`usernameReciever` varchar(50) CHARACTER SET utf8,
`message` varchar(300) CHARACTER SET utf8,
PRIMARY KEY (idfeed)
)CHARACTER SET utf8;

create table dialog
(
`iddialog` int NOT NULL auto_increment,
`reciever` varchar(50) CHARACTER SET utf8 NOT NULL,
`username`varchar(45) CHARACTER SET utf8 NOT NULL,
PRIMARY KEY(`iddialog`),
foreign key (`username`) references users(`username`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8; 

create table message(
`idmessage` BIGINT not null auto_increment,
`text` varchar(300) character set utf8 NOT NULL,
`date` varchar(40) NOT NULL,
`iddialog` int NOT NULL,
`messender` varchar(50),
`checkms` boolean,
primary key (`idmessage`),
foreign key (`iddialog`) references dialog(`iddialog`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8; 

