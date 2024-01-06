import requests
import os 
import csv
import time

def clear(): #function to clear the terminal
    if os.name=='nt':
        os.system('cls')
    else:
        os.system('clear')
     
def main():
    print("Hi welcome to our Python-powered place finder program. Explore the world around you by discovering fascinating locations based on your preferences. Let's embark on a journey of exploration together!")
    task="a"
    while task!="1" and task!="2":
        task = mainMenu()      

    if task=="1":
        clear()
        start()
    if task=="2":
        clear()
        print(" 1. Enter coordinates of the place You want to visit\n 2. Enter the radius\n 3. Select the category and subcategory of the sort of place you want to find\n 4. Sort elements and get the full information about the attractions\n 5. Option to export  the information as a csv file")
        enterToStart="b"
        while enterToStart!= "":
            enterToStart = input("Press enter to start: ")
        if enterToStart=="":
            clear()
            start()

def start():
    categoryDictionary, onlyCategories = categoryGet()
    coordinates, circleRadius = askForData()
    clear()
    valid_category = False
    while not valid_category:                   # verify whether the inserted category is valid input
        print("-----------")
        print("Categories: ")
        print("-----------")
        for i in onlyCategories:
            print("->" + i)

        category = input("Insert the category that you want to choose: ")

        count = 0
        for i in onlyCategories:
            if i == category:
                count += 1

        while count != 1:
            print(f"Invalid category '{category}'. Please choose a valid category.")
            category = input("Insert the category that you want to choose: ")

            count = 0
            for i in onlyCategories:
                if i == category:
                    count += 1

        valid_category = True
        clear()



    valid_subcategory = False
    while not valid_subcategory:                 # verify whether the inserted subcategory is valid input   
        print("--------------")
        print("Subcategories: ")
        print("--------------")
        for i in categoryDictionary[category]:
            print("-> " + i)

        subcategory = input("Insert the subcategory that you want to choose: ")
        
        count = 0
        for i in categoryDictionary[category]:
            if i == subcategory:
                count += 1

        while count != 1:
            print(f"Invalid subcategory '{subcategory}'. Please choose a valid subcategory.")
            subcategory = input("Insert the subcategory that you want to choose: ")

            count = 0
            for i in categoryDictionary[category]:
                if i == subcategory:
                    count += 1

        valid_subcategory = True
        clear()

    link = makeLink(coordinates, circleRadius, category, subcategory)

    namesList, countryList, coordinatesList, citiesList, districtsList, distanceList, hoursList = radiusSearch(link)
    selectFilter(distanceList, namesList, countryList, coordinatesList, citiesList, districtsList, hoursList)
    calculateMediumDistance(distanceList)
    exportToCSVFile(namesList, countryList, coordinatesList, citiesList, districtsList, distanceList, hoursList)



def askForData(): #asks the user for data
    lat="çççwererr ttyçççça sdasdaç"
    lon="<vv<vv <v<v<çv<çv ç<vo<so<"
    while True: #checks if lat and lon are numeric values
        try:
            lat = float(input("Insert your latitude: "))
            break  # Exit the loop if conversion to float succeeds
        except ValueError:
            print("Invalid input. Please enter a numeric value.")
    clear()
    while True:
        try:
            lon = float(input("Insert your longitude: "))
            break  # Exit the loop if conversion to float succeeds
        except ValueError:
            print("Invalid input. Please enter a numeric value.")
    clear()
    while True:
        try:
            radius = int(input("Insert the radius of the search(recommended: 5km): " ))
            break
        except ValueError:
            print("Invalid input. Please enter a numeric value")

    circleRadius= "," + str(1000*radius) #gets the radiusinput
    coordinates= str(lon) + "," + str(lat)
    return coordinates, circleRadius



def mainMenu():         #input function for starting the program
    functionSelector =(input("Enter 1 to start and 2 to get some instructions for this tool :D : "))
    return functionSelector


def makeLink(coordinates, circleRadius, category, insertedSubCategory):
    # this is the category and subcategory of the link (subcategory might not be necessary?)
    if insertedSubCategory=="":
        subcategory=""
    else:
        subcategory = "." + insertedSubCategory
    urlCategory = "?categories=" + category + subcategory

    # this is the filter of the link
    searchFilter = "circle:"
    urlFilter = "&filter=" + searchFilter + coordinates + circleRadius

    #this is the bias of the link (necessary)
    urlBias = "&bias=proximity:" + coordinates

    # this is the limit of the link (might not be necessary)
    urlLimit = "&limit=20"

    # this is the key (my key)
    apiKey ="1f3fb2a75c5a48aab5af1ada7548e793"
    urlApiKey ="&apiKey=" + apiKey   

    url = "https://api.geoapify.com/v2/places" + urlCategory + urlFilter + urlBias + urlLimit + urlApiKey

    return url

