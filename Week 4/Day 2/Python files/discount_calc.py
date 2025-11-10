# Ask the user for input
price = float(input("Enter the original price: "))
discount = float(input("Enter the discount percentage: "))

# Calculate the final price
final_price = price - (price * discount / 100)

# Print the result
print(f"The final price after a {discount}% discount is: {final_price}")
      


def calculate_discount():
    price = float(input("Enter the original price: "))
    discount = float(input("Enter the discount percentage: "))
    final_price = price - (price * discount / 100)
    print(f"The final price after a {discount}% discount is: {final_price}")

calculate_discount()