import csv
from faker import Faker

fake = Faker()

header = ['EmployeeID', 'EmployeeName', 'Position', 'HireDate']
positions = ['Manager', 'Sales Associate', 'Cashier', 'Customer Service Representative', 'Inventory Specialist', 'Marketing Coordinator', 'IT Support Specialist', 'Finance Analyst', 'HR Specialist', 'Product Manager']

data = []
for i in range(1, 401):
    employee_id = i
    employee_name = fake.name()
    position = fake.random.choice(positions)
    hire_date = fake.date_between(start_date='-5y', end_date='today')
    data.append([employee_id, employee_name, position, hire_date])

with open('Employees.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(data)

print("Employees.csv file created successfully with 400 records!")
