use themepark;

select * from wonderla;

# easy questions:



 # 1) get total amount expenses in the overall wonderla trip.
 
 select sum(`total paid`) as total_amount from wonderla;
 
# 2)  person wise expenses . total

select name ,sum(`total paid`) as person_expense from wonderla group by name;

# 3) food,snacks, wise expenses by individual.

select name ,
 sum(amount) as beverages_individual
 from wonderla where `Expenses Category` in ('food','snacks') 
 group by 1 order by 
 beverages_individual 
 desc;
 
 # 4)What is the total amount spent on Travel by all individuals?
 
 select name , sum(amount) tot_amount_indi from wonderla group by 1 order by 2 desc;
 
 # 5) How many individuals purchased the Wonderla Pass?
 
 select count(*) as pass_purchased from wonderla where `Expenses Category` = "Wonderla Pass";
 
 # 6) What is the total amount spent on Snacks?
 
 select  sum(amount) as snacks_tot_amount from wonderla where `Expenses Category` = "snacks";
 
 # 7) Which individual spent the least on Travel?
 
 select name ,sum(amount) as low_Spender_travel from wonderla  where `Expenses Category` = 'Travel'
 group by 1 order by 2 asc limit 1 ;
 
 # 8) What is the total amount spent on Food?
 
 select sum(amount) as food_tot from wonderla where `Expenses Category` = 'food';
 
 # 9) How many unique expense categories are there in the dataset?
 
 select count(distinct(`expenses category`))from wonderla;
 
 # 10) What is the total amount spent by Ajay Sekar?
 
 select sum(amount) as ajay_tot_invest from wonderla where name = 'Ajay Sekar';
 
 # 11) What is the total amount spent by Karthick?
 
 select sum(amount) bittu_tot_invest from wonderla where name = 'Karthick ';
 
 # 12) What is the total amount spent on Locker?
 
 select amount from wonderla where `expenses category` =  'Locker';
 
 # 13) What is the total amount spent on Dress?
 
 select amount from wonderla where `expenses category` =  'dress';
 
 # 14) List of all unique participants
 
 select distinct(name) from wonderla;
 
# 15)  List all expenses sorted by date

select distinct(`Expenses Category`), notes , date from wonderla order by date asc;

# 16) Number of expense entries per day

select count(`Expenses Category`) as perday_expenses,date  from wonderla group by 2 order by 2 asc;

# 17)  List expenses greater than ₹500

select * from wonderla where amount > 500;

# 18)  Find the most expensive single entry

select * from wonderla order by amount desc limit 1;

## medium level questions.




# 19) Which individual spent the most overall, and what is their total expenditure?

select name , sum(amount) most_spender from wonderla group by name order by 2 desc limit 1;

# 20) Which category had the second-highest total expenditure?

select distinct(`Expenses Category`) , sum(amount)
 from wonderla group by 1 
 order by 2 desc limit 2;
 
 # or
 
select `Expenses Category` , total_Amount from
(select `Expenses Category` , sum(amount) as total_Amount from wonderla group by 1 ) as new_tab
where total_Amount 
<
(select max(total_Amount) from (select sum(amount) as total_Amount from wonderla group by `Expenses Category` )
 as new_tab2 )
 order by total_Amount desc limit 1;
 

# 21) What is the average amount spent on Travel per individual?

select name , avg(amount) from wonderla where  `Expenses Category` = "Travel" group by 1;

# 22) Which individual spent the most on Snacks?

select name , max(amount) as high_snack_spender
 from wonderla where  `Expenses Category` = "snacks"
 group by 1 order by 2 desc limit 1;


# 23) What is the total expenditure for each individual and category ? 

select distinct(name) ,  `Expenses Category`, sum(amount) from wonderla group by 1,2 order by 1 asc;

# 24) Which individual spent the least overall, and what is their total expenditure?

select distinct(name) , sum(amount) as tot from wonderla group by 1 having tot = min(amount); 

# 25) what is the average amount food per individual

select name ,`Expenses Category`, avg(amount) from wonderla group by 1,2 having `Expenses Category` = "food";

# 26) How many individuals spent more than 1000 in total?

select count(distinct(name)) from wonderla where amount>= 1000;

# 27) What is the total amount spent on Wonderla Pass by individuals who also spent on Snacks?

# wonderla pass and snacks name mattum dha venum


select name , sum(amount) from wonderla where `Expenses Category`= 'Wonderla Pass'
and name in (
select name  from wonderla where `Expenses Category`= 'snacks' )
group by 1;

# 28) 📆 Which day had the highest spend?

select date , sum(amount) as high_spend_Date from wonderla group by 1 order by 2 desc;

# 29) Get all notes that include the word 'ticket'

select * from wonderla where notes like "%ticket%"; 

# 30) How many tickets were bought (category: Wonderla Pass)?

select count(nnn) as wonderla_pss_count from (select notes nnn from wonderla where Notes ='wonderla ticket') as ticket
