import csv
from faker import Faker

fake = Faker()

header = ['SupplierID', 'SupplierName', 'SupplierEmail']

data = []
for i in range(1, 401):
    supplier_id = i
    supplier_name = fake.company()
    supplier_email = fake.email()
    data.append([supplier_id, supplier_name, supplier_email])

with open('Suppliers.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(data)

print("Suppliers.csv file created successfully with 400 records!")
