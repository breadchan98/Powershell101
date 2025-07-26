<#
    Array and ArrayLists:
     - Array vs ArrayLists
        --> Arrays good for small data sets, good for fast quick retrievals
        --> ArrayLists are good for more large data sets and performance, but may require a lot of time to work on
    - To declare an array, you use @()
        Example:
        $myArray = @()
    - Performance degrades when items are added to an array
        --> An array gets removed and creates a new array when an item is added
#>

Set-StrictMode -Version Latest

#Declaring Array
$myArray = @("Apple", "Bananas", "Grapes")

#printing out array
$myArray

#Printing out count size or length of array
$myArray.Count
$myArray.Length

#Pulling out specific items
$myArray[1]

<#
    Two ways to add an element in an Array:
    1. $arrayVar = $arrayVar + item
    2. $arrayVar+=item
#>

#Method 1
$myArray = $myArray + "Lemons"

#After adding Lemons
$myArray

#Method 2
$myArray+="Strawberry"

#After adding Strawberry, including Lemons previously
$myArray

<#
    To remove an item from an array, use Method 1 for adding, but use "-ne"  instead of "+" and the item
#>

#Removing an array
$myArray = $myArray -ne "Strawberry"

#After removing Strawberry
$myArray

########################################################################
<#
    ArrayList > Array, especially if you dont know how big is your array
    and to prevent any performance hiccups

    To declare an ArrayList:
    $listVar=[System.Collections.ArrayList]@()

#>