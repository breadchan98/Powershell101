<#
    Conditional Statements = if, elseif, else
    - They do not use symbols for operators, but more like abbrev
    - adding a letter 'c' in the beginning will make an operator case-sensitive
#>

#Examples below
1 -eq 2 # ==
1 -ne 2 # !=
1 -lt 2 # <
1 -le 2 # <=
1 -gt 2 # >
1 -ge 2 # >=

# -contains is a boolean return, not case-sensitive
@(4,8,12,16) -contains 4 #returns a boolean True
@('Test','test') -contains 'TEST' #this will return True

# -ccontains makes it case-sensitive
@('Test','test') -ccontains 'TEST'