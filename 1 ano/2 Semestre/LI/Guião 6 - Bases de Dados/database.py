import sqlite3 as sql
import sys

def main(agrv):
    db = sql.connect(agrv[1])

    printContacts(db)
    print()
    printCompanies(db)
    print()
    printFirstNameAndCount(db)
    print()
    searchByName(db)
    print()
    searchCompanyByName(db)


    db.close()

def printContacts(db):
    contacts = db.execute("SELECT * FROM contacts")

    for row in contacts:
        print(row)


def printCompanies(db):
    companies = db.execute("SELECT * FROM companies")

    for row in companies:
        print(row)

def searchByName(db):
    name = input("Nome? ")
    result = db.execute("SELECT * FROM contacts WHERE firstname LIKE ? OR middlename LIKE ? OR lastname LIKE ?", (name,name,name))
    for row in result:
        print(row)

def searchCompanyByName(db):
    name = input("Nome? ")
    result = db.execute("SELECT companies.* FROM contacts,companies WHERE contacts.company_id = companies.id AND firstname LIKE ? OR middlename LIKE ? OR lastname LIKE ?", (name,name,name))
    for row in result:
        print(row)

def printFirstNameAndCount(db):
    firstname = db.execute("SELECT firstname FROM contacts")
    count = 0

    for row in firstname:
        count +=1;
        print(row[0])

    print(str(count) + " contactos")

main(sys.argv)