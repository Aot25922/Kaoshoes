USE `9Food` ;
insert into Category(CateId,CateName) values (1,'food');
insert into Size(SizeId,SizeValue) values (1,'xl');
insert into Size(SizeId,SizeValue) values (2,'l');
insert into Size(SizeId,SizeValue) values (3,'sl');
insert into Menu(MenuId,MenuName,Descript,Costl,Price,Image_Path,CateId) values (1,'Steak','Nice Meat',200.50,250,'test',1);
insert into Menu(MenuId,MenuName,Descript,Costl,Price,Image_Path,CateId) values (2,'Curry','Just Curry',300.56,350,'test2',1);
insert into Menu_has_Size(sizeid,menuid) values (1,1);
insert into Menu_has_Size(sizeid,menuid) values (2,1);
insert into Menu_has_Size(sizeid,menuid) values (3,1);