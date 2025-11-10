#SIMPLE APPS
#Create a function that takes a temperature in Celsius and returns the equivalent temperature in Fahrenheit.
def temp_converter(celsius):
    return (celsius * 9/5)
temp = int(input ("Enter you temperature:"))
print(temp_converter(temp))



#Write a function called add_two_numbers that accepts two numbers as arguments and returns their sum.
def add_two_numbers(a, b):
    return a + b
a = int(input ("Enter you score:"))
b = int(input ("Enter you score:"))
print(add_two_numbers(10, 5))
