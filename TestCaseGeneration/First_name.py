from z3 import *


first_name = String('first_name')
last_name = String('last_name')
email = String('email')
eircode = String('eircode')
Area_code = String('Area_code')
Street_code = String('Street_code')
Account_no = Int('Account_no')
isCatholicPriest = Bool('isCatholicPriest')
gender = String('gender')

# Constraint for ValidFirstName
valid_first_name = Length(first_name) > 5

# Sets for lowercase and uppercase letters
small = set('abcdefghijklmnopqrstuvwxyz')
capital = set('ABCDEFGHIJKLMNOPQRSTUVWXYZ')
all_letters = small.union(capital)
uppercase_letters = capital
digits = set('0123456789')

# Function to check if a character is in a set
def in_set(char, s):
    return Or([char == c for c in s])

# Constraint for ValidFirsttNameCharacters
valid_first_name_characters = And(
    in_set(SubString(first_name, 0, 1), capital),
    ForAll([Int('i')], Implies(And(Int('i') >= 1, Int('i') < Length(first_name)), in_set(SubString(first_name, Int('i'), 1), small)))
)

# Constraint for ValidLastName
valid_last_name = Length(last_name) > 5

# Constraint for ValidLastNameCharacters
valid_last_name_characters = ForAll([Int('i')], Implies(And(Int('i') >= 0, Int('i') < Length(last_name)), in_set(SubString(last_name, Int('i'), 1), all_letters)))

# Constraint for ValidEmailAddress
valid_email_address = email == Concat(first_name, StringVal('.'), last_name, StringVal('@gmail.com'))

# Constraint for ValidEircodePattern
valid_eircode_pattern = And(
    Length(eircode) == 5,
    ForAll([Int('i')], Implies(And(Int('i') >= 0, Int('i') < 2), in_set(SubString(eircode, Int('i'), 1), uppercase_letters))),
    ForAll([Int('i')], Implies(And(Int('i') >= 2, Int('i') < 5), in_set(SubString(eircode, Int('i'), 1), uppercase_letters.union(digits))))
)

# Constraint for ValidAreaCode
valid_area_code = Area_code == SubString(eircode, 0, 1)

# Constraint for ValidStreetCode
valid_street_code = Street_code == SubString(eircode, 3, 1)

# Constraint for ValidAccountNumber
valid_account_number = And(Account_no >= 10000, Account_no <= 99999)

# Constraint for ValidCatholicPriest
valid_catholic_priest = Implies(isCatholicPriest, gender == StringVal('male'))


solver = Solver()
solver.add(valid_first_name)
solver.add(valid_first_name_characters)
solver.add(valid_last_name)
solver.add(valid_last_name_characters)
solver.add(valid_email_address)
solver.add(valid_eircode_pattern)
solver.add(valid_area_code)
solver.add(valid_street_code)
solver.add(valid_account_number)
solver.add(valid_catholic_priest)


if solver.check() == sat:
    print("Satisfiable")
    model = solver.model()
    first_name_value = model.eval(first_name, model_completion=True).as_string()
    last_name_value = model.eval(last_name, model_completion=True).as_string()
    email_value = model.eval(email, model_completion=True).as_string()
    eircode_value = model.eval(eircode, model_completion=True).as_string()
    Area_code_value = model.eval(Area_code, model_completion=True).as_string()
    Street_code_value = model.eval(Street_code, model_completion=True).as_string()
    Account_no_value = model.eval(Account_no, model_completion=True).as_long()
    isCatholicPriest_value = model.eval(isCatholicPriest, model_completion=True)
    gender_value = model.eval(gender, model_completion=True).as_string()

    print(f"Example first_name: {first_name_value}")
    print(f"Example last_name: {last_name_value}")
    print(f"Example email: {email_value}")
    print(f"Example eircode: {eircode_value}")
    print(f"Example Area_code: {Area_code_value}")
    print(f"Example Street_code: {Street_code_value}")
    print(f"Example Account_no: {Account_no_value}")
    print(f"Example isCatholicPriest: {isCatholicPriest_value}")
    print(f"Example gender: {gender_value}")
else:
    print("Unsatisfiable")
