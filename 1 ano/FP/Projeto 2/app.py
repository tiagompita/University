import requests

lon = -8.5
lat = 40.5
radius = 5005
category = "accommodation,tourism"

url = "https://api.geoapify.com/v2/places?"

params = {
    "categories": category,
    "bias": f"proximity:{lon},{lat}",
    "filter": f"circle:{lon},{lat},{radius}",
    "limit": 20,
    "apiKey": "ce5d03e858854974a75f5c259c1095c2"
}

headers = {
    "Accept": "application/json"
}

resp = requests.get(url, headers=headers, params=params)

print(resp.status_code)
print(resp.url)

data = resp.json()

for feature in data["features"]:
    properties = feature["properties"]
    print(properties["country"])