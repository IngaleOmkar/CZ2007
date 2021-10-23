from faker import Faker
import random
import string
from random_username.generate import generate_username
import pyodbc


def generate_email(i: int, name: str):
    domain = ["@outlook.com", "@gmail.com", "@yahoo.com"]

    name = "".join(name.split())

    if (i % 3 == 0):
        return (name + domain[0])
    elif (i % 3 == 1):
        return (name + domain[1])
    else:
        return (name + domain[2])


def generate_phoneNum():
    firstNum = random.randint(8, 9)
    return int(str(firstNum) + str(random.randint(1000000, 9999999)))


def generate_password():
    password = ""

    characters = list(string.ascii_letters + string.digits + "!@#$%^&*()")
    random.shuffle(characters)

    pwLength = random.randint(8, 15)

    for i in range(pwLength):
        password += random.choice(characters)

    return str(password)


if __name__ == "__main__":
    cnxn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=Project;Trusted_Connection=yes;')

    cursor = cnxn.cursor()

    fake = Faker("en_US")
    phoneNumList = []

    for i in range(100):
        name = fake.name()
        username = generate_username()[0]
        email = generate_email(i, name)
        address = fake.address()

        phone_num = generate_phoneNum()
        if phone_num in phoneNumList:
            while phone_num in phoneNumList:
                phone_num = generate_phoneNum
        else:
            phoneNumList.append(phone_num)

        password = generate_password()

        print(name, phoneNumList[i], email, address, password)

        params = [email, username, name, phoneNumList[i], address, password]

        cursor.execute(
            "INSERT INTO dbo.Customer(emailAddress, username, fullName, phoneNumber, userAddress, userPassword) VALUES(?, ?, ?, ?, ?, ?)", params)
        cnxn.commit()

    print("Completed")
