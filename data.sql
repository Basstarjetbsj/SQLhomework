--Artists
insert into "Concerts"."Artists" 
("Artist_Id", "A_Name", "A_Phone", "A_Email", "A_Address") values 
(1, 'RedHead', '222333222', 'red_h@hmail.com', 'Moscow, Tverskaya st., 1, app. 305'),
(2, 'GreyEye', '111111111', 'gray_e@email.com', 'St.Petersburg, Leninsky pr., 11, app. 78'),
(3, 'BlueNose', '123456789', 'blue_n@bmail.com', 'Moscow, Yamskaya st., 7, app. 12'), 
(4, 'GreenFace', '9877777789', 'green_f@fmail.com', 'St.Petersburg, Nevsky pr., 20, app. 5'),
(5, 'YellowFoot', '5558558555', 'yellow_f@fmail.com', 'Moscow, Leningradsky pr., 15, app. 121'),
(6, 'BlackTooth', '123454321', 'black_t@tmail.com', 'St.Petersburg, Rizhsky pr., 18, app. 14'),
(7, 'RoseCheek', '7676767676', 'rose_c@cmail.com', 'Moscow, Kashirsky pr., 45, app. 3'),
(8, 'BrownHand', '1212121212', 'brown_h@hmail.com', 'Moscow, Pushkinskaya sq., 2, app. 22'),
(9, 'LightFinger', '999999999', 'light_f@fmail.com', 'Moscow, Stroiteley st., 13, app. 25'),
(10, 'DarkNail', '888888888', 'dark_n@nmail.com', 'Moscow, Zelenaya st., 5, app. 17');

--Producers
insert into "Concerts"."Producers" 
("Producer_Id", "P_Title", "P_Phone", "P_Email", "P_Address") values 
(1, 'Petrovitch_MC', '333333333', 'petr@hmail.com', 'Moscow, Tverskaya st., 7'),
(2, 'Ivanych_MC', '111999111', 'ivan@email.com', 'St.Petersburg, Leninsky pr., 70'),
(3, 'MusicShark', '222777222', 'music@bmail.com', 'Moscow, Yamskaya st., 20'), 
(4, 'CrazyGreen', '7777777777', 'green@fmail.com', 'St.Petersburg, Nevsky pr., 50'),
(5, 'YellowStar', '5550000555', 'yellow@fmail.com', 'Moscow, Leningradsky pr., 150'),
(6, 'BlackGuns', '9090909090', 'black@tmail.com', 'St.Petersburg, Rizhsky pr., 18'),
(7, 'FunDrive', '1000000009', 'fun@cmail.com', 'Moscow, Kashirsky pr., 10'),
(8, 'DarkSpider', '112112112', 'spider@hmail.com', 'Moscow, Pushkinskaya sq., 1'),
(9, 'HappyFallout', '5454545454', 'happy@fmail.com', 'Moscow, Stroiteley st., 2'),
(10, 'DarkFruit', '10201020', 'dark@nmail.com', 'Moscow, Zelenaya st., 3');

--Halls
insert into "Concerts"."Halls" 
("Hall_Id", "H_Title", "H_Phone", "H_Email", "H_Address") values 
(1, 'Luzhniki', '123123123', 'luzh@hmail.com', 'Moscow'),
(2, 'SKK', '111888111', 'skk@email.com', 'St.Petersburg'),
(3, 'Yubileiny', '222777222', 'yubil@bmail.com', 'St.Petersburg'), 
(4, 'Oktyabrsky', '70000007', 'okt@fmail.com', 'St.Petersburg'),
(5, 'Krokus', '5550000111', 'krokus@fmail.com', 'Moscow'),
(6, 'GigantHall', '70707070707', 'gig@tmail.com', 'St.Petersburg'),
(7, 'FunStadium', '155555559', 'funs@cmail.com', 'Moscow');

--Seats
insert into "Concerts"."Seats" 
("Seat_Id", "Hall_Id", "S_Category", "S_Quantity_Max") values 
(1, 1, 'партер', 100),
(2, 1, 'сектор', 1000),
(3, 2, 'партер', 80), 
(4, 2, 'сектор', 600),
(5, 3, 'партер', 50),
(6, 3, 'сектор', 500),
(7, 4, 'партер', 100),
(8, 4, 'амфитеатр', 200),
(9, 4, 'балкон', 150),
(10, 5, 'партер', 300),
(11, 5, 'амфитеатр', 800),
(12, 6, 'партер', 100),
(13, 6, 'амфитеатр', 400),
(14, 7, 'сектор', 5000);

--Concerts
insert into "Concerts"."Concerts" 
("Concert_Id", "Hall_Id", "Artist_Id", "Producer_Id", "C_Date") values 
(1, 1, 2, 3, '2022-12-15'),
(2, 1, 2, 1, '2022-12-16'),
(3, 1, 1, 2, '2022-12-20'), 
(4, 2, 1, 4, '2022-12-25'),
(5, 3, 3, 5, '2022-11-16'),
(6, 3, 3, 5, '2022-10-16'),
(7, 4, 3, 6, '2022-12-16'),
(8, 4, 4, 8, '2022-10-10'),
(9, 4, 4, 5, '2022-11-21'),
(10, 5, 1, 4, '2022-12-17'),
(11, 5, 9, 9, '2022-11-05'),
(12, 6, 8, 5, '2022-11-30'),
(13, 6, 3, 4, '2022-11-26'),
(14, 7, 1, 3, '2022-10-12'),
(15, 1, 6, 3, '2022-10-19'),
(16, 2, 9, 1, '2022-11-21'),
(17, 3, 1, 5, '2022-12-29'),
(18, 5, 3, 2, '2022-10-14'),
(19, 2, 1, 7, '2022-11-18'),
(20, 6, 3, 5, '2022-12-28');

