from faker import Faker
import csv

# Table and column names
TABLE_NAME = "Staff"
STAFF_ID = "StaffID"
STAFF_NAME = "StaffName"
HIRE_DATE = "HireDate"
POSITION = "Position"


def generate_staff(n: int = 400) -> None:
    """
    This function generates n number of staff records and writes them to a .csv file.
    """
    # Create the Faker object
    fake = Faker()

    # Define possible positions
    positions = ['Manager', 'Sales Associate', 'Cashier', 'Stock Clerk', 'Security']

    # Create the .csv file
    with open(f"{TABLE_NAME}.csv", "w", newline='') as csvfile:
        # Create a CSV writer
        csvwriter = csv.writer(csvfile)

        # Write the header
        csvwriter.writerow([STAFF_ID, STAFF_NAME, HIRE_DATE, POSITION])

        # Write the data
        for i in range(n):
            csvwriter.writerow([i + 1, fake.name(), fake.date_this_decade(), fake.random.choice(positions)])


def main():
    generate_staff()


if __name__ == "__main__":
    main()
