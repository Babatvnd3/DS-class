#Create a function that takes a user's name and their favorite programming language (both strings) and returns a personalized greeting message.

def greeting(name, language):
    return f"Hello {name}! It's great you enjoy learning {language}."
name = input ("Enter your name: ")
language = input ("Enter your programming language: ")
print(greeting(name, language))