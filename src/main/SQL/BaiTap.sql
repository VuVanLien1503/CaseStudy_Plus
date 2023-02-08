create database book_management;
USE book_management;
create table users(
id int auto_increment primary key,
name varchar(255),
email varchar(255),
password varchar(255) ,
status boolean default true
);
insert into users (name,email,password)values("Hoàng","hoang@gmail.com","123456");
insert into users (name,email,password)values("Liên","lien@gmail.com","123456");
insert into users (name,email,password)values("Sơn","son@gmail.com","123456");
insert into users (name,email,password)values("Vũ Anh","vuAnh@gmail.com","123456");
select*from users;


create table info_user(
id int auto_increment primary key,
birthDay date,
phone varchar(10),
image varchar(255),
user_id int,
foreign key(user_id)references users(id),
status boolean default true
);
insert into info_user(birthDay,phone,image,user_id)values('2000-1-15','0989123455','../../image/imageUser/user_1.png','1');
insert into info_user(birthDay,phone,image,user_id)values('2001-2-16','0989123456','../../image/imageUser/user_2.png','2');
insert into info_user(birthDay,phone,image,user_id)values('2002-3-17','0989123457','../../image/imageUser/user_3.png','3');
insert into info_user(birthDay,phone,image,user_id)values('2003-4-18','0989123458','../../image/imageUser/user_4.png','4');

create table producer(
 id int auto_increment primary key,
 name varchar (255),
 status boolean default true
 );
 insert into producer(name) values('Nhà xuất bản Trẻ');
 insert into producer(name) values('Nhà xuất bản Kim Đồng');
 insert into producer(name) values('Nhà xuất bản CodeGym');
 insert into producer(name) values('Nhà xuất bản Hội Nhà văn');
 
 create table category(
 id int auto_increment primary key,
 name varchar (255),
 status boolean default true
 );
  insert into category(name) values('Trinh Thám');
  insert into category(name) values('Tiểu Thuyết');
  insert into category(name) values('Lập Trình');
  insert into category(name) values('Ma Thuật');
  
  
 create table book_position(
 id int auto_increment primary key,
 name varchar (255),
 positionContain int,
 position varchar(255),
 quantityNow int,
 status boolean default true
 );
 insert into book_position(name,positionContain,position,quantityNow)values('Tầng một','100','A001','10');
 insert into book_position(name,positionContain,position,quantityNow)values('Tầng một','100','A002','10');
 insert into book_position(name,positionContain,position,quantityNow)values('Tầng một','100','A003','10');

 insert into book_position(name,positionContain,position,quantityNow)values('Tầng Hai','100','B001','10');
 insert into book_position(name,positionContain,position,quantityNow)values('Tầng Hai','100','B002','10');
 insert into book_position(name,positionContain,position,quantityNow)values('Tầng Hai','100','B003','10');

  create table book(
 id int auto_increment primary key,
 name varchar (255),
descriptions varchar(255),
image varchar(255),
status_book boolean default true,
quantity int ,
producer_id int,
category_id int,
book_position int,
foreign key (producer_id) references producer(id),
foreign key (category_id) references category(id),
foreign key (book_position) references book_position(id),
status boolean default true
 );
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Trinh_Tham_1','Tốt','../../image/imageBook/TrinhTham/Sach_Trinh_Tham_1.png',10,1,1,1);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Trinh_Tham_1','Tốt','../../image/imageBook/TrinhTham/Sach_Trinh_Tham_2.png',10,1,1,1);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Trinh_Tham_1','Tốt','../../image/imageBook/TrinhTham/Sach_Trinh_Tham_3.png',10,1,1,1);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Trinh_Tham_1','Tốt','../../image/imageBook/TrinhTham/Sach_Trinh_Tham_4.png',10,1,1,1);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Trinh_Tham_1','Tốt','../../image/imageBook/TrinhTham/Sach_Trinh_Tham_5.png',10,1,1,1);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Trinh_Tham_1','Tốt','../../image/imageBook/TrinhTham/Sach_Trinh_Tham_6.png',10,1,1,1);

insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Tieu_Thuyet_1','Tốt','../../image/imageBook/TieuThuyet/Sach_Tieu_Thuyet_1.jpg',10,2,2,2);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Tieu_Thuyet_2','Tốt','../../image/imageBook/TieuThuyet/Sach_Tieu_Thuyet_2.jpg',10,2,2,2);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Tieu_Thuyet_3','Tốt','../../image/imageBook/TieuThuyet/Sach_Tieu_Thuyet_3.jpg',10,2,2,2);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Tieu_Thuyet_4','Tốt','../../image/imageBook/TieuThuyet/Sach_Tieu_Thuyet_4.jpg',10,2,2,2);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Tieu_Thuyet_5','Tốt','../../image/imageBook/TieuThuyet/Sach_Tieu_Thuyet_5.jpg',10,2,2,2);


insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Ma_Thuat_1','Tốt','../../image/imageBook/MaThuat/Sach_Ma_Thuat_1.png',10,4,4,3);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Ma_Thuat_2','Tốt','../../image/imageBook/MaThuat/Sach_Ma_Thuat_2.png',10,4,4,3);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Ma_Thuat_3','Tốt','../../image/imageBook/MaThuat/Sach_Ma_Thuat_3.png',10,4,4,3);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Ma_Thuat_4','Tốt','../../image/imageBook/MaThuat/Sach_Ma_Thuat_4.png',10,4,4,3);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Ma_Thuat_5','Tốt','../../image/imageBook/MaThuat/Sach_Ma_Thuat_5.png',10,4,4,3);

insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Lap_Trinh_1','Tốt','../../image/imageBook/lapTrinh/Sach_Lap_Trinh_1.png',10,4,3,4);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Lap_Trinh_2','Tốt','../../image/imageBook/lapTrinh/Sach_Lap_Trinh_2.png',10,4,3,4);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Lap_Trinh_3','Tốt','../../image/imageBook/lapTrinh/Sach_Lap_Trinh_3.png',10,4,3,4);
insert into book(name,descriptions,image,quantity,producer_id,category_id,book_position) values('Sach_Lap_Trinh_4','Tốt','../../image/imageBook/lapTrinh/Sach_Lap_Trinh_4.png',10,4,3,4);
