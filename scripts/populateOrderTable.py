import datetime
import random

class populateOrderTable():
    def __init__(self, cursor, cnxn):
        self.cursor = cursor
        self.cnxn = cnxn
        self.run()

    def generate_orderDate(self):
        sDate = datetime.date(2021, 9, 1)
        eDate = datetime.date(2021, 10, 24)

        dateRange = eDate - sDate
        daysBetween = dateRange.days
        randDay = random.randrange(daysBetween)
        randDate = sDate + datetime.timedelta(days=randDay)

        return randDate


    def generate_orderStatus(self, orderDate):
        difference = datetime.date.today() - orderDate
        difference = difference.days
        if difference < 4:
            return "0"
        elif difference >= 4 and difference < 30:
            return "1"
        else:
            return "2"

    def run(self):
        self.cursor.execute("SELECT custID FROM dbo.Customer")

        for row in self.cursor.fetchall():
            custID = row.custID
            orderDate = self.generate_orderDate()
            orderStatus = self.generate_orderStatus(orderDate)

            params = [custID, orderDate, orderStatus]

            self.cursor.execute(
                'INSERT INTO dbo.OrderTable(custID, orderDate, orderStatus) VALUES(?, ?, ?)', params)

            self.cnxn.commit()

        print("Completed")
