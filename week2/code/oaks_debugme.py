import csv
import sys

# Define function with doctests
def is_an_oak(name):
    """
    Returns True if name starts with 'quercus' (case-insensitive, spelling sensitive)
    
    >>> is_an_oak('Quercus robur')
    True
    >>> is_an_oak('Fagus sylvatica')
    False
    >>> is_an_oak('QUERCUS cerris')
    True
    >>> is_an_oak('Quercus')
    True
    >>> is_an_oak('quercus')
    True
    """
    return name.lower().startswith('quercus')

def main(argv): 
    f = open('../data/TestOaksData.csv','r')
    g = open('../results/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    
    next(taxa) # skips 'genus' and 'species' since these are meant to be column headers
    
    for row in taxa:
        print("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!!!\n')
            csvwrite.writerow([row[0], row[1]])    

    return 0
    
if __name__ == "__main__":
    import doctest
    doctest.testmod()  # This will run the doctests
    status = main(sys.argv)

