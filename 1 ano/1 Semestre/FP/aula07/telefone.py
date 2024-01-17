# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {:^30s} : {:<}".format("Numero", "Nome", "Morada"))
    for num in dic:
        print("{:>12s} : {:^30s} : {:<}".format(num, dic[num][0], dic[num][1]))

def filterPartName(contacts, partName):
    """Returns a new dict with the contacts whose names contain partName."""
    for num in contacts:
        if partName in contacts[num]:
            print("{:12s} : {}".format(num, contacts[num]))

def addContacts(dic):
    """Adds a new contact to the dictionary."""
    num = input("Numero: ")
    if num.isdigit():
        if num in dic:
            print("Numero já existe")
        else:
            nome = input("Nome: ")
            nome = ' '.join(word.capitalize() for word in nome.split())
            dic.update({num:nome}) 
            print("Contacto adicionado")
    else: 
        print("Numero inválido")        

def removeContacts(dic):
    """Removes a contact to the dictionary."""
    num = input("Numero: ")
    if num not in dic:
        print("Numero não existe")
    else:
        dic.pop(num)      
        print("Contacto removido")  

def procurarNumero(dic):
    """Searches for a number in the dictionary."""
    num = input("Numero: ")
    if num.isdigit():
        if num in dic:
            print("Nome: ", dic[num])
        else:
            print("Numero não existe")  
    else: 
        print("Numero inválido")              
def menu():
    """Shows the menu and gets user option."""
    print()
    print("(L)istar contactos")
    print("(A)dicionar contacto")
    print("(R)emover contacto")
    print("Procurar (N)úmero")
    print("Procurar (P)arte do nome")
    print("(T)erminar")
    op = input("opção? ").upper()   # converts to uppercase...
    return op


def main():
    """This is the main function containing the main loop."""

    # The list of contacts (it's actually a dictionary!):
    contactos = {"234370200": ("Universidade de Aveiro", "Santiago, Aveiro"),
        "727392822": ("Cristiano Aveiro", "Porto"),
        "387719992": ("Maria Matos", "Coimbra"),
        "887555987": ("Marta Maia", "Lisboa"),
        "876111333": ("Carlos Martins", "Funchal"),
        "433162999": ("Ana Bacalhau", "Braga")
        }

    op = ""
    while op != "T":
        op = menu()
        if op == "T":
            print("Fim")
        elif op == "L":
            print("Contactos:")
            listContacts(contactos)
        elif op == "A":
            print("Adicionar contacto:")    
            addContacts(contactos)
        elif op == "R":
            print("Remover contacto:")
            removeContacts(contactos)   
        elif op == "N":
            print("Procurar número:")
            procurarNumero(contactos) 
        elif op == "P":
            print("Procurar parte do nome:")
            partName = input("Parte do nome: ")
            filterPartName(contactos, partName)    
        else:
            print("Não implementado!")
    

# O programa começa aqui
main()

