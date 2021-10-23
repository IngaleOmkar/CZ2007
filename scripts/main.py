'''
MAIN SCRIPT
'''

import pyodbc
from populateCustomer import populateCustomer
from populateCreditCard import populateCreditCard
from populateOrderTable import populateOrderTable

if __name__ == "__main__":
    cnxn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=Project;Trusted_Connection=yes;')

    cursor = cnxn.cursor()

    filename = 'scripts/customer.csv'
    populateCustomer(cursor, cnxn, filename)
    populateCreditCard(cursor, cnxn)
    populateOrderTable(cursor, cnxn)

