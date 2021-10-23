import datetime
import random

class populateCreditCard():
    def __init__(self, cursor, cnxn):
        self.cursor = cursor
        self.cnxn = cnxn
        self.run()

    def generate_expiryDate(self):
        sDate = datetime.date(2021, 12, 30)
        eDate = datetime.date(2024, 12, 30)

        dateRange = eDate - sDate
        daysBetween = dateRange.days
        randDay = random.randrange(daysBetween)
        randDate = sDate + datetime.timedelta(days=randDay)

        return randDate


    def generate_cardNumber(self):
        return random.randint(10000000, 99999999)

    def run(self):
        usedCardNumbers = []
        self.cursor.execute("SELECT custID FROM dbo.Customer")

        for idx, row in enumerate(self.cursor.fetchall()):
            expiryDate = self.generate_expiryDate()

            cardNum = self.generate_cardNumber()
            if cardNum in usedCardNumbers:
                while cardNum in usedCardNumbers:
                    cardNum = self.generate_cardNumber()
            else:
                usedCardNumbers.append(cardNum)

            params = [usedCardNumbers[idx], row.custID, expiryDate]

            self.cursor.execute(
                "INSERT INTO dbo.CreditCard(cardNumber, custID, expiryDate) VALUES(?, ?, ?)", params)
            self.cnxn.commit()

        print("Completed")
