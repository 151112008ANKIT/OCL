from z3 import *

age = Int('age')
first_name = String('first_name')

# Define template subsets for TG1
TG1 = [
    ("inv ValidAgeAnd: self.age > 0 and self.age < 150", And(age > 0, age < 150)),
    ("inv ValidAgeImplies: self.age > 0 implies self.age < 150", Implies(age > 0, age < 150)),
    ("inv ValidAgeForAll: Set{self.age}->forAll(a | a > 0 and a < 150)", ForAll([age], And(age > 0, age < 150))),
    ("inv ValidAgeLet: let ageValue : Integer = self.age in ageValue > 0 and ageValue < 150", And(age > 0, age < 150)),  # Simplified
    ("inv ValidAgeNotOr: not (self.age <= 0 or self.age >= 150)", Not(Or(age <= 0, age >= 150))),
    ("inv ValidAgeExcludingIncluding: Set{self.age}->excluding(0)->including(150)->notEmpty()", age != 0)
]

# Define template subsets for TG2
TG2 = [
    ("inv ValidFirstName: self.first_name.size() > 7", Length(first_name) > 7),
    ("inv ValidFirstNameImplies: self.first_name.size() > 0 implies self.first_name.size() > 7", Implies(Length(first_name) > 0, Length(first_name) > 7)),
    ("inv ValidFirstNameForAll: Set{self.first_name}->forAll(fn | fn.size() > 7)", ForAll([first_name], Length(first_name) > 7)),
    ("inv ValidFirstNameLet: let fnameLength : Integer = self.first_name.size() in fnameLength > 7", Length(first_name) > 7),  # Simplified
    ("inv ValidFirstNameNotOr: not (self.first_name.size() <= 7)", Not(Length(first_name) <= 7)),
    ("inv ValidFirstNameExcludingIncluding: Set{self.first_name.size()}->excluding(7)->notEmpty()", Length(first_name) != 7)
]

# Define the sets of characters for TG3
small = "abcdefghijklmnopqrstuvwxyz"
capital = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

def contains_capital(s):
    return Or([SubString(s, 0, 1) == StringVal(c) for c in capital])

def contains_small(s, i):
    return Or([SubString(s, i, 1) == StringVal(c) for c in small])

# Define template subsets for TG3
TG3 = [
    ("inv ValidFirstNameCharacters: let small:Set(String) = Set{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'} in let capital:Set(String) = Set{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'} in capital->includes(self.first_name.substring(1,1)) and Sequence{2..self.first_name.size()}.forAll(i | small->includes(self.first_name.substring(i,i)))",
     And(contains_capital(first_name), And([contains_small(first_name, i) for i in range(1, 10)]))),  
    ("inv ValidFirstNameCharactersImplies: self.first_name.size() > 0 implies (let small:Set(String) = Set{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'} in let capital:Set(String) = Set{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'} in capital->includes(self.first_name.substring(1,1)) and Sequence{2..self.first_name.size()}.forAll(i | small->includes(self.first_name.substring(i,i))))",
     Implies(Length(first_name) > 0, And(contains_capital(first_name), And([contains_small(first_name, i) for i in range(1, 10)])))),
    ("inv ValidFirstNameCharactersForAll: Set{self.first_name}->forAll(fn | let small:Set(String) = Set{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'} in let capital:Set(String) = Set{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'} in capital->includes(fn.substring(1,1)) and Sequence{2..fn.size()}.forAll(i | small->includes(fn.substring(i,i))))",
     ForAll([first_name], And(contains_capital(first_name), And([contains_small(first_name, i) for i in range(1, 10)])))),
    ("inv ValidFirstNameCharactersLet: let small:Set(String) = Set{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'} in let capital:Set(String) = Set{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'} in let fname = self.first_name in capital->includes(fname.substring(1,1)) and Sequence{2..fname.size()}.forAll(i | small->includes(fname.substring(i,i)))",
     And(contains_capital(first_name), And([contains_small(first_name, i) for i in range(1, 10)]))),  
    ("inv ValidFirstNameCharactersNotOr: not (not (let small:Set(String) = Set{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'} in let capital:Set(String) = Set{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'} in capital->includes(self.first_name.substring(1,1))) or Sequence{2..self.first_name.size()}.exists(i | not small->includes(self.first_name.substring(i,i))))",
     Not(Or(Not(contains_capital(first_name)), Exists([Int('i')], And(Int('i') >= 1, Int('i') < Length(first_name), Not(Or([contains_small(first_name, i) for i in range(1, 10)]))))))),
    ("inv ValidFirstNameCharactersExcludingIncluding: let small:Set(String) = Set{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'} in let capital:Set(String) = Set{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'} in Set{self.first_name.substring(1,1)}->excludingAll(capital)->isEmpty() and Sequence{2..self.first_name.size()}->forAll(i | Set{self.first_name.substring(i,i)}->excludingAll(small)->isEmpty())",
     And(contains_capital(first_name), And([contains_small(first_name, i) for i in range(1, 10)])))  
]

solver = Solver()

combinations = []
for desc1, tg1 in TG1:
    for desc2, tg2 in TG2:
        for desc3, tg3 in TG3:
            solver.push()
            solver.add(tg1)
            solver.add(tg2)
            solver.add(tg3)
            if solver.check() == sat:
                combinations.append((desc1, desc2, desc3))
            solver.pop()


for i, combo in enumerate(combinations):
    print(f"Combination {i+1}:")
    print("context Person")
    for inv in combo:
        print(inv)
    print()
