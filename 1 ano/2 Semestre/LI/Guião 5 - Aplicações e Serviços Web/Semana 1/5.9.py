import requests
import time

start = time.time()
f = requests.get("http://www.ua.pt")
end = time.time()
print(f.headers)
print("--- %s seconds ---" % (end - start))