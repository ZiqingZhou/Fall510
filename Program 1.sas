/* Chapter 3.2 level 1 4.a.
7 observations are in the orion.country data set.
6 variables.
South Africa is the name of the last country in the data set.*/
/*4.b.*/
proc contents data=orion._all_nods;
run;

/*US_SUPPLIERS is the last member listed.*/
/* Chapter 3.2 level 2 5.a.*/
proc contents data=orion.staff;
run;

/*5.b.
The general information section indicates that the data set is sorted.
The variablle section indicates that it is sorted by Employee_ID using
the ANSI character set, and has been validated. */
/*Chapter 4.1 level 1 1.a*/
proc print data=orion.order_fact;
run;

/*1.b*/
proc print data=orion.order_fact;
	sum Total_Retail_Price;
run;

/*1.c*/
proc print data=orion.order_fact;
	sum Total_Retail_Price;
	where Total_Retail_Price > 500;
run;

/*The numbers are not sequential. The original observation numbers
are displayed.
The sum of Total_Retail_Price changed to reflect only the subset.*/
/*1.d*/
proc print data=orion.order_fact noobs;
	sum Total_Retail_Price;
	where Total_Retail_Price > 500;
run;

/* Checking the log can help us verify the number of observations in
the results.*/
/*1.e*/
proc print data=orion.order_fact noobs;
	sum Total_Retail_Price;
	where Total_Retail_Price > 500;
	id Customer_ID;
run;

/* Customer_ID is the leftmost column and is displayed on each line
for an observation.*/
/*1.f*/
proc print data=orion.order_fact noobs;
	sum Total_Retail_Price;
	where Total_Retail_Price > 500;
	id Customer_ID;
	var Customer_ID Order_ID Order_Type Quantity Total_Retail_Price;
run;

/* There are two columns of Customer_ID. The first column is the ID
field, and a second one is included because Customer_ID is listed in
the VAR statment.*/
/*1.g*/
proc print data=orion.order_fact noobs;
	sum Total_Retail_Price;
	where Total_Retail_Price > 500;
	id Customer_ID;
	var Order_ID Order_Type Quantity Total_Retail_Price;
run;

/* Remove the duplicate column by removing Customer_ID from the VAR
statement.*/
/*Chapter 4.1 level 2 2.a*/
proc print data=orion.customer_dim;
run;

/*2.b*/
proc print data=orion.customer_dim noobs;
	where Customer_Age between 30 and 40;
run;

/*2.c*/
proc print data=orion.customer_dim noobs;
	where Customer_Age between 30 and 40;
	id Customer_ID;
run;

/*2.d*/
proc print data=orion.customer_dim noobs;
	where Customer_Age between 30 and 40;
	id Customer_ID;
	var Customer_Name Customer_Age Customer_Type;
run;

/*Chapter 4.2 level 1 5.a&b*/
proc sort data=orion.employee_payroll out=work.sort_salary;
	by Salary;
run;

proc print data=work.sort_salary;
run;

/*Chapter 4.2 level 1 6.a*/
proc sort data=orion.employee_payroll out=work.sort_salary2;
	by Employee_Gender descending Salary;
run;

proc print data=work.sort_salary2;
run;

/*6.b*/
proc sort data=orion.employee_payroll out=work.sort_salary2;
	by Employee_Gender descending Salary;
run;

proc print data=work.sort_salary2;
	by Employee_Gender;
run;

/*Chapter 4.2 leve2 1 7.a*/
proc sort data=orion.employee_payroll out=work.sort_sal;
	by Employee_Gender descending Salary;
run;

/*7.b*/
proc sort data=orion.employee_payroll out=work.sort_sal;
	by Employee_Gender descending Salary;
run;

proc print data=work.sort_sal noobs;
	by Employee_Gender;
	sum Salary;
	where Employee_Term_Date is missing and Salary > 65000;
	var Employee_ID Salary Marital_Status;
run;

/*Chapter 4.3 level 1 9.a*/
proc print data=orion.sales noobs;
	where Country='AU' and Job_Title contains 'Rep. IV';
run;

