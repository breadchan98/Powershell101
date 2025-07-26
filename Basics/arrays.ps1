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