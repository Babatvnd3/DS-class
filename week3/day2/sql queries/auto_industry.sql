
CREATE TABLE Automotive_Trends (
    Name VARCHAR(100),
    year INT,
    selling_price INT,
    km_driven INT,
    fuel VARCHAR(20),
    seller_type VARCHAR(30),
    transmission VARCHAR(20),
    owner VARCHAR(30),
    mileage VARCHAR(20),
    engine VARCHAR(20),
    max_power VARCHAR(20),
    torque VARCHAR(20),
    seats DECIMAL(2,1)
);


CREATE TABLE auto_trends (
	serial int primary key,
	name varchar(100),
	year int,
	selling_price int,
	km_driven int,
	fuel varchar(20),
	seller_type varchar(30)
	transmission varchar(20)
	owner varchar(30)
	mileage
	engine
	max_power
	torque
	seats


Create Table auto_trends ( 
	car_name TEXT,
	years 	INT,
	selling_price	INT,
	km_driven	INT,
	fuel		TEXT,
	seller_type	TEXT,
	transmission	TEXT,
	owners	TEXT,
	mileage	TEXT,
	engine	TEXT,
	max_power	TEXT,
	torque	TEXT,
	seats	INT
);






select * from auto_trends;

-- 1.Calculate the average selling price for cars with a manual transmission and owned by the first owner, for each fuel type. 

Select fuel, avg(selling_price) as avg_sp
from auto_trends
where transmission = 'Manual' AND owners = 'First Owner'
group by fuel;

-- 2. Find the top 3 car models with the highest average mileage, considering only cars with more than 5 seats.--
select car_name, seats, mileage
from auto_trends
where seats > 5
order by mileage desc
limit 3;

--3.Identify the car models where the difference between the maximum and minimum selling prices is greater than $10,000.
 Select 
    car_name,
    min(selling_price) AS min_p,
    max(selling_price) AS max_p,
    (max(selling_price) - min(selling_price)) AS diff_in_price
from auto_trends
group by car_name
having  (max(selling_price) - min(selling_price)) > 10000;

--4. 	Retrieve the names of cars with a selling price above the overall average selling price and a mileage below the overall average mileage.--
 
 SELECT car_name, selling_price, mileage
FROM auto_trends
WHERE selling_price > AVG(selling_price) FROM auto_trends
AND mileage < AVG(mileage) FROM auto_trends;

--5.	Calculate the cumulative sum of the selling prices over the years for each car model.--
select car_name, years, sum(selling_price) AS total_sp
from auto_trends
group by car_name, years
order by car_name, years;

--6. Identify the car models that have a selling price within 10% of the average selling price. --
select car_name, selling_price
from auto_trends
where selling_price <= 0.1 * (select avg(selling_price) from auto_trends)
order by selling_price asc;

--7.	Calculate the exponential moving average (EMA) of the selling prices for each car model, considering a smoothing factor of 0.2.--

--8.	Identify the car models that have had a decrease in selling price from the previous year.--
select car_name