/*9.b*/
proc print data=orion.sales;
	where Country='AU' and Job_Title contains 'Rep. IV';
	var Employee_ID First_Name Last_Name Gender Salary;
run;

/*9.c&d*/
title1 'Australian Sales Employee';
title2 'Senior Sales Representatives';
footnote 'Job_Title:Sales Rep. IV';

proc print data=orion.sales;
	where Country='AU' and Job_Title contains 'Rep. IV';
	var Employee_ID First_Name Last_Name Gender Salary;
run;

/*9.e*/
title1 'Australian Sales Employee';
title2 'Senior Sales Representatives';
footnote 'Job_Title:Sales Rep. IV';

proc print data=orion.sales;
	where Country='AU' and Job_Title contains 'Rep. IV';
	var Employee_ID First_Name Last_Name Gender Salary;
run;

title;
footnote;

/*Chapter 4.3 level 1 10.a*/
title 'Entry-level Sales Representatives';
footnote 'Job_Title: Sales Rep. I';

proc print data=orion.sales noobs label;
	where Country='US' and Job_Title='Sales Rep. I';
	var Employee_ID First_Name Last_Name Gender Salary;
	label Employee_ID="Employee ID" First_Name="First Name" Last_Name="Last Name" 
		Salary="Annual Salary";
run;

title;
footnote;

/*10.b*/
title 'Entry-level Sales Representatives';
footnote 'Job_Title: Sales Rep. I';

proc print data=orion.sales noobs split=' ';
	where Country='US' and Job_Title='Sales Rep. I';
	var Employee_ID First_Name Last_Name Gender Salary;
	label Employee_ID="Employee ID" First_Name="First Name" Last_Name="Last Name" 
		Salary="Annual Salary";
run;

title;
footnote;

/*Chapter 4.3 level 2 11.a*/
proc sort data=orion.employee_addresses out=work.address;
	where Country='US';
	by State City Employee_Name;
run;

title "US Employee by State";

proc print data=work.address noobs split=' ';
	var Employee_ID Employee_Name city Postal_Code;
	label Employee_ID='Employee ID' Employee_Name='Name' Postal_Code='Zip Code';
	by State;
run;

/*Chapter 5.1 level 1 1.a*/
proc print data=orion.employee_payroll;
run;

/*1.b*/
proc print data=orion.employee_payroll;
	var Employee_ID Salary Birth_Date Employee_Hire_Date;
run;

/*1.c*/
proc print data=orion.employee_payroll;
	var Employee_ID Salary Birth_Date Employee_Hire_Date;
	format Salary dollar11.2 Birth_Date mmddyy10. 
            Employee_Hire_Date date9.;
run;

/*Chapter 5.1 level 2 2.a*/
title1 'US Sales Employees';
title2 'Earning Under $26,000';

proc print data=orion.sales noobs label;
	where Country='US' and Salary < 26000;
	var Employee_ID First_Name Last_Name Job_Title Salary Hire_Date;
	label First_Name='First Name' Last_Name='Last Name' Job_Title='Title' 
		Hire_Date='Date Hired';
	format Salary dollar7.  
            Hire_Date monyy7.;
run;

title;
footnote;

/*Chapter 5.2 level 1 4.a*/
data Q1Birthdays;
	set orion.employee_payroll;
	BirthMonth=month(Birth_Date);

	if BirthMonth le 3;
run;

/*4.b*/
proc format ;
	value $gender 'F'='Female' 'M'='Male';
run;

/*4.c*/
proc format ;
	value mname 1='January' 2='February' 3='March';
run;

/*4.d*/
proc print data=Q1Birthdays;
	format Employee_Gender $gender.
          BirthMonth mname.;
run;

/*4.e*/
data Q1Birthdays;
	set orion.employee_payroll;
	BirthMonth=month(Birth_Date);

	if BirthMonth le 3;
run;

proc format ;
	value $gender 'F'='Female' 'M'='Male';
	value mname 1='January' 2='February' 3='March';
run;

title 'Employees with Birthday in Q1';

proc print data=Q1Birthdays;
	var Employee_ID Employee_Gender BirthMonth;
	format Employee_Gender $gender.
          BirthMonth mname.;
