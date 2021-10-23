'''
Create static data in CSV format for Customer
'''

from faker import Faker
from random_username.generate import generate_username
import random
import string
import csv


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

def writeCustomerToTxt(row, flag):
    if flag == 0:
        with open('scripts/customer.csv', 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(
                ["Name", "PhoneNum", "Username", "Email", "Address", "Password"])
    else:
        with open('scripts/customer.csv', 'a', newline='') as f:
            writer = csv.writer(f)
            writer.writerow([row[0], row[1], row[2], row[3], row[4], row[5]])

def writeCreditCardToTxt(row, flag):
    if flag == 0:
        with open('scripts/creditCard.csv', 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(
                ["CardNum", "CustID", "expiry"])
    else:
        with open('scripts/customer.csv', 'a', newline='') as f:
            writer = csv.writer(f)
            writer.writerow([row[0], row[1], row[2]])

if __name__ == '__main__':
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
                phone_num = generate_phoneNum()
        else:
            phoneNumList.append(phone_num)

        password = generate_password()

        print(name, phoneNumList[i], username, email, address, password)
        row = [name, phoneNumList[i], username, email, address, password]

        writeCustomerToTxt(row, i)