def radiusSearch(link):
    response = requests.get(link)
    if response.status_code == 200:
        responseJson = response.json()

        places = responseJson.get("features", [])
        print(f"Number of places in this category: {len(places)}")    # counts the number of found atractions
        
        # criation of blank lists 
        namesList = []
        countryList = []
        coordinatesList = []
        citiesList = []
        districtsList = []
        distanceList = []
        hoursList = []

        #getting data
        for feature in places:
            properties = feature.get("properties", {})
            geometry = feature.get("geometry", {})
            name = properties.get("name")
            country = properties.get("country")
            coordinates = geometry.get("coordinates")
            city = properties.get("city")
            district = properties.get("district")
            distance = properties.get("distance")
            hours = properties.get("datasource", {}).get("raw", {}).get("opening_hours")

            #adding data for lists
            if name is not None:
                namesList.append(name)
                countryList.append(country)
                coordinatesList.append(coordinates)
                citiesList.append(city)
                districtsList.append(district)
                distanceList.append(distance)
                hoursList.append(hours)


        return namesList, countryList, coordinatesList, citiesList, districtsList, distanceList, hoursList

    else:
        print(f"Error: {response.status_code}")
        return None


def categoryGet(): #function that gets all the necessary parameters(categories and subcategories) from the categories.txt file  
    categories={}
    with open("categories.txt", 'r') as categorias: #opens the file
        for line in categorias:
            
            line = line.strip() #removes whitespaces
            this = categories 
            divisions = line.split('.') #makes a list for everything that is split by a '.'

            for division in divisions: 
                this = this.setdefault(division, {}) #for every value on the list divisions, adds that value to the this dictionary
            
            onlyCategories = list(categories.keys())
        return categories, onlyCategories

def selectFilter(distanceList, namesList, countryList,coordinatesList,citiesList,districtsList,hoursList):
    filteringResults = int(input("Select the filtering method you want to use to see the results of our search: \nBy distance Closest (to furthest) (Enter 1): \nBy name (alphabetic order) (Enter 2): "))

    while filteringResults!=1 and filteringResults!=2:
        print("Unrecognized input :(")
        filteringResults = int(input("Select the filtering method you want to use to see the results of our search: \nBy distance Closest (to furthest) (Enter 1): \nBy name (alphabetic order) (Enter 2): "))

    if filteringResults == 1:
        clear()
        for i, name in enumerate(namesList):
            print(f"Name: {name}")
            print(f"Distance: {distanceList[i]}m")
            print(f"Country: {countryList[i]}")
            print(f"Coordinates: {', '.join(map(str, coordinatesList[i]))}")
            print(f"City: {citiesList[i]}")
            print(f"District: {districtsList[i]}")
            print(f"Opening Hours: {hoursList[i]}")
            print("-----------------------------------")
    if filteringResults == 2:
        clear()
        nameSort = list(zip(distanceList, namesList, countryList,coordinatesList,citiesList,districtsList,hoursList))
        nameSort.sort(key=lambda x:x[1])
        distanceList, namesList, countryList,coordinatesList,citiesList,districtsList,hoursList = zip(*nameSort)
        for i,name in enumerate(namesList):
            print(f"Name: {name}")
            print(f"Distance: {distanceList[i]}m")
            print(f"Country: {countryList[i]}")
            print(f"Coordinates: {', '.join(map(str, coordinatesList[i]))}")
            print(f"City: {citiesList[i]}")
            print(f"District: {districtsList[i]}")
            print(f"Opening Hours: {hoursList[i]}")
            print("-----------------------------------")


def calculateMediumDistance(distanceList):          #calculation of medium distance
    mediumDistance = 0
    if distanceList== []:
        print("Because there are no attractions it's impossible to calculate the medium distance")
    else:
        for distance in distanceList:
            mediumDistance += distance
        mediumDistance = mediumDistance/len(distanceList)
        print (f"Medium distance between the objects is: {mediumDistance}m")


def exportToCSVFile(namesList, countryList, coordinatesList, citiesList, districtsList, distanceList, hoursList):
    exportDecision="e"
    while exportDecision!="y" and exportDecision!="n":
        exportDecision=input("Do you wish to export your data to a csv file? (y/n)")
        clear()
    if exportDecision == "y":  
        attractionsData = list(zip(namesList, countryList, coordinatesList, citiesList, districtsList, distanceList, hoursList))

        attractionsData = sorted(attractionsData, key=lambda x: x[5])      # sorts the attractions by distance

        baseFileName = "attractions.csv"
        csvFile = getUniqueFilename(baseFileName)
        with open(csvFile, 'w', newline='', encoding='utf-8') as file:
            record = csv.writer(file)
            record.writerow(["Name", "Country", "Coordinates", "City", "District", "Distance", "Schedule"])    # header for dates 
            record.writerows(attractionsData)    # show dates

        print(f"Data exported to {csvFile}")
        
    print("Bye, thank you for using our program :3\n Closing in...")
    time.sleep(1)
    print("5")
    time.sleep(1)
    print("4")
    time.sleep(1)
    print("3")
    time.sleep(1)
    print("2")
    time.sleep(1)
    print("1")
    time.sleep(1)
    clear()
    exit()
    
def getUniqueFilename(baseFileName):
    if not os.path.exists(baseFileName):
        return baseFileName

    filename, extension = os.path.splitext(baseFileName)
    count = 1
    while os.path.exists(f"{filename}_{count}{extension}"):
        count += 1

    return f"{filename}_{count}{extension}"
main()
