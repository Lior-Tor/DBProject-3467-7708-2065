import csv
from faker import Faker

# Initialize the Faker library
fake = Faker()

# Define the header
header = ['CustomerID', 'CustomerName', 'CustomerEmail']

# Generate the data
data = []
for i in range(1, 401):
    customer_id = i
    customer_name = fake.name()
    customer_email = fake.email()
    data.append([customer_id, customer_name, customer_email])

# Create and write to the CSV file
with open('Customers.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(data)

print("Customers.csv file created successfully with 400 records!")
