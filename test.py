import datetime

sDate = datetime.date(2021, 12, 30)
eDate = datetime.date(2024, 12, 30)

dateRange = eDate - sDate
daysBetween = dateRange.days
print(daysBetween)

res = datetime.date.today() - datetime.date(2021, 1, 1)
res2 = datetime.date.today() - datetime.timedelta(days=10)
print(type(datetime.date.today() - datetime.date(2021, 1, 1)))
print(res.days < res2.days)
