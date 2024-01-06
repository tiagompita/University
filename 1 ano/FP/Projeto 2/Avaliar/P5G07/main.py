import requests
import csv

API_KEY = '7ada5fd82ac241f1b841e626b977a988'

def read_categories(file='categories.txt'): # A função lê o ficheiro categories.txt e devolve uma lista com todas as suas linhas não vazias.
    try:
        with open(file, 'r') as f:
            return set(line.strip() for line in f if line.strip())
    except FileNotFoundError:
        print(f"File not found: {file}")
        return set()

def get_user_input(valid_categories): # A função solicita ao usuário que insira dados relativos á latitude e longitude, ao raio e as categorias
    while True:
        try:
            lat, lon = map(float, input("Enter your latitude and longitude split by comma: ").split(','))
            radius = float(input("Enter the radius in km: "))
            categories = input("Enter the categories split by comma: ").split(',')
            categories = [c for c in categories if c in valid_categories]
            if -90 <= lat <= 90 and -180 <= lon <= 180 and radius > 0 and categories:
                return lat, lon, radius, categories
            else:
                print("Invalid input. Please try again.")
        except ValueError:
            print("Invalid input format. Please try again.")

def fetch_attractions(lat, lon, radius, categories): # A função faz uma solicitação a uma API de geolocalização (Geoapify) para obter informações sobre lugares com base nos parâmetros fornecidos
    params = {
        'lat': lat,
        'lon': lon,
        'radius': radius * 1000,
        'categories': ','.join(categories),
        'apiKey': API_KEY
    }
    try:
        response = requests.get('https://api.geoapify.com/v2/places', params=params)
        response.raise_for_status()
        return response.json().get('features', [])
    except requests.RequestException as e:
        print(f"API request error: {e}")
        return []

def display_and_save_attractions(attractions, filename='attractions.csv'): # A função exibe informações sobre atrações, salva essas informações em um arquivo CSV e fornece estatísticas relacionadas  com o total de atrações e a média de distância entre elas.
    with open(filename, 'w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        writer.writerow(['Name', 'Country', 'Latitude', 'Longitude', 'Distance'])
        num_atr=0
        dist_total=0
        for attraction in attractions:
            name = attraction['properties'].get('name', 'Unavailable')
            country = attraction['properties'].get('country', 'Unavailable')
            lat, lon = attraction['geometry']['coordinates']
            distance = (attraction['properties'].get('distance', 'Unavailable'))/1000
            print(f"Name: {name}, Country: {country}, Location: ({lat}, {lon}), Distance: {distance}")
            writer.writerow([name, country, lat, lon, distance])
            dist_total+=distance
            num_atr+=1
        print("Total attractions =", num_atr)
        print("Average distance =",round(dist_total/num_atr,3),"km")


def main():
    valid_categories = read_categories()
    lat, lon, radius, categories = get_user_input(valid_categories)
    attractions = fetch_attractions(lat, lon, radius, categories)
    if attractions:
        display_and_save_attractions(attractions)
    else:
        print("No attractions found.")

if __name__ == "__main__":
    main()
    