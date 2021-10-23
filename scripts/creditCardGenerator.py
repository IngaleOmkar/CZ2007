import pyodbc
import datetime
import random

def generate_expiryDate():
    sDate = datetime.date(2021, 12, 30)
    eDate = datetime.date(2024, 12, 30)

    dateRange = eDate - sDate
    daysBetween = dateRange.days
    randDay = random.randrange(daysBetween)
    randDate = sDate + datetime.timedelta(days=randDay)

    return randDate

def generate_cardNumber():
    return random.randint(10000000,99999999)

if __name__ == '__main__':
    cnxn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=Project;Trusted_Connection=yes;')

    cursor = cnxn.cursor()

    cursor.execute("SELECT Cust_ID FROM dbo.Customer")

    usedCardNumbers = []

    for idx, row in enumerate(cursor.fetchall()):
        expiryDate = generate_expiryDate()
        print(idx, row.Cust_ID)
        print(expiryDate)

        cardNum = generate_cardNumber()
        if cardNum in usedCardNumbers:
            while cardNum in usedCardNumbers:
                cardNum = generate_cardNumber()
        else:
            usedCardNumbers.append(cardNum)

        params = [usedCardNumbers[idx], row.Cust_ID, expiryDate]

        cursor.execute("INSERT INTO dbo.CreditCard(CardNumber, Cust_ID, ExpiryDate) VALUES(?, ?, ?)", params)
        cnxn.commit()

    print("Completed")



