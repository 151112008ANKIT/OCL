from z3 import *

# Create a Z3 solver instance
solver = Solver()

# Define SMT variables and constraints
first_name = String('first_name')
last_name = String('last_name')
email = String('email')
age = Int('age')
gender = String('gender')
phone = String('phone')
address = String('address')
education_level = String('education_level')

Person = Function('Person', IntSort(), BoolSort())

# Import the 're' module from Z3
from z3 import re

# Define regular expression constants
lowercase_re = re.range("a", "z")
uppercase_re = re.range("A", "Z")
digit_re = re.range("0", "9")

# Add the SMT constraints (the SMT encoding you provided)
solver.add(ForAll([o], Implies(Person(o), And(
    str.len(first_name) > 5,
    re.fullmatch(lowercase_re, first_name),
    str.len(last_name) > 5,
    re.fullmatch(Or(lowercase_re, uppercase_re), last_name),
    first_name != last_name,
    email == Concat(first_name, ".", last_name, "@mu.ie"),
    str.suffixof("mu.ie", email),
    age >= 18, age <= 99,
    Or(gender == "Male", gender == "Female"),
    re.fullmatch(digit_re, phone),
    str.len(phone) == 10,
    str.len(address) > 0,
    re.fullmatch(Or(uppercase_re, lowercase_re, digit_re), address),
    Or(education_level == "High School", education_level == "Bachelor's", education_level == "Master's")
))))

# Define a list to store different satisfying models
satisfying_models = []

# Keep finding and saving different satisfying models
while solver.check() == sat:
    model = solver.model()
    satisfying_models.append(model)
    
    # Create a blocking constraint to prevent the same model in the next iteration
    block = []
    for d in model:
        if d.arity() > 0:
            raise Z3Exception("uninterpreted functions are not supported")
        c = d()
        block.append(c != model[d])
    solver.add(Or(block))

# Print the different satisfying models
for i, model in enumerate(satisfying_models):
    print(f"Model {i + 1}:")
    print("First Name:", model[first_name])
    print("Last Name:", model[last_name])
    print("Email:", model[email])
    print("Age:", model[age])
    print("Gender:", model[gender])
    print("Phone:", model[phone])
    print("Address:", model[address])
    print("Education Level:", model[education_level])
    print()
