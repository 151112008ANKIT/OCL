from z3 import *

def create_z3_string(name, length):
    s = [BitVec(f'{name}_{i}', 8) for i in range(length)]
    constraints = [And(s[i] >= ord('A'), s[i] <= ord('Z')) for i in range(length)]
    length_constraint = length > 5
    return s, constraints + [length_constraint]

first_name_length = 6  # At least 6 characters
last_name_length = 6   # At least 6 characters

first_name, first_name_constraints = create_z3_string('first_name', first_name_length)
last_name, last_name_constraints = create_z3_string('last_name', last_name_length)
age = Int('age')
age_constraint = And(age > 18, age < 60)
solver = Solver()
solver.add(first_name_constraints)
solver.add(last_name_constraints)
solver.add(age_constraint)

if solver.check() == sat:
    # Get the model (a satisfying assignment)
    model = solver.model()
    # Extract the values of the name attributes and age
    first_name_value = ''.join([chr(model[f].as_long()) for f in first_name])
    last_name_value = ''.join([chr(model[l].as_long()) for l in last_name])
    age_value = model[age].as_long()
    print(f"Generated first_name: {first_name_value}")
    print(f"Generated last_name: {last_name_value}")
    print(f"Generated age: {age_value}")
else:
    print("No solution exists that satisfies the constraints.")
