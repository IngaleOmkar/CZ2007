import pyodbc
import csv

if __name__ == "__main__":
    cnxn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=Project;Trusted_Connection=yes;')

    cursor = cnxn.cursor()

    with open('scripts/customer.csv', 'r', newline='') as f:
        reader = csv.reader(f)
        for row in reader:
            print(', '.join(row))
            name = row[0]
            phoneNumber = row[1]
            username = row[2]
            email = row[3]
            address = row[4]
            password = row[5]

            params = [email, username, name, phoneNumber, address, password]

            cursor.execute(
                "INSERT INTO dbo.Customer(emailAddress, username, fullName, phoneNumber, userAddress, userPassword) VALUES(?, ?, ?, ?, ?, ?)", params)
            cnxn.commit()

    print("Completed")
