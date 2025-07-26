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

    To declare an ArrayList, there are 2 methods:
    1. $listVar=[System.Collections.ArrayList]@()
    2. #listVar=New-Object -TypeName Systems.Collections.ArrayList
        --The second one is recommended, especially if having huge data
#>

#Declaring Array List
$myList1 = New-Object -TypeName System.Collections.ArrayList #just creating the list

#Adding an item in arraylist using .Add() since it is not a fixed size array
$myList1.Add("CPU")

#adding [void] will null the item and make it not output the index as it usually does in ps
[void]$myList1.Add("RAM")

#.AddRange(@()) lets you add more items in the array.. very neat if you dont wanna keep copy and paste .Add() per line

$myList1.AddRange(@("SDD", "PSU", "GPU"))

<#
    Removal Methods:
    1. .Remove(item) - remove a specific item
    2. .RemoveAt(index) - remove at a specific index
    3. .RemoveRange(startIndex, endIndex) - remove at a starting and ending index
#>

#Creating ArrayList
$gunList = New-Object -TypeName System.Collections.ArrayList
$gunList.AddRange(@("Ray Gun", "Winter's Howl", "Scavenger", "VR11", "Wunderwaffe DG-2", "Wave Gun", "Thundergun"))

#For removing items
$gunList.Remove("Thundergun")
$gunList.RemoveAt(2)
$gunList.RemoveRange(0,3)

#Final Result
$gunList