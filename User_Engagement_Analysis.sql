select * from survey limit 10 ;  
 
select count(distinct user_id) , question from survey group by question ;
 
select * from quiz limit 5;
select * from home_try_on limit 5;
select * from purchase limit 5; 
 
with user_activity as 
(select q.user_id , h.user_id is not null as 'is_home_try' , h.number_of_pairs , p.user_id is not null as 'is_purchase' from quiz q 
left join home_try_on h on q.user_id = h.user_id left join purchase p on h.user_id = p.user_id limit 50)
 
select distinct count(user_id) , sum(is_home_try) ,sum(is_purchase) , 100*sum(is_home_try)/count(distinct user_id) as from_b_to_try , 
100*sum(is_purchase)/sum(is_home_try) as from_try_to_buy from user_activity ;
 
select style , count(style) from quiz group by style order by 1;
 
select product_id , count(product_id) from purchase group by product_id order by 2 ;