run;

title;

/*Chapter 5.2 level 2 5.a*/
proc print data=orion.nonsales;
	var Employee_ID Job_Title Salary Gender;
	title1 'Salary and Gender Values';
	title2 'for Non-Sales Employees';
run;

/*5.b*/
proc format ;
	value $gender 'F'='Female' 'M'='Male' other='Invalid code';
run;

/*5.c*/
proc format ;
	value salrange .='Missing salary' 20000-<100000='Below $100,000' 
		100000-500000='$100,000 or more' other='Invalid salary';
run;

/*5.d*/
proc format ;
	value $gender 'F'='Female' 'M'='Male' other='Invalid code';
	value salrange .='Missing salary' 20000-<100000='Below $100,000' 
		100000-500000='$100,000 or more' other='Invalid salary';
run;

proc print data=orion.nonsales;
	var Employee_ID Job_Title Salary Gender;
	title1 'Salary and Gender Values';
	title2 'for Non-Sales Employees';
	format Salary salrange. Gender $gender.;
run;

title;

/*Chapter 6.2 level 2 5.a*/
data work.delays;
	set orion.orders;
run;

/*5.b*/
data work.delays;
	set orion.orders;
	Order_Month=month(Order_Date);
run;

/*5.c*/
data work.delays;
	set orion.orders;
	where Delivery_Date > Order_Date+4 and Employee_ID=99999999;
	Order_Month=month(Order_Date);

	if Order_Month=8;
run;

/*5.d*/
data work.delays;
	set orion.orders;
	where Delivery_Date > Order_Date+4 and Employee_ID=99999999;
	Order_Month=month(Order_Date);

	if Order_Month=8;
	keep Employee_ID Customer_ID Order_Date Delivery_Date Order_Month;
run;

/*5.e*/
data work.delays;
	set orion.orders;
	where Delivery_Date > Order_Date+4 and Employee_ID=99999999;
	Order_Month=month(Order_Date);

	if Order_Month=8;
	label Order_Date='Date Ordered' Delivery_Date='Date Delivered' 
		Order_Month='Month Ordered' keep Employee_ID Customer_ID Order_Date 
		Delivery_Date Order_Month;
run;

/*5.f*/
data work.delays;
	set orion.orders;
	where Delivery_Date > Order_Date+4 and Employee_ID=99999999;
	Order_Month=month(Order_Date);

	if Order_Month=8;
	label Order_Date='Date Ordered' Delivery_Date='Date Delivered' 
		Order_Month='Month Ordered' format Order_Date Delivery_Date mmddyy10.;
	keep Employee_ID Customer_ID Order_Date Delivery_Date Order_Month;
run;

/*5.g*/
proc contents data=work.delays;
run;

/*5.h*/
data work.delays;
	set orion.orders;
	where Delivery_Date > Order_Date+4 and Employee_ID=99999999;
	Order_Month=month(Order_Date);

	if Order_Month=8;
	label Order_Date='Date Ordered' Delivery_Date='Date Delivered' 
		Order_Month='Month Ordered' format Order_Date Delivery_Date mmddyy10.;
	keep Employee_ID Customer_ID Order_Date Delivery_Date Order_Month;
run;

proc contents data=work.delays;
run;

proc print data=work.delays;
run;

/*Chapter 9.1 level 2 2.a*/
data work.birthday;
	set orion.customer;
run;

/*2.b*/
data work.birthday;
	set orion.customer;
	Bday2012=mdy(month(Birth_Date), day(Birth_Date), 2012);
	BdayDOW2012=weekday(Bday2012);
	Age2012=(Bday2012-Birth_Date)/365.25;
run;

/*2.c*/
data work.birthday;
	set orion.customer;
	Bday2012=mdy(month(Birth_Date), day(Birth_Date), 2012);
	BdayDOW2012=weekday(Bday2012);
	Age2012=(Bday2012-Birth_Date)/365.25;
	keep Customer_Name Birth_Date Bday2012 BdayDOW2012 Age2012;
run;

