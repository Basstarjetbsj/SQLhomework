1. Выручка конкретного зала (Hall_Id=1) за конкретный месяц (7, July)

Select "Concerts"."Halls"."H_Title", 
	'July' as During_Month, 
	sum("Concerts"."Receipt_Items"."RI_Quantity" * "Concerts"."Receipt_Items"."RI_Price") as Month_Amount
from "Concerts"."Halls" 
	natural join "Concerts"."Concerts" 
	natural join "Concerts"."Tickets"
	natural join "Concerts"."Receipt_Items"
	natural join "Concerts"."Receipts"
where extract(MONTH FROM "Concerts"."Receipts"."R_Date")=7 and "Concerts"."Halls"."Hall_Id"=1
group by "Concerts"."Halls"."Hall_Id";

2. Топ успешных продюсеров (по количеству организованных концертов)

Select "Concerts"."Producers"."P_Title",
		count("Concerts"."Concerts"."Concert_Id") as Number_of_Concerts
from "Concerts"."Producers"
	natural join "Concerts"."Concerts"
group by "Concerts"."Producers"."P_Title"
order by count("Concerts"."Concerts"."Concert_Id") Desc
limit 5;

3. Топ успешных продюсеров (по количеству собранных денег)
Select "Concerts"."Producers"."P_Title", 
	sum("Concerts"."Receipt_Items"."RI_Quantity" * "Concerts"."Receipt_Items"."RI_Price") as Profit
from "Concerts"."Producers" natural join "Concerts"."Concerts" 
	natural join "Concerts"."Tickets"
	natural join "Concerts"."Receipt_Items"
	natural join "Concerts"."Receipts"
group by "Concerts"."Producers"."Producer_Id"
order by Profit desc
limit 5;

4. У каких продюсеров больше всего сдают билетов и на какую сумму
SELECT "Concerts"."Producers"."P_Title", 
	SUM("Concerts"."Refund"."RF_Quantity" * "Concerts"."Tickets"."T_Price") AS Anti_Profit,
	SUM("Concerts"."Refund"."RF_Quantity") AS Num_of_tickets
FROM "Concerts"."Producers" NATURAL JOIN "Concerts"."Concerts" 
	NATURAL JOIN "Concerts"."Tickets"
	NATURAL JOIN "Concerts"."Refund"
		 
GROUP BY "Concerts"."Producers"."Producer_Id"
ORDER BY Num_of_tickets DESC;

5. Какие исполнители дали больше всего концертов
SELECT "Concerts"."Artists"."A_Name",
	COUNT("Concerts"."Concerts"."Concert_Id") AS Number_of_Concerts
FROM "Concerts"."Artists"
	NATURAL JOIN "Concerts"."Concerts"
GROUP BY "Concerts"."Artists"."A_Name"
ORDER BY Number_of_Concerts DESC
LIMIT 5;