--Tickets
insert into "Concerts"."Tickets" 
("Ticket_Id", "Concert_Id", "Seat_Id", "T_Price", "T_Remaining_Seats") values
(1, 1, 1, 101, 75),
(2, 1, 2, 51, 350),
(3, 2, 1, 120, 70),
(4, 2, 2, 60, 400),
(5, 3, 1, 150, 42),
(6, 3, 2, 80, 240),
(7, 4, 3, 140, 20),
(8, 4, 4, 75, 200),
(9, 5, 5, 200, 15),
(10, 5, 6, 100, 250),
(11, 6, 5, 210, 10),
(12, 6, 6, 110, 180),
(13, 7, 7, 250, 30),
(14, 7, 8, 200, 65),
(15, 7, 9, 105, 30),
(16, 8, 7, 251, 40),
(17, 8, 8, 201, 30),
(18, 8, 9, 106, 45),
(19, 9, 7, 252, 20),
(20, 9, 8, 202, 25),
(21, 9, 9, 107, 15),
(22, 10, 10, 155, 80),
(23, 10, 11, 95, 130),
(24, 11, 10, 156, 70),
(25, 11, 11, 96, 120),
(26, 12, 12, 300, 35),
(27, 12, 13, 150, 90),
(28, 13, 12, 301, 40),
(29, 13, 13, 151, 85),
(30, 14, 14, 100, 1450),
(31, 15, 1, 110, 70),
(32, 15, 2, 62, 200),
(33, 16, 3, 125, 50),
(34, 16, 4, 70, 180),
(35, 17, 5, 250, 10),
(36, 17, 6, 180, 25),
(37, 18, 10, 170, 130),
(38, 18, 11, 110, 300),
(39, 19, 3, 200, 12),
(40, 19, 4, 100, 125),
(41, 20, 12, 260, 35),
(42, 20, 13, 130, 70);

--Receipts
insert into "Concerts"."Receipts" 
("Receipt_Id", "R_Date", "R_Amount") values
(1, '2022-07-21', 14825),
(2, '2022-07-23', 179550),
(3, '2022-07-23', 41700),
(4, '2022-08-02', 33150),
(5, '2022-08-05', 101500),
(6, '2022-08-05', 187800),
(7, '2022-09-10', 164415),
(8, '2022-09-12', 164810),
(9, '2022-09-12', 83900),
(10, '2022-10-22', 66000),
(11, '2022-10-25', 65625),
(12, '2022-11-04', 59800),
(13, '2022-11-07', 355000),
(14, '2022-11-11', 16830),
(15, '2022-12-11', 10400);

--Receipt_Items
insert into "Concerts"."Receipt_Items" 
("RI_Id", "Receipt_Id", "Ticket_Id", "RI_Quantity", "RI_Price") values
(1, 1, 1, 25, 101),
(2, 1, 3, 30, 120),
(3, 1, 5, 58, 150),
(4, 2, 2, 650, 51),
(5, 2, 4, 600, 60),
(6, 2, 6, 760, 80),
(7, 2, 32, 800, 62),
(8, 3, 7, 60, 140),
(9, 3, 8, 400, 75),
(10, 3, 31, 30, 110),
(11, 4, 33, 30, 125),
(12, 4, 34, 420, 70),
(13, 5, 39, 68, 200),
(14, 5, 40, 475, 100),
(15, 5, 9, 35, 200),
(16, 5, 10, 250, 100),
(17, 5, 11, 40, 210),
(18, 6, 12, 320, 110),
(19, 6, 35, 40, 250),
(20, 6, 36, 475, 180),
(21, 6, 13, 70, 250),
(22, 6, 14, 135, 200),
(23, 6, 15, 120, 105),
(24, 7, 16, 60, 251),
(25, 7, 17, 170, 201),
(26, 7, 18, 105, 106),
(27, 7, 19, 80, 252),
(28, 7, 20, 175, 202),
(29, 7, 21, 135, 107),
(30, 7, 22, 220, 155),
(31, 8, 23, 670, 95),
(32, 8, 24, 230, 156),
(33, 8, 25, 680, 96),
(34, 9, 37, 170, 170),
(35, 9, 38, 500, 110),
(36, 10, 26, 65, 300),
(37, 10, 27, 310, 150),
(38, 11, 28, 60, 301),
(39, 11, 29, 315, 151),
(40, 12, 41, 65, 260),
(41, 12, 42, 330, 130),
(42, 13, 30, 3550, 100),
(43, 14, 2, 330, 51),
(44, 15, 41, 40, 260);

--Refund
insert into "Concerts"."Refund" 
("Refund_Id", "Receipt_Id", "Ticket_Id", "RF_Quantity", "RF_Date") values
(1, 2, 2, 330, '2022-11-11'),
(2, 12, 41, 40, '2022-12-11');
