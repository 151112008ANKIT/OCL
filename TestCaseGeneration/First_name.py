from z3 import *

# Declare the first_name variable as a string
first_name = String('first_name')

# Constraint for ValidFirstName
valid_first_name = Length(first_name) > 5

# Sets for lowercase and uppercase letters
small = set('abcdefghijklmnopqrstuvwxyz')
capital = set('ABCDEFGHIJKLMNOPQRSTUVWXYZ')

# Function to check if a character is in a set
def in_set(char, s):
    return Or([char == c for c in s])

# Constraint for ValidFirsttNameCharacters
valid_first_name_characters = And(
    in_set(SubString(first_name, 0, 1), capital),
    ForAll([Int('i')], Implies(And(Int('i') >= 1, Int('i') < Length(first_name)), in_set(SubString(first_name, Int('i'), 1), small)))
)

# Create the solver
solver = Solver()
solver.add(valid_first_name)
solver.add(valid_first_name_characters)

# Check satisfiability
if solver.check() == sat:
    print("Satisfiable")
    model = solver.model()
    first_name_value = model.eval(first_name, model_completion=True).as_string()
    print("Example first_name:", first_name_value)
else:
    print("Unsatisfiable")
