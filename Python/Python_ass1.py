import string
import random

def generate_password(length, special, letters, digits):
    chars = ''
    if letters:
        chars += string.ascii_letters
    if special:
        chars += '!@#$%&*'
    if digits:
        chars += string.digits
    
    if not chars:
        raise ValueError("At least one of special characters, letters, or digits must be selected.")
    
    password = []
    try:
        for i in range(length):
            idx = random.randint(0, len(chars) - 1)
            password.append(chars[idx])
        
        return ''.join(password)
    except ValueError as e:
        print(f"Error generating password: {e}")
        return None



length = int(input("Enter length of Password: "))
if length <= 0:
   raise ValueError("Length must be greater than zero.")
        
special = input("Do you want special characters in your Password: ").lower() == 'yes'
letters = input("Do you want letters in your Password: ").lower() == 'yes'
digits = input("Do you want numeric values in your Password: ").lower() == 'yes'
        
password = generate_password(length, special, letters, digits)
        
if password:
    print("Generated Password:", password)
else:
    
    print("Failed to generate password.")
    
   







