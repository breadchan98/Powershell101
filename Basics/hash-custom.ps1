<#
    Hashtables act like dictionaries in Python (key-value) pair style
    Easy for data retrieval

    To declare hashtables, use $hashVar=@{
        key=value
        --> the key and value can be mixed in this hashtable, doesnt have to be all same key/value
        --> hashtable is not ordered, so it is mixed
        --> Strict Mode will not help if a key or value exist. To determine if it exist, use .ContainsKey or .ContainsValue
        --> Keys are unique, but values are not
            ---> You cant have one key have two different values, but you can have two keys with the same value
    }
#>

#Declaring Hashtable
$myHashTables=@{
    age=27
    name="Brent"
    major='Information Technology'
    location='Seattle'
    gpa=4.20
    graduated=$true
}

#Will only display keys
$myHashTables.Keys

#Will only display values
$myHashTables.Values

#To grab a value, use .keyName or [keyName]
$myHashTables.age
$myHashTables['name']

#Checking if a key or value exist, it will return a boolean
$myHashTables.ContainsKey('graduatedYear')
$myHashTables.ContainsValue(4.20)

<#
    Multiple methods to add or remove key/values
#>

# For Adding
#Method 1 - .Add('keyName', 'value')
#Method 2 - $hashVar['keyName']='value'
#Method 3 - $hashVar.keyName=value

$myHashTables.Add('graduatedYear', 2024)
$myHashTables['lastName']='Buenarte'
$myHashTables.startYear=2022

#To change a value, find the keyName and change the value using .keyName=newValue
$myHashTables.gpa=3.90

#For Removing, use .Remove('keyName')

$myHashTables