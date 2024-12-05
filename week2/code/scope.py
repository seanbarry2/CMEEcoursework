#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script demonstrates the behavior of global and local variables in Python functions,
including the use of the `global` keyword to modify global variables within nested scopes.
"""

_a_global = 10  # A global variable

if _a_global >= 5:
    _b_global = _a_global + 5  # Another global variable

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    """
    Demonstrates the creation of local variables that shadow global variables,
    and the use of variables within a function's local scope.
    """
    _a_global = 4  # A local variable
    
    if _a_global >= 4:
        _b_global = _a_global + 5  # A local variable
    
    _a_local = 3  # Another local variable
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)

a_function()

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _b_global is (still)", _b_global)
# print("After calling a_function, outside the function, the value of _a_local is ", _a_local)

_a_global = 10

def a_function():
    """
    Demonstrates accessing a global variable within a function
    without modifying it and using a local variable within the same function.
    """
    _a_local = 4  # A local variable
    
    print("Inside the function, the value _a_local is", _a_local)
    print("Inside the function, the value of _a_global is", _a_global)

a_function()

print("Outside the function, the value of _a_global is", _a_global)

_a_global = 10

def a_function():
    """
    Demonstrates modifying a global variable using the `global` keyword.
    """
    global _a_global
    _a_global = 5  # Modifies the global variable
    _a_local = 4  # A local variable
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value _a_local is", _a_local)

a_function()

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)

def a_function():
    """
    Demonstrates the use of a nested function to modify a global variable
    using the `global` keyword, while the outer function creates a local variable
    with the same name.
    """
    _a_global = 10  # A local variable

    def _a_function2():
        global _a_global
        _a_global = 20  # Modifies the global variable

    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)

a_function()

print("The value of a_global in main workspace / namespace now is", _a_global)

_a_global = 10

def a_function():
    """
    Demonstrates modifying a global variable from within a nested function.
    """
    def _a_function2():
        global _a_global
        _a_global = 20  # Modifies the global variable

    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)

a_function()

print("The value of a_global in main workspace / namespace is", _a_global)

