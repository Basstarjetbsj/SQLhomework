1. Выручка конкретного зала (Hall_Id=1) за конкретный месяц (7, July)

Select "Concerts"."Halls"."H_Title", 
	'July' as During_Month, 
	sum("Concerts"."Receipt_Items"."RI_Quantity" * "Concerts"."Receipt_Items"."RI_Price") as Month_Amount
from "Concerts"."Halls" 
	inner join "Concerts"."Concerts" ON "Concerts"."Halls"."Hall_Id"="Concerts"."Concerts"."Hall_Id" 
	inner join "Concerts"."Tickets" ON "Concerts"."Concerts"."Concert_Id"="Concerts"."Tickets"."Concert_Id" 
	inner join "Concerts"."Receipt_Items" ON "Concerts"."Tickets"."Ticket_Id"="Concerts"."Receipt_Items"."Ticket_Id"
	inner join "Concerts"."Receipts" ON "Concerts"."Receipt_Items"."Receipt_Id"="Concerts"."Receipts"."Receipt_Id"
where extract(MONTH FROM "Concerts"."Receipts"."R_Date")=7 and "Concerts"."Halls"."Hall_Id"=1
group by "Concerts"."Halls"."Hall_Id";


2. Топ успешных продюсеров (по количеству организованных концертов)

Select "Concerts"."Producers"."P_Title",
		count("Concerts"."Concerts"."Concert_Id") as Number_of_Concerts
from "Concerts"."Producers"
	inner join "Concerts"."Concerts" ON "Concerts"."Producers"."Producer_Id"="Concerts"."Concerts"."Producer_Id" 
group by "Concerts"."Producers"."P_Title"
order by count("Concerts"."Concerts"."Concert_Id") Desc
limit 5;

3. Топ успешных продюсеров (по количеству собранных денег)
Select "Concerts"."Producers"."P_Title", 
	sum("Concerts"."Receipt_Items"."RI_Quantity" * "Concerts"."Receipt_Items"."RI_Price") as Profit
from "Concerts"."Producers" 
    inner join "Concerts"."Concerts" ON "Concerts"."Producers"."Producer_Id"="Concerts"."Concerts"."Producer_Id" 
	inner join "Concerts"."Tickets" ON "Concerts"."Concerts"."Concert_Id"="Concerts"."Tickets"."Concert_Id" 
	inner join "Concerts"."Receipt_Items" ON "Concerts"."Tickets"."Ticket_Id"="Concerts"."Receipt_Items"."Ticket_Id"
	inner join "Concerts"."Receipts" ON "Concerts"."Receipt_Items"."Receipt_Id"="Concerts"."Receipts"."Receipt_Id"
group by "Concerts"."Producers"."Producer_Id"
order by Profit desc
limit 5;

4. У каких продюсеров больше всего сдают билетов и на какую сумму
SELECT "Concerts"."Producers"."P_Title", 
	SUM("Concerts"."Refund"."RF_Quantity" * "Concerts"."Tickets"."T_Price") AS Anti_Profit,
	SUM("Concerts"."Refund"."RF_Quantity") AS Num_of_tickets
FROM "Concerts"."Producers" 
    INNER JOIN "Concerts"."Concerts" ON "Concerts"."Producers"."Producer_Id"="Concerts"."Concerts"."Producer_Id"   
	INNER JOIN "Concerts"."Tickets" ON "Concerts"."Concerts"."Concert_Id"="Concerts"."Tickets"."Concert_Id" 
	INNER JOIN "Concerts"."Refund" ON "Concerts"."Tickets"."Ticket_Id"="Concerts"."Refund"."Ticket_Id"
		  
GROUP BY "Concerts"."Producers"."Producer_Id"
ORDER BY Num_of_tickets DESC;

5. Какие исполнители дали больше всего концертов
SELECT "Concerts"."Artists"."A_Name",
	COUNT("Concerts"."Concerts"."Concert_Id") AS Number_of_Concerts
FROM "Concerts"."Artists"
	INNER JOIN "Concerts"."Concerts" ON "Concerts"."Artists"."Artist_Id"="Concerts"."Concerts"."Artist_Id" 
GROUP BY "Concerts"."Artists"."A_Name"
ORDER BY Number_of_Concerts DESC
LIMIT 5;

6. Топ 5 концертов, на которые возвращали билеты

SELECT "Concerts"."Tickets"."Concert_Id" AS Concert, 
	SUM("Concerts"."Refund"."RF_Quantity") AS  Returned_Tickets
FROM "Concerts"."Tickets"
	INNER JOIN "Concerts"."Refund" ON "Concerts"."Tickets"."Ticket_Id"="Concerts"."Refund"."Ticket_Id"
GROUP BY "Concerts"."Tickets"."Concert_Id"
ORDER BY Returned_Tickets DESC
LIMIT 5;

7. Концерт, на котором было заполнено больше всего мест

SELECT "Concerts"."Tickets"."Concert_Id" AS Concert, 
	SUM("Concerts"."Seats"."S_Quantity_Max" - "Concerts"."Tickets"."T_Remaining_Seats") AS Buzy_Seats
FROM "Concerts"."Tickets" 
	INNER JOIN "Concerts"."Seats" ON "Concerts"."Tickets"."Seat_Id"="Concerts"."Seats"."Seat_Id" 
GROUP BY "Concerts"."Tickets"."Concert_Id"
--having sum("Concerts"."Receipt_Items"."RI_Quantity" * "Concerts"."Receipt_Items"."RI_Price") > money(300000)
ORDER BY Buzy_Seats DESC
LIMIT 1;

8.Артисты, которые играют больше, чем три концерта

SELECT "Concerts"."Artists"."A_Name" AS Artists,
	COUNT("Concerts"."Concerts"."Concert_Id") AS Number_of_Concerts
FROM "Concerts"."Artists"
	INNER JOIN "Concerts"."Concerts" ON "Concerts"."Artists"."Artist_Id"="Concerts"."Concerts"."Artist_Id"
GROUP BY "Concerts"."Artists"."A_Name"
HAVING COUNT("Concerts"."Concerts"."Concert_Id") > 3
ORDER BY Number_of_Concerts DESC;


