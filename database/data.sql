USE `9Food` ;
insert into Category(Id,Name) values (1,'food');
insert into Size(Id,Size) values (1,'xl');
insert into Size(Id,Size) values (2,'l');
insert into Size(Id,Size) values (3,'sl');
insert into Menu(Id,name,Descript,Costl,Price,Image_Path,CateId) values (1,'Steak','Nice Meat',200.50,250,'test',1);
insert into Menu(Id,name,Descript,Costl,Price,Image_Path,CateId) values (2,'Curry','Just Curry',300.56,350,'test2',1);
insert into Menu_has_Size(sizeid,menuid) values (1,1);
insert into Menu_has_Size(sizeid,menuid) values (2,1);
insert into Menu_has_Size(sizeid,menuid) values (3,1);