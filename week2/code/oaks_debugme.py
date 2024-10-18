import csv
import sys

#Define function
def is_an_oak(name):
    """ Returns True if name is starts with 'quercus' (case-insensitive, spelling sensitive) """
    
    return name.lower() == 'quercus'

def main(argv): 
    f = open('../data/TestOaksData.csv','r')
    g = open('../results/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    
    next(taxa) #skips 'genus' and 'species' since these are meant to be column headers
    
    for row in taxa:
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!!!\n')
            csvwrite.writerow([row[0], row[1]])    

    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)
