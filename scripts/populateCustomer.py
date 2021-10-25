import pyodbc
import csv


class populateCustomer():
    def __init__(self, cursor, cnxn, filename):
        self.cursor = cursor
        self.cnxn = cnxn
        self.filename = filename
        self.run()

    def run(self):
        with open(self.filename, 'r', newline='') as f:
            reader = csv.reader(f)
            for row in reader:
                if row[0] == "Name":
                    continue
                name = row[0]
                phoneNumber = row[1]
                username = row[2]
                email = row[3]
                address = row[4]
                password = row[5]

                params = [email, username, name,
                          phoneNumber, address, password]

                self.cursor.execute(
                    "INSERT INTO dbo.Customer(emailAddress, username, fullName, phoneNumber, userAddress, userPassword) VALUES(?, ?, ?, ?, ?, ?)", params)
                self.cnxn.commit()

        print("Completed")
