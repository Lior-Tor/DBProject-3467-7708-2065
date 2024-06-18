import csv
from faker import Faker

fake = Faker()

header = ['InventoryID', 'Quantity', 'LastRestockedDate', 'ProductID', 'SupplierID']

data = []
for i in range(1, 401):
    inventory_id = i
    quantity = fake.random_int(min=1, max=500)
    last_restocked_date = fake.date_between(start_date='-1y', end_date='today')
    product_id = fake.random_int(min=1, max=400)  # Assuming 400 products
    supplier_id = fake.random_int(min=1, max=400)  # Assuming 400 suppliers
    data.append([inventory_id, quantity, last_restocked_date, product_id, supplier_id])

with open('Inventory.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(data)

print("Inventory.csv file created successfully with 400 records!")
