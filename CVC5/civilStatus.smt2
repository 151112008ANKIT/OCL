( set-logic QF_SLIA )
( set-option :produce-models true )

( declare-const husband_name String )
( declare-const wife_name String )
( declare-const husband_email String )
( declare-const wife_email String )
( declare-const husband_marital_status String )
( declare-const wife_marital_status String )
( declare-const husband_gender String )
( declare-const wife_gender String )
( declare-const husband_age Int )
( declare-const wife_age Int )

( assert ( > ( str.len husband_name ) 5 ) )
( assert ( str.in_re husband_name ( re.* ( re.range "a" "z" ) ) ) )

( assert ( > ( str.len wife_name ) 5 ) )
( assert ( str.in_re wife_name ( re.* ( re.range "a" "z" ) ) ) )

( assert ( or (= wife_marital_status "Single") (= wife_marital_status "Married") ) )

( assert ( or (= husband_gender "Male") ) )

( assert ( or (= wife_gender "Female") ) )

( assert ( > husband_age 18 ) )
( assert ( > wife_age 18 ) )

( assert ( = husband_email ( str.++ husband_name "@gmail.com" ) ) )

( assert ( = wife_email ( str.++ wife_name "@gmail.com" ) ) )

( assert ( = husband_marital_status "Married" ) )
( assert ( = wife_marital_status "Married" ) )

( check-sat )
( get-value ( husband_name wife_name husband_email wife_email husband_marital_status wife_marital_status husband_gender wife_gender husband_age wife_age ) )
