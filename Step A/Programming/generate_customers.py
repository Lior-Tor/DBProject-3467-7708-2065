from faker import Faker

TABLE_NAME = "Customers"
CUSTOMER_ID = "CustomerID"
CUSTOMER_NAME = "CustomerName"
CUSTOMER_EMAIL = "CustomerEmail"
DATE_OF_BIRTH = "DateOfBirth"


def generate_customers(n: int = 400) -> None:
    """
    This function will generate n number of customers and insert them into a .csv file
    the names of the table and the different columns are defined as global variables
    we will be using the faker library to generate the data
    """
    # create the faker object
    fake = Faker()

    # create the .csv file
    with open(f"{TABLE_NAME}.csv", "w") as f:
        # write the header
        f.write(f"{CUSTOMER_ID},{CUSTOMER_NAME},{CUSTOMER_EMAIL},{DATE_OF_BIRTH}\n")
        # write the data
        for i in range(n):
            f.write(f"{i + 1},{fake.name()},{fake.email()},{fake.date_of_birth(minimum_age=18, maximum_age=80)}\n")


def main():
    generate_customers()


if __name__ == "__main__":
    main()
