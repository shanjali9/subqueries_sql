--Inner Join on the Actor and film_actor table
select actor.actor_id, first_name, last_name, film_id
from film_actor 
inner join actor 
on actor.actor_id = film_actor.actor_id;

--Left join on the Actor and film_actor table 
select actor.actor_id, first_name, last_name, film_id
from film_actor 
left join actor 
on actor.actor_id = film_actor.actor_id;

--Join that will produce info about a customer 
--From the country of Angola 
select customer.first_name, customer.last_name, customer.email, country
from customer 
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id 
where country = 'Angola';

--Subquery Examples

--Two queries split apart

--Find a customer_id that has an amount greater than 175 in total payments
select customer_id
from payment 
group by customer_id 
having SUM(amount) > 175
order by SUM(amount) desc;

--Subquery to do ^^^
select store_id, first_name, last_name
from customer 
where customer_id in ( 
      select customer_id 
      from payment 
      group by customer_id 
      having SUM(amount) > 175
      order by SUM(amount) desc 
)
group by store_id, first_name, last_name

--Find customers in Angola who have a sum amount of purchases > 175
select customer.first_name, customer.last_name, customer.email, country 
from customer 
inner join address 
on customer.address_id = address.address_id
inner join city 
on address.city_id = city.city_id 
inner join country 
on city.country_id = country.country_id 
where country = 'Angola' and customer_id in (
      select customer_id 
      from payment 
      group by customer_id 
      having SUM(amount) > 175
      order by SUM(amount) desc 
);

--Basic subquery 
select * 
FROM customer 
where customer_id in (
      select customer_id 
      from payment 
      group by customer_id 
      having sum(amount) > 175
      order by sum(amount) desc
);

select * 
from payment 
group by payment_id 
having sum(amount) > 175
order by sum(amount) desc 
);

--Basic subquery 
--Find all flims with a langauge of English 
select * 
from film 
where language_id in (
      select language_id 
      from language
      where name = 'English'
);

select 
    case 
    	when film_id = 1 then 'Film ID One!'
    	else 'Not film ID one'
    end
as is_film_one
from film;
    


