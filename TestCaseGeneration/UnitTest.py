import unittest
from z3 import *

class Person:
    def __init__(self, first_name, last_name, email, area_code, street_code, account_no, gender, eircode, is_catholic_priest):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.area_code = area_code
        self.street_code = street_code
        self.account_no = account_no
        self.gender = gender
        self.eircode = eircode
        self.is_catholic_priest = is_catholic_priest

class TestOCLConstraints(unittest.TestCase):

    def test_ocl_constraints(self):
      
        solver = Solver()

        first_name = String('first_name')
        last_name = String('last_name')
        email = String('email')
        area_code = String('area_code')
        street_code = String('street_code')
        account_no = Int('account_no')
        gender = String('gender')
        eircode = String('eircode')
        is_catholic_priest = Bool('is_catholic_priest')

        # Invariant: first name has more than 5 characters
        valid_first_name = Length(first_name) > 5

        # Invariant: first name contains only lowercase a-z for all but the first character
        valid_first_name_characters = And([Or([SubString(first_name, i, 1) == StringVal(c) for c in "abcdefghijklmnopqrstuvwxyz"]) for i in range(1, 6)])

        # Invariant: last name has more than 5 characters
        valid_last_name = Length(last_name) > 5

        # Invariant: last name contains only letters a-z and A-Z
        valid_last_name_characters = And([Or([SubString(last_name, i, 1) == StringVal(c) for c in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"]) for i in range(6)])

        # Invariant: email is constructed from first name and last name
        valid_email_address = email == Concat(first_name, StringVal("."), last_name, StringVal("@gmail.com"))

        # Invariant: eircode has 5 characters and follows specific pattern
        valid_eircode_pattern = And(
            Length(eircode) == 5,
            And([And(SubString(eircode, i, 1) >= StringVal('A'), SubString(eircode, i, 1) <= StringVal('Z')) for i in range(2)]),
            And([Or(SubString(eircode, i, 1) >= StringVal('A'), SubString(eircode, i, 1) <= StringVal('Z'),
                   SubString(eircode, i, 1) >= StringVal('0'), SubString(eircode, i, 1) <= StringVal('9')) for i in range(2, 5)])
        )

        # Invariant: area code and street code are derived from eircode
        valid_area_code = area_code == SubString(eircode, 0, 1)
        valid_street_code = street_code == SubString(eircode, 3, 1)

        # Invariant: account number is in valid range
        valid_account_number = And(account_no >= 10000, account_no <= 99999)

        # Invariant: Catholic priest constraint
        valid_catholic_priest = Implies(is_catholic_priest, gender == StringVal('male'))

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

     
        self.assertEqual(solver.check(), sat)

if __name__ == '__main__':
    unittest.main()
