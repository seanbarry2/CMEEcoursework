#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script processes UK average monthly rainfall data for 1910 using list comprehensions
and conventional loops. The goal is to extract:
1. Months where the rainfall was greater than 100mm.
2. Months where the rainfall was less than 50mm.

Data Source:
http://www.metoffice.gov.uk/climate/uk/datasets

Steps:
1. Use list comprehensions to extract relevant data.
2. Use conventional loops to achieve the same results.
3. Print the results for both methods.
"""

# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
 
# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 

# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.

# (1) Use a list comprehension to find months with rainfall > 100mm
more_than_100mm = [(month, rain) for month, rain in rainfall if rain > 100]
"""
List comprehension to find months and rainfall values where rainfall was greater than 100mm.

Returns:
list: A list of tuples containing month names and rainfall amounts.
"""
print(more_than_100mm)

# (2) Use a list comprehension to find months with rainfall < 50mm
less_than_50mm = [(month, rain) for month, rain in rainfall if rain < 50]
"""
List comprehension to find months and rainfall values where rainfall was less than 50mm.

Returns:
list: A list of tuples containing month names and rainfall amounts.
"""
print(less_than_50mm)

# Step 1: Use conventional loops to find months with rainfall > 100mm
more_than_100mm = []
"""
Conventional loop to find months and rainfall values where rainfall was greater than 100mm.

Returns:
list: A list of tuples containing month names and rainfall amounts.
"""
for month, rain in rainfall:
    if rain > 100:
        more_than_100mm.append((month, rain))

print("Months and rainfall values when the amount of rain was greater than 100mm:")
print(more_than_100mm)

# Step 2: Use conventional loops to find months with rainfall < 50mm
less_than_50mm = []
"""
Conventional loop to find months where rainfall was less than 50mm.

Returns:
list: A list of month names.
"""
for month, rain in rainfall:
    if rain < 50:
        less_than_50mm.append(month)

print("Months where the amount of rain was less than 50mm:")
print(less_than_50mm)
