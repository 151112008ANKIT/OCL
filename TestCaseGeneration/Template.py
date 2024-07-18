from string import Template

# Define the OCL template
ocl_template = Template('''
context Person
inv ValidFirstName:
  self.first_name.size() > $min_length_first_name

inv ValidFirsttNameCharacters:
  let small:Set(String) = Set$small_set in
  let capital:Set(String) = Set$capital_set in
  capital->includes(self.first_name.substring(1,1)) and
  Sequence{2..self.first_name.size()}.forAll(i | small->includes(self.first_name.substring(i,i)))

inv ValidLastName:
  self.last_name.size() > $min_length_last_name

inv ValidLastNameCharacters:
  let allLetters: Set(String) = Set$all_letters in
  Set{1..self.last_name.size()}->forAll(i | allLetters->includes(self.last_name.substring(i, i)))

inv ValidEmailAddress:
  self.email = self.first_name.concat('.').concat(self.last_name).concat('@gmail.com')

inv ValidEircodePattern:
  let uppercaseLetters: Set(String) = Set$uppercase_letters in
  let digits: Set(String) = Set$digits in
  let allValidCharacters: Set(String) = uppercaseLetters->union(digits) in
  self.eircode.size() = 5 and
  Set{1..2}->forAll(i | uppercaseLetters->includes(self.eircode.substring(i, i))) and
  Set{3..5}->forAll(i | allValidCharacters->includes(self.eircode.substring(i, i)))

inv ValidAreaCode:
  self.Area_code = self.eircode.substring(1, 2)

inv ValidStreetCode:
  self.Street_code = self.eircode.substring(4, 5)

inv ValidAccountNumber:
  self.Account_no >= $account_number_min and self.Account_no <= $account_number_max

inv ValidCatholicPriest:
  self.isCatholicPriest implies self.gender = 'male'
''')

# Define the variables for the template
min_length_first_name = 5
min_length_last_name = 5
small_set = "{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}"
capital_set = "{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}"
all_letters = "{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}"
uppercase_letters = "{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}"
digits = "{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}"
account_number_min = 10000
account_number_max = 99999

# Substitute the variables into the template
ocl_expression = ocl_template.substitute(
    min_length_first_name=min_length_first_name,
    min_length_last_name=min_length_last_name,
    small_set=small_set,
    capital_set=capital_set,
    all_letters=all_letters,
    uppercase_letters=uppercase_letters,
    digits=digits,
    account_number_min=account_number_min,
    account_number_max=account_number_max
)

# Print the generated OCL expression
print("Generated OCL expression:\n")
print(ocl_expression)

# Example of generating multiple OCL expressions
invariants = []
for length in [5, 6, 7]:
    ocl_expression = ocl_template.substitute(
        min_length_first_name=length,
        min_length_last_name=length,
        small_set=small_set,
        capital_set=capital_set,
        all_letters=all_letters,
        uppercase_letters=uppercase_letters,
        digits=digits,
        account_number_min=account_number_min,
        account_number_max=account_number_max
    )
    invariants.append(ocl_expression)

# Print all generated OCL expressions
print("\nGenerated multiple OCL expressions:\n")
for inv in invariants:
    print(inv)
    print("\n---\n")
