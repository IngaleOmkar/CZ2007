import pyodbc
import datetime
import random


def generate_orderDate():
    sDate = datetime.date(2021, 9, 1)
    eDate = datetime.date(2021, 10, 24)

    dateRange = eDate - sDate
    daysBetween = dateRange.days
    randDay = random.randrange(daysBetween)
    randDate = sDate + datetime.timedelta(days=randDay)

    return randDate


def generate_orderStatus(orderDate):
    difference = datetime.date.today() - orderDate
    difference = difference.days
    if difference < 3:
        return "0"
    elif difference >= 3 and difference < 30:
        return "1"
    else:
        return "2"


if __name__ == '__main__':
    cnxn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=Project;Trusted_Connection=yes;')

    cursor = cnxn.cursor()

    cursor.execute('SELECT custID FROM dbo.Customer')

    for idx, row in enumerate(cursor.fetchall()):
        custID = row.custID
        orderDate = generate_orderDate()
        orderStatus = generate_orderStatus(orderDate)

        params = [custID, orderDate, orderStatus]

        cursor.execute(
            'INSERT INTO dbo.OrderTable(custID, orderDate, orderStatus) VALUES(?, ?, ?)', params)

        cnxn.commit()

    print("Completed")
