#O output do programa pode aparecer deformado, pois depende do tamanho ecra de cada computador. O programa foi desenvolvido num ecra 24 polegadas

import requests #pip install requests
from colorama import init #pip install colorama
init()
from termcolor import colored #pip install termcolor
import os
from prettytable import PrettyTable #pip install prettytable
import pytz #pip install pytz
from datetime import datetime #pip install datetime


#Maximiza o tamanho da consola para não haver distorções.
import win32gui, win32con #pip install pywin32
hwnd = win32gui.GetForegroundWindow()
win32gui.ShowWindow(hwnd, win32con.SW_MAXIMIZE)

    
def intro(): #Imprime a palavra "Viagens"
    print(colored(" .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .-----------------. .----------------. ", "light_blue", attrs=['bold']))
    print(colored("| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |", "light_blue", attrs=['bold']))
    print(colored("| | ____   ____  | || |     _____    | || |      __      | || |    ______    | || |  _________   | || | ____  _____  | || |    _______   | |", "light_blue", attrs=['bold']))
    print(colored("| ||_  _| |_  _| | || |    |_   _|   | || |     /  \     | || |  .' ___  |   | || | |_   ___  |  | || ||_   \|_   _| | || |   /  ___  |  | |", "light_blue", attrs=['bold']))
    print(colored("| |  \ \   / /   | || |      | |     | || |    / /\ \    | || | / .'   \_|   | || |   | |_  \_|  | || |  |   \ | |   | || |  |  (__ \_|  | |", "light_blue", attrs=['bold']))
    print(colored("| |   \ \ / /    | || |      | |     | || |   / ____ \   | || | | |    ____  | || |   |  _|  _   | || |  | |\ \| |   | || |   '.___`-.   | |", "light_blue", attrs=['bold']))
    print(colored("| |    \ ' /     | || |     _| |_    | || | _/ /    \ \_ | || | \ `.___]  _| | || |  _| |___/ |  | || | _| |_\   |_  | || |  |`\____) |  | |", "light_blue", attrs=['bold']))
    print(colored("| |     \_/      | || |    |_____|   | || ||____|  |____|| || |  `._____.'   | || | |_________|  | || ||_____|\____| | || |  |_______.'  | |", "light_blue", attrs=['bold']))
    print(colored("| |              | || |              | || |              | || |              | || |              | || |              | || |              | |", "light_blue", attrs=['bold']))
    print(colored("| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |", "light_blue", attrs=['bold']))
    print(colored(" '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'", "light_blue", attrs=['bold']))
    input("Press ENTER to continue...")

def clear(): #Faz clear na consola
    os.system('cls' if os.name == 'nt' else 'clear')


def categories():
    # Dicionário para guardar as categorias principais e suas possibilidades
    categories = {}

    with open('categories.txt', 'r') as file:
        for line in file:
            # Extrair a categoria principal e suas possibilidades
            category, possibilities = line.split('.')[0].strip().capitalize(), line.strip().split('.',1)[1:]
            if category not in categories:
                categories[category] = []
            else:
                categories[category].extend(possibilities)

    print(colored("\nCategorias disponíveis: ", "red", attrs=['bold']))

    # Dividir a lista de categorias em sub-listas, cada uma com um máximo de 10 categorias
    categories_per_column = [list(categories.keys())[i:i + 10] for i in range(0, len(categories), 10)]

    # Dividir a lista de categorias em sub-listas, cada uma com um máximo de 10 categorias
    categories_per_column = [list(categories.keys())[i:i + 10] for i in range(0, len(categories), 10)]

    # Se a última coluna não estiver totalmente preenchida, preencher com vazios
    if categories_per_column and len(categories_per_column[-1]) < 10:
        categories_per_column[-1].extend([''] * (10 - len(categories_per_column[-1])))

    # Criar uma tabela com a biblioteca prettytable
    table = PrettyTable()

    for i in range(len(categories_per_column)):
        table.add_column(colored(f"Categoria {i+1}", "light_green", attrs=["bold"]), categories_per_column[i])
        # Se a tabela tiver 8 colunas, imprimir a tabela e criar uma nova
        if (i + 1) % 8 == 0:
            print(table)
            table = PrettyTable()

    # Imprimir a última tabela se ela tiver colunas
    if len(table._field_names) > 0:
        print(table)

    while True:
        category_name = input("\nEscreve o nome de uma categoria para saber mais detalhes ou 'q' para sair: ")
        if category_name.lower() == 'q':
            break

        elif category_name.capitalize() in categories:
            # Criar uma nova tabela para as possibilidades
            possibilities = categories[category_name.capitalize()]

            # Dividir a lista de possibilidades em sub-listas, cada uma com um máximo de 10 possibilidades
            possibilities_per_column = [possibilities[i:i + 10] for i in range(0, len(possibilities), 10)]

            # Criar uma tabela para cada grupo de 8 colunas de possibilidades
            for j in range(0, len(possibilities_per_column), 4):
                possibilities_table = PrettyTable()
                for i in range(j, min(j + 4, len(possibilities_per_column))):
                    # Se a lista de possibilidades for menor que 10, preencher com vazios
                    if len(possibilities_per_column[i]) < 10:
                        possibilities_per_column[i].extend([''] * (10 - len(possibilities_per_column[i])))
                    possibilities_table.add_column(colored(f"SubCategoria {i+1}", "light_green", attrs=["bold"]), possibilities_per_column[i])
                print(possibilities_table)
        else:
            print(colored("Categoria não encontrada. Por favor, tente novamente.", "red", attrs=['bold']))

