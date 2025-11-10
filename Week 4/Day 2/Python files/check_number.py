#Design a function that takes a single number and prints whether the number is positive, negative, or zero. 
# (This function uses an if/elif/else structure and uses print instead of return.)

def check_number(num):
    if num > 0:
        print("The number is positive.")
    elif num < 0:
        print("The number is negative.")
    else:
        print("The number is zero.") 
       
check_number(0)