/*2.d*/
data work.birthday;
	set orion.customer;
	Bday2012=mdy(month(Birth_Date), day(Birth_Date), 2012);
	BdayDOW2012=weekday(Bday2012);
	Age2012=(Bday2012-Birth_Date)/365.25;
	keep Customer_Name Birth_Date Bday2012 BdayDOW2012 Age2012;
	format Bday2012 date9. Age2012 3.;
run;

/*2.e*/
data work.birthday;
	set orion.customer;
	Bday2012=mdy(month(Birth_Date), day(Birth_Date), 2012);
	BdayDOW2012=weekday(Bday2012);
	Age2012=(Bday2012-Birth_Date)/365.25;
	keep Customer_Name Birth_Date Bday2012 BdayDOW2012 Age2012;
	format Bday2012 date9. Age2012 3.;
run;

proc print data=work.birthday;
run;

/*Chapter 9.2 level 2 6.a*/
data work.season;
	set orion.customer_dim;
run;

/*6.b*/
data work.season;
	set orion.customer_dim;
	length Promo2 $ 6;
	Quarter=qtr(Customer_BirthDate);

	if Quarter=1 then
		Promo='Winter';
	else if Quarter=2 then
		Promo='Spring';
	else if Quarter=3 then
		Promo='Summer';
	else if Quarter=4 then
		Promo='Fall';

	if Customer_Age>=18 and Customer_Age<=25 then
		Promo2='YA';
	else if Customer_Age>=65 then
		Promo2='Senior';
run;

/*6.c*/
data work.season;
	set orion.customer_dim;
	length Promo2 $ 6;
	Quarter=qtr(Customer_BirthDate);

	if Quarter=1 then
		Promo='Winter';
	else if Quarter=2 then
		Promo='Spring';
	else if Quarter=3 then
		Promo='Summer';
	else if Quarter=4 then
		Promo='Fall';

	if Customer_Age>=18 and Customer_Age<=25 then
		Promo2='YA';
	else if Customer_Age>=65 then
		Promo2='Senior';
	keep Customer_FirstName Customer_LastName Customer_BirthDate Customer_Age 
		Promo Promo2;
run;

/*6.d*/
data work.season;
	set orion.customer_dim;
	length Promo2 $ 6;
	Quarter=qtr(Customer_BirthDate);

	if Quarter=1 then
		Promo='Winter';
	else if Quarter=2 then
		Promo='Spring';
	else if Quarter=3 then
		Promo='Summer';
	else if Quarter=4 then
		Promo='Fall';

	if Customer_Age>=18 and Customer_Age<=25 then
		Promo2='YA';
	else if Customer_Age>=65 then
		Promo2='Senior';
	keep Customer_FirstName Customer_LastName Customer_BirthDate Customer_Age 
		Promo Promo2;
run;

proc print data=work.season;
	var Customer_FirstName Customer_LastName Customer_BirthDate Promo Customer_Age 
		Promo2;
run;

/*Chapter 9.2 level 2 7.a*/
data work.ordertype;
	set orion.orders;
run;

/*7.b*/
data work.ordertype;
	set orion.orders;
	DayOfWeek=weekday(Order_Date);
run;

/*7.c*/
data work.ordertype;
	set orion.orders;
	DayOfWeek=weekday(Order_Date);

	if Order_Type=1 then
		Type='Retail Sale';
	else if Order_Type=2 then
		Type='Catalog Sale';
	else if Order_Type=3 then
		Type='Internet Sale';
run;

/*7.d*/
data work.ordertype;
	set orion.orders;
	length Type $ 13 SaleAds $ 5;
	DayOfWeek=weekday(Order_Date);

	if Order_Type=1 then
		Type='Retail Sale';
	else if Order_Type=2 then
		do;
			Type='Catalog Sale';
			SaleAds='Mail';
		end;
	else if Order_Type=3 then
		do;
			Type='Internet Sale';
			SaleAds='Email';
		end;
run;

