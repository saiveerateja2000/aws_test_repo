def add(a, b):
    return a + b


# Leaks (These lines introduce sensitive information for demonstration purposes)
api_key = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"
password = "SuperSecretPassword123!"

# Example usage
result = add(5, 3)
print(f"The result of adding is: {result}")

# Using the leaked variables (to prevent linter complaints about unused variables)
print(f"API Key: {api_key}")
print(f"Password: {password}")
