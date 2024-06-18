import csv
from faker import Faker

fake = Faker()

header = ['ProductID', 'ProductName', 'TypeOfProduct', 'Price']
product_names = ['Laptop', 'Smartphone', 'Tablet', 'Desktop', 'Monitor', 'Keyboard', 'Mouse', 'Printer', 'Router', 'Camera']
types_of_product = ['Electronics', 'Accessories']

data = []
for i in range(1, 401):
    product_id = i
    product_name = fake.random.choice(product_names)
    type_of_product = fake.random.choice(types_of_product)
    price = fake.random_int(min=100, max=2000)
    data.append([product_id, product_name, type_of_product, price])

with open('Products.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(data)

print("Products.csv file created successfully with 400 records!")