/*7.e*/
data work.ordertype;
	set orion.orders;
	length Type $ 13 SaleAds $ 5;
	DayOfWeek=weekday(Order_Date);

	if Order_Type=1 then
		Type='Retail Sale';
	else if Order_Type=2 then
		do;
			Type='Catalog Sale';
			SaleAds='Mail';
		end;
	else if Order_Type=3 then
		do;
			Type='Internet Sale';
			SaleAds='Email';
		end;
	drop Order_Type Employee_ID Customer_ID;
run;

/*7.f*/
data work.ordertype;
	set orion.orders;
	length Type $ 13 SaleAds $ 5;
	DayOfWeek=weekday(Order_Date);

	if Order_Type=1 then
		Type='Retail Sale';
	else if Order_Type=2 then
		do;
			Type='Catalog Sale';
			SaleAds='Mail';
		end;
	else if Order_Type=3 then
		do;
			Type='Internet Sale';
			SaleAds='Email';
		end;
	drop Order_Type Employee_ID Customer_ID;
run;

proc print data=work.ordertype;
run;

/*Chapter 10.1 level 2 3.a*/
proc contents data=orion.charities;
run;

proc contents data=orion.us_suppliers;
run;

proc contents data=orion.consultants;
run;

/*for orion.charities:
Code	    Char	6
Company	    Char	40
ContactType	Char	10
for orion.us_suppliers:
Code	    Char	6
Company	    Char	30
ContactType	Char	1
for orion.consultants:
Code	    Char	6
Company	    Char	30
ContactType	Num	    8   */
/*3.b*/
data work.contacts;
	set orion.charities orion.us_suppliers;
run;

/*3.c*/
proc contents data=work.contacts;
run;

/*The first data set in the set statement, orion.charities.*/
/*3.d*/
data work.contacts2;
	set orion.us_suppliers orion.charities;
run;

/*3.e*/
proc contents data=work.contacts2;
run;

/*The first data set in the set statement, orion.us_suppliers.*/
/*3.f*/
data work.contacts3;
	set orion.us_suppliers orion.consultants;
run;

/*Chapter 10.3 level 2 5.a*/
proc sort data=orion.product_list out=work.product_list;
	by Product_Level;
run;

/*5.b*/
proc sort data=orion.product_list out=work.product_list;
	by Product_Level;
run;

data work.listlevel;
	merge orion.product_level work.product_list;
	by Product_Level;
	keep Product_ID Product_Name Product_Level Product_Level_Name;
run;

/*5.c*/
proc sort data=orion.product_list out=work.product_list;
	by Product_Level;
run;

data work.listlevel;
	merge orion.product_level work.product_list;
	by Product_Level;
	keep Product_ID Product_Name Product_Level Product_Level_Name;
run;

proc print data=work.listlevel noobs;
	where Product_Level=3;
run;

/*Chapter 10.4 level 2 8.a*/
proc sort data=orion.customer out=work.customer;
	by Country;
run;

/*8.b*/
proc sort data=orion.customer out=work.customer;
	by Country;
run;

data work.allcustomer;
	merge work.customer orion.lookup_country(rename=(Start=Country 
		Label=Country_Name));
	by Country;
	keep Customer_ID Country Customer_Name Country_Name run;

	/*8.c*/
proc sort data=orion.customer out=work.customer;
	by Country;
run;

data work.allcustomer;
	merge work.customer orion.lookup_country(rename=(Start=Country 
		Label=Country_Name));
	by Country;
	keep Customer_ID Country Customer_Name Country_Name run;

proc print data=work.allcustomer;
run;

/*8.d*/
proc sort data=orion.customer out=work.customer;
	by Country;
run;

data work.allcustomer;
	merge work.customer(in=Cust) orion.lookup_country(rename=(Start=Country 
		Label=Country_Name) in=Ctry);
	by Country;
	keep Customer_ID Country Customer_Name Country_Name;

	if Cust=1 and Ctry=1;
run;

/*8.e*/
proc sort data=orion.customer out=work.customer;
	by Country;
run;

data work.allcustomer;
	merge work.customer(in=Cust) orion.lookup_country(rename=(Start=Country 
		Label=Country_Name) in=Ctry);
	by Country;
	keep Customer_ID Country Customer_Name Country_Name;

	if Cust=1 and Ctry=1;
run;

proc print data=work.allcustomer;
run;













