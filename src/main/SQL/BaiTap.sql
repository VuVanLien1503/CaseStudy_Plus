create database book_management;
USE book_management;
create table users(
                      id int auto_increment primary key,
                      name varchar(255),
                      email varchar(255),
                      password varchar(255) ,
                      birthDay date,
                      phone varchar(10),
                      image varchar(255),
                      status boolean default true
);
insert into users (name,email,password,birthDay,phone,image)values("Hoàng","hoang@gmail.com","123456",'2000-1-15','0989123455','../../image/imageUser/user_2.png');
insert into users (name,email,password,birthDay,phone,image)values("Liên","lien@gmail.com","123456",'2001-2-16','0989123456','../../image/imageUser/user_2.png');
insert into users (name,email,password,birthDay,phone,image)values("Sơn","son@gmail.com","123456",'2002-3-17','0989123457','../../image/imageUser/user_3.png');
insert into users (name,email,password,birthDay,phone,image)values("Vũ Anh","vuAnh@gmail.com","123456",'2003-4-18','0989123458','../../image/imageUser/user_4.png');

create table producer(
                         id int auto_increment primary key,
                         name varchar (255),
                         status boolean default true
);
insert into producer(name) values('NXB-Trẻ');
insert into producer(name) values('NXB-Kim Đồng');
insert into producer(name) values('NXB-CodeGym');
insert into producer(name) values('NXB-Nhà văn');

create table category(
                         id int auto_increment primary key,
                         name varchar (255),
                         status boolean default true
);
insert into category(name) values('Trinh Thám');
insert into category(name) values('Tiểu Thuyết');
insert into category(name) values('Lập Trình');
insert into category(name) values('Ma Thuật');


create table positions(
                          id int auto_increment primary key,
                          name varchar (255),
                          contain int,
                          position varchar(255),
                          quantityNow int,
                          status boolean default true
);
insert into positions(name,contain,position,quantityNow)values('Tầng một','100','A001','10');
insert into positions(name,contain,position,quantityNow)values('Tầng một','100','A002','10');
insert into positions(name,contain,position,quantityNow)values('Tầng một','100','A003','10');

insert into positions(name,contain,position,quantityNow)values('Tầng Hai','100','B001','10');
insert into positions(name,contain,position,quantityNow)values('Tầng Hai','100','B002','10');
insert into positions(name,contain,position,quantityNow)values('Tầng Hai','100','B003','10');

create table book(
                     id int auto_increment primary key,
                     name varchar (255),
                     descriptions varchar(255),
                     image varchar(255),
                     status_book boolean default true,
                     quantity int ,
                     producer_id int,
                     category_id int,
                     position_id int,
                     foreign key (producer_id) references producer(id),
                     foreign key (category_id) references category(id),
                     foreign key (position_id) references positions(id),
                     status boolean default true
);
insert into book(name,descriptions,image,quantity,producer_id,category_id,position_id) values('Sach_Trinh_Tham_5','Tốt','../../image/imageBook/TrinhTham/Sach_Trinh_Tham_5.png',10,1,1,1);
insert into book(name,descriptions,image,quantity,producer_id,category_id,position_id) values('Sach_Trinh_Tham_6','Tốt','../../image/imageBook/TrinhTham/Sach_Trinh_Tham_6.png',10,1,1,1);
insert into book(name,descriptions,image,quantity,producer_id,category_id,position_id) values('Sach_Tieu_Thuyet_1','Tốt','../../image/imageBook/TieuThuyet/Sach_Tieu_Thuyet_1.jpg',10,2,2,2);
insert into book(name,descriptions,image,quantity,producer_id,category_id,position_id) values('Sach_Tieu_Thuyet_2','Tốt','../../image/imageBook/TieuThuyet/Sach_Tieu_Thuyet_2.jpg',10,2,2,2);
insert into book(name,descriptions,image,quantity,producer_id,category_id,position_id) values('Sach_Ma_Thuat_1','Tốt','../../image/imageBook/MaThuat/Sach_Ma_Thuat_1.png',10,4,4,3);
insert into book(name,descriptions,image,quantity,producer_id,category_id,position_id) values('Sach_Lap_Trinh_3','Tốt','../../image/imageBook/lapTrinh/Sach_Lap_Trinh_3.png',10,4,3,4);
insert into book(name,descriptions,image,quantity,producer_id,category_id,position_id) values('Sach_Lap_Trinh_3','Tốt','../../image/imageBook/lapTrinh/Sach_Lap_Trinh_4.png',10,4,3,4);
insert into book(name,descriptions,image,quantity,producer_id,category_id,position_id) values('Sach_Ma_Thuat_3','Tốt','../../image/imageBook/MaThuat/Sach_Ma_Thuat_3.png',10,4,4,3);
insert into book(name,descriptions,image,quantity,producer_id,category_id,position_id) values('Sach_Ma_Thuat_4','Tốt','../../image/imageBook/MaThuat/Sach_Ma_Thuat_4.png',10,4,4,3);



SELECT book.id,book.name,book.descriptions,book.image,book.status_book,book.quantity,book.producer_id,book.category_id,book.position_id,book.status FROM book
                                                                                                                                                             inner join producer on book.producer_id =producer.id
                                                                                                                                                             inner join category on book.category_id =category.id
                                                                                                                                                             inner join positions on book.position_id = positions.id
where producer.status=true and category.status=true and positions.status=true;