def menu(lat,lon,rad,cat): #Menu principal


    from requests.structures import CaseInsensitiveDict
    headers = CaseInsensitiveDict()
    headers["Accept"] = "application/json"
    
    # Fazer a primeira chamada da API com o raio original
    url="https://api.geoapify.com/v2/places?"
    params1 = {
        "categories": cat,
        "bias": f"proximity:{lon},{lat}",
        "filter": f"circle:{lon},{lat},{rad}",
        "apiKey": "57174e2b716a40b2ad8e0b6bf37b29b3"
    }

    resp1 = requests.get(url, headers=headers, params=params1)
    data1=resp1.json()
    data1=data1["features"]
    
    #print(resp1.url)


    current_time = datetime.now()
    table = PrettyTable()
    total_attractions = 0
    print("Aguarde...")
    attractions = []

    table.field_names = ["Atração", "País", "Cidade", "Localização", "Distância", "Moeda Local e Símbolo", "Hora Local"]
    for features in data1:
        name = features["properties"].get("name", "N/A")  # Devolve 'N/A' se não encontrar o nome
        if name == "N/A":
            continue

        country = features["properties"].get("country", "N/A")
        city = features["properties"].get("city", "N/A")
        location = f"{features['geometry']['coordinates'][1]}, {features['geometry']['coordinates'][0]}"
        distance = features["properties"].get("distance", "N/A")
        if distance != "N/A":
            distance = f"{distance} m" if distance < 1000 else f"{distance/1000} km"

        # Obter a moeda local
        resp2 = requests.get(f"https://restcountries.com/v3.1/name/{country}")
        country_info = resp2.json()[0]

        currency = list(country_info["currencies"].values())[0]["name"]
        symbol = list(country_info["currencies"].values())[0]["symbol"]

        # Obter a hora local
        local_time = current_time.astimezone(pytz.timezone(country)).strftime('%H:%M')


        attractions.append([name, country, city, location, distance, currency + " " + symbol, local_time])
        total_attractions += 1
    
    sort_order = input(colored("Como gostaria de ordenar as atrações? (d)istância, (n)ome: ", "light_cyan", attrs=["bold"]))

    if sort_order.lower() == 'd':
        attractions.sort(key=lambda x: x[4])  # Ordenar por distância
    elif sort_order.lower() == 'n':
        attractions.sort(key=lambda x: x[0])  # Ordenar por nome

    # Adicionar as atrações ordenadas à tabela
    for attraction in attractions:
        table.add_row(attraction)

    def csv():
        import csv
        attractions.sort(key=lambda x: x[4])
        with open('attractions.csv', 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(["Atração", "País", "Cidade", "Localização", "Distância", "Moeda Local e Símbolo", "Hora Local"])
            for attraction in attractions:
                writer.writerow(attraction)
    csv()

    print(table)
    print(f"Total de atrações: {total_attractions}")
    def convert_distance_to_km(distance_str):
        if ' km' in distance_str:
            return float(distance_str.replace(' km', ''))
        elif ' m' in distance_str:
            return float(distance_str.replace(' m', '')) / 1000
        else:
            return 0

    avg_distance = sum(convert_distance_to_km(attraction[4]) for attraction in attractions) / total_attractions if attractions else 0
    print(f"Distância média: {avg_distance:.2f} km" if avg_distance >= 1 else f"Distância média: {avg_distance*1000:.2f} m")


def main():
    while True:
        clear()
        intro()

        lat, lon = input(colored("Introduz a latitude: ", "light_cyan", attrs=["bold"])), input(colored("Introduz a longitude: ", "light_cyan", attrs=["bold"]))
        rad = input(colored("O quão longe pretendes viajar(m)? ", "light_cyan", attrs=["bold"]))

        with open('categories.txt', 'r') as f:
            valid_categories = f.read().splitlines()

        while True:
            print(colored("Introduz uma categoria.","light_cyan"),colored("\n\nSe pretenderes aceder às categorias introduz C.","light_red"),colored("\n\nSe pretenderes uma sub categoria escreve tipo o exemplo: accommodation.hotel.\nCaso pretendas mais do que uma, separa-as por vírgulas.", "light_cyan", attrs=["bold"]))
            cat = input("Categoria(s):")
            cats = cat.split(',')
            if cat.lower() == 'c':
                categories()

            if all(category.strip() in valid_categories for category in cats):
                break
            else:
                print(colored("\nUma ou mais categorias não encontradas. Por favor, tente novamente.\n", "red", attrs=['bold']))

        menu(lat,lon,rad,cat)

        # Perguntar se o utilizador pretende introduzir novas informações
        again = input(colored("Deseja introduzir novas informações? (s/n): ", "light_cyan", attrs=["bold"]))
        if again.lower() != 's':
            break

if __name__ == "__main__":
    main()
