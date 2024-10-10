#!/usr/bin/env python3

"""Prints 'this is a boiler plate'"""

__appname__ = '[python boilerplate]'
__author__ = 'Sean Barry (sb4524@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "NA"

## imports ##
import sys # module to interface our program with the operating system

## constants ##


## functions ##
def main(argv):
    """ Main entry point of the program """
    print('This is a boilerplate') # NOTE: indented using two tabs or 4 spaces
    return 0
    sys.exit("I am exiting now")

if __name__ == "__main__": 
    """Makes sure the "main" function is called from command line"""  
    status = main(sys.argv)
    sys.exit(status)
