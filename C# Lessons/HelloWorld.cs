/*

Common mistakes programmers make:
1. Due to C# being case-sensitive, console.WriteLine will not run. Must be Console.WriteLine();
2. For strings, double quotes or single quotes are forgotten
3. Semi-colon is forgotten at the end of the command

*/


using System;
class TestProgram
{
    static void Main()
    {
        //Programmer's first code lol
        Console.WriteLine("Hello!");

        //WriteLine() creates a new line after a method
        Console.WriteLine("I am learning C# for work");

        //Write() will output the line without new line
        Console.Write("Test 1 ");
        Console.WriteLine("Test 2 ");
    }
}
