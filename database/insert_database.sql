use springbootweb;

insert into role(code,name) values('ADMIN','Quản trị hệ thống');
insert into role(code,name) values('USER','người dùng');
insert into role(code,name) values('STAFF','nhân viên');

CREATE TABLE building (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          floorarea INT,
                          ward VARCHAR(100),
                          street VARCHAR(100),
                          numberofbasement INT,
                          direction VARCHAR(50),
                          level VARCHAR(50),
                          rentprice DECIMAL(18,2),
                          managername VARCHAR(100),
                          managerphone VARCHAR(20),
                          rentpricedescription TEXT,
                          servicefee TEXT,
                          district VARCHAR(100),
                          type VARCHAR(100),
                          brokeragefee DECIMAL(5,2),
                          motofee VARCHAR(100),
                          waterfee VARCHAR(100),
                          electricityfee VARCHAR(100),
                          deposit VARCHAR(100),
                          payment VARCHAR(100),
                          renttime VARCHAR(100),
                          decorationtime VARCHAR(100),
                          note TEXT,
                          overtimefee VARCHAR(100),
                          avatar VARCHAR(255)
);
INSERT INTO building (  name, floorarea, ward, street, numberofbasement, direction, level,     rentprice, managername, managerphone, rentpricedescription, servicefee, district, type, brokeragefee, motofee, waterfee,     electricityfee, deposit, payment, renttime, decorationtime,     note, overtimefee, avatar )
VALUES ('Tòa nhà Sunrise', 1500, 'Trung Hòa', 'Trần Duy Hưng', 3, 'Đông Bắc', 'A',  30000000, 'Nguyễn Văn Quản Lý', '0909123456', 'Giá thuê đã bao gồm VAT',  'Miễn phí dịch vụ 3 tháng đầu', 'Cầu Giấy', 'TANG_TRET,NGUYEN_CAN', 5.5, '100k/tháng',  'Miễn phí', 'Theo công tơ', '3 tháng', 'Chuyển khoản', '12 tháng',  '2 tuần', 'Ghi chú thêm về tòa nhà', '150k/giờ', 'sunrise.jpg'),
       ('Tòa nhà GreenLand', 1800, 'Dịch Vọng', 'Cầu Giấy', 2, 'Tây Nam', 'B',  35000000, 'Trần Thị Quản Lý', '0912345678', 'Giá thuê chưa bao gồm VAT',  'Miễn phí gửi xe máy', 'Cầu Giấy', 'NGUYEN_CAN', 6.0, 'Miễn phí',  'Có đồng hồ riêng', 'Theo hóa đơn', '2 tháng', 'Tiền mặt', '24 tháng',  '1 tháng', 'Tòa nhà mới xây, tiện nghi', '200k/giờ', 'greenland.jpg'),
       ('Tòa nhà OceanView', 2200, 'Mai Dịch', 'Phạm Văn Đồng', 4, 'Nam', 'C',  40000000, 'Lê Văn Quản Lý', '0987654321', 'Giá thuê linh hoạt theo diện tích',  'Bao gồm điện nước', 'Bắc Từ Liêm', 'NOI_THAT', 7.0, '150k/tháng',  'Tính theo đầu người', 'Trọn gói', '1 tháng', 'Chuyển khoản', '36 tháng',  '3 tuần', 'Có view hồ, phù hợp làm văn phòng', '250k/giờ', 'oceanview.jpg'),
('Tòa nhà Vincom Tower', 5000, 'Láng Hạ', 'Thái Hà', 5, 'Đông Nam', 'A',80000000, 'Phạm Văn Quản Lý', '0909000111', 'Giá thuê trọn gói theo diện tích','Miễn phí bảo trì 1 năm', 'Đống Đa', 'NGUYEN_CAN,NOI_THAT', 8.0, '150k/tháng','Miễn phí', 'Theo công tơ', '6 tháng', 'Chuyển khoản', '60 tháng','1 tháng', 'Tòa nhà cao cấp trung tâm Hà Nội', '300k/giờ', 'vincom.jpg'),
('Tòa nhà Keangnam Landmark', 7000, 'Mễ Trì', 'Phạm Hùng', 6, 'Tây Bắc', 'A+',120000000, 'Nguyễn Thị Quản Lý', '0911222333', 'Giá thuê linh hoạt theo tầng','Miễn phí gửi xe 6 tháng đầu', 'Nam Từ Liêm', 'TANG_TRET,NOI_THAT', 10.0, '200k/tháng','Có đồng hồ riêng', 'Theo hóa đơn', '12 tháng', 'Chuyển khoản', '120 tháng','2 tháng', 'Tòa nhà biểu tượng, tiện ích đầy đủ', '500k/giờ', 'keangnam.jpg'),
('Tòa nhà Lotte Center', 6000, 'Liễu Giai', 'Đào Tấn', 4, 'Đông Bắc', 'A+',100000000, 'Đặng Văn Quản Lý', '0933444555', 'Giá thuê bao gồm dịch vụ cao cấp','Dịch vụ lễ tân chuyên nghiệp', 'Ba Đình', 'NGUYEN_CAN,TANG_TRET', 9.5, '250k/tháng','Theo thỏa thuận', 'Trọn gói', '6 tháng', 'Tiền mặt', '84 tháng','1.5 tháng', 'Vị trí đắc địa, tầm nhìn đẹp', '400k/giờ', 'lotte.jpg'),
('Tòa nhà Times City', 5500, 'Minh Khai', 'Nguyễn Khoái', 3, 'Nam', 'B+',70000000, 'Vũ Thị Quản Lý', '0944555666', 'Giá thuê hấp dẫn cho doanh nghiệp vừa','Hỗ trợ marketing tòa nhà', 'Hai Bà Trưng', 'TANG_TRET', 7.0, '120k/tháng','Miễn phí 3 tháng đầu', 'Theo công tơ', '3 tháng', 'Chuyển khoản', '48 tháng','1 tháng', 'Tòa nhà phức hợp nhiều tiện ích', '280k/giờ', 'timescity.jpg'),
 (
    'Tòa nhà LAZ', 2000, 'Trung Hòa', 'Trần Duy Hưng', 3, 'Đông Bắc', 'A',
    30000000, 'Nguyễn Văn', '0909123456', 'Giá thuê đã bao gồm VAT',
    'Miễn phí dịch vụ 3 tháng đầu',
    'Cầu Giấy', 'OFFICE', 5.0, '100k/xe', 'Theo giá nhà nước', 'Theo giá EVN',
    '3 tháng', 'Hàng tháng', '2 năm', '1 tháng', 'Tòa nhà mới xây',
    '200k/giờ', 'laz.jpg'
    );

insert into user(username,password,fullname,status)
values('admin','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','admin',1);
insert into user(username,password,fullname,status)
values('nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van a',1);
insert into user(username,password,fullname,status)
values('nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van b',1);
INSERT INTO user(username, password, fullname, status)
VALUES('tranthibich',
       '$2a$10$QkzjYjsfA9y7mB4SPx8uEus5Vw5ApcE2uXSlH0wxg6XTo8xJAvbOm',
       'Trần Thị Bích', 1);
INSERT INTO user(username, password, fullname, status)
VALUES('lequangminh',
       '$2a$10$1Zz3mZ5YWfKnHJkKxfs6teoOa/m4H84syfEOVoHJND2yL6F7I6j7K',
       'Lê Quang Minh', 1);
INSERT INTO user(username, password, fullname, status)
VALUES('phamthithao',
       '$2a$10$73hCV2jMfZ/bvD7cFeM90u7zxtuEZuBoBpckOvEwwIBg5t2M3c2iC',
       'Phạm Thị Thảo', 1);
INSERT INTO user(username, password, fullname, status)
VALUES('dangvanhieu',
       '$2a$10$KfX8sIpmW6Cq2YuxBzXl6u7q1yXv7WxHqph0dVgz1TkqAQrKZcO9u',
       'Đặng Văn Hiếu', 1);
INSERT INTO user(username, password, fullname, status)
VALUES('doanthithu',
       '$2a$10$L1.5wRdn0SHoY1pXlHKe8Od49oRgzlhKMP7BvujvK7Z9XxE/BxTt6',
       'Đoàn Thị Thu', 1);

INSERT INTO user_role(user_id,role_id) VALUES (1,1);
INSERT INTO user_role(user_id,role_id) VALUES (2,3);
INSERT INTO user_role(user_id,role_id) VALUES (3,3);
INSERT INTO user_role(user_id, role_id) VALUES (3, 3);
INSERT INTO user_role(user_id, role_id) VALUES (4, 3);
INSERT INTO user_role(user_id, role_id) VALUES (5, 3);
INSERT INTO user_role(user_id, role_id) VALUES (6, 3);
INSERT INTO user_role(user_id, role_id) VALUES (7, 3);
INSERT INTO user_role(user_id, role_id) VALUES (8, 3);
INSERT INTO user_role(user_id, role_id) VALUES (9, 3);
INSERT INTO user_role(user_id, role_id) VALUES (10, 3);

insert into assignmentbuilding(id,buildingid,staffid) values(1,1,1);
insert into assignmentbuilding(id,buildingid,staffid) values(2,1,2);
insert into assignmentbuilding(id,buildingid,staffid) values(3,2,3);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(4, 2, 3);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(5, 2, 5);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(6, 2, 6);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(7, 3, 4);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(8, 3, 7);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(9, 3, 8);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(10, 4, 2);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(11, 4, 5);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(12, 4, 6);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(13, 5, 3);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(14, 5, 7);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(15, 5, 8);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(16, 6, 2);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(17, 6, 4);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(18, 6, 6);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(19, 7, 5);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(20, 7, 7);
INSERT INTO assignmentbuilding(id, buildingid, staffid) VALUES(21, 7, 8);

CREATE TABLE rentarea (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          value INT NOT NULL,
                          buildingid INT NOT NULL,
                          createddate DATETIME,
                          modifieddate DATETIME,
                          createdby VARCHAR(255),
                          modifiedby VARCHAR(255)
);
INSERT INTO rentarea (value, buildingid) VALUES (100, 1),
                                             (200, 1),
                                             (200, 2),
                                             (300, 2),
                                             (400, 3),
                                             (300, 3),
                                             (100, 4),
                                             (100, 4),
                                             (100, 4),
                                             (250, 4),
                                             (250, 4),
                                             (150, 5),
                                             (200, 5),
                                             (250, 5);


