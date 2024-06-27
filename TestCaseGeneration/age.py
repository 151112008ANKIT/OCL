#context Person inv: self.age >= 18 and self.age <= 60

from z3 import *


age = Int('age')
constraint = And(age >= 18, age <= 60)
solver = Solver()
solver.add(constraint)
if solver.check() == sat:

    model = solver.model()
  
    age_value = model[age]
    print(f"     Person with age = {age_value}")
else:
    print("No solution exists that satisfies the OCL constraint.")


#output
# Person with age = 58
