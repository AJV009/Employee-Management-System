#To calculate the profit or loss for a given date:
set serveroutput on 
#
create or replace function profitday(dat sales.sales_date %type) return varchar2 as
profit sales.sales %type;
loss sales.cost %type;
cos sales.sales %type;
sal sales.sales %type; 
exp exception ;
begin
select sales into sal from sales where sales_date = dat;
select cost into cos from sales where sales_date = dat;
if (sal > cos) then 
profit := sal -cos;
dbms_output.put_line('The profit on '||dat||' is = '||profit);
elsif(cos > sal) then
loss := cos - sal;
dbms_output.put_line('The loss on '||dat||' is = '||loss);
else
raise exp;
end if;
return 'success';
exception when exp then
dbms_output.put_line('no profit no loss' );
end;
/
#To calculate the whole year profit and loss
create or replace procedure pro_loss as 
profit sales.sales %type;
loss sales.sales %type;
cos number ;
sale number;
begin
select sum(sales.sales ) into sale from sales ;
select sum(sales.cost) into cos from sales;
if (sale > cos ) then
profit := sale-cos;
dbms_output.put_line('The profit of one year is = '||profit);
else
loss := cos - sale;
dbms_output.put_line('The loss of one year is = '||loss);
end if;
end;
/
#To calculate maximum product  sold in a year:
create or replace procedure max_pro_sale as
max_quantity v1.quantity1 %type;
product v1.product_code %type;
begin
select  max(quantity1) into max_quantity from v1;
select product_code into product from v1 where quantity1 = max_quantity;
dbms_output.put_line('The maximum production sale in  year is of product  '||product||' having quantity '||max_quantity);
end;
/
#To calculate minimum product sold in a year:
create or replace procedure min_pro_sale as
min_quantity v1.quantity1 %type;
product v1.product_code %type;
begin
select  min(quantity1) into min_quantity from v1;
select product_code into product from v1 where quantity1 = min_quantity;
dbms_output.put_line('The minimum production sale in  year is of product  '||product||' having quantity '||min_quantity);
end;
/
