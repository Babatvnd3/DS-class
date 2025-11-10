# 🚗 Automotive Trends SQL Analysis

This project explores automotive sales data to uncover trends in pricing, mileage, ownership, and vehicle performance features.  
Using SQL, the analysis answers key business and data insights questions around **car selling prices, ownership patterns, and model performance over time.**

---

## 🧱 Table Structure

The main table used in this analysis is **`auto_trends`**, which contains information about different car listings:

| Column | Description |
|---------|-------------|
| `car_name` | Name or model of the car |
| `years` | Year of manufacture |
| `selling_price` | Selling price of the car |
| `km_driven` | Total kilometers driven |
| `fuel` | Type of fuel used (Petrol, Diesel, CNG, etc.) |
| `seller_type` | Type of seller (Individual, Dealer, etc.) |
| `transmission` | Type of transmission (Manual or Automatic) |
| `owners` | Ownership status (First Owner, Second Owner, etc.) |
| `mileage` | Mileage value of the car |
| `engine` | Engine size or capacity |
| `max_power` | Maximum power rating |
| `torque` | Torque specification |
| `seats` | Number of seats in the car |

---

## 🧠 Analysis and Queries

### 1️⃣ Average Selling Price by Fuel Type (Manual + First Owner)
```sql
SELECT fuel, AVG(selling_price) AS avg_sp
FROM auto_trends
WHERE transmission = 'Manual' AND owners = 'First Owner'
GROUP BY fuel;

###  2. Find the top 3 car models with the highest average mileage, considering only cars with more than 5 seats.--
select car_name, seats, mileage
from auto_trends
where seats > 5
order by mileage desc
limit 3;

###  3.Identify the car models where the difference between the maximum and minimum selling prices is greater than $10,000.
 Select 
    car_name,
    min(selling_price) AS min_p,
    max(selling_price) AS max_p,
    (max(selling_price) - min(selling_price)) AS diff_in_price
from auto_trends
group by car_name
having  (max(selling_price) - min(selling_price)) > 10000;

### 4. 	Retrieve the names of cars with a selling price above the overall average selling price and a mileage below the overall average mileage.--
 
 SELECT car_name, selling_price, mileage
FROM auto_trends
WHERE selling_price > AVG(selling_price) FROM auto_trends
AND mileage < AVG(mileage) FROM auto_trends;

### 5.	Calculate the cumulative sum of the selling prices over the years for each car model.--
select car_name, years, sum(selling_price) AS total_sp
from auto_trends
group by car_name, years
order by car_name, years;

### 6.  Identify the car models that have a selling price within 10% of the average selling price. --
select car_name, selling_price
from auto_trends
where selling_price <= 0.1 * (select avg(selling_price) from auto_trends)
order by selling_price asc;
