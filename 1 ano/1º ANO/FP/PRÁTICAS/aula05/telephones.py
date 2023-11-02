# Convert a telephone number into corresponding name, if on list.
# (If not on list, just return the number itself.)
def telToName(tel, telList, nameList):
	if tel not in telList:
		return tel
		
	for i in range(len(telList)):
		if tel == telList[i]:
			return nameList[i]

# Return list of telephone numbers corresponding to names containing partName.
def nameToTels(partName, telList, nameList):
	tels = []
	for i in range(len(nameList)):
		if partName in nameList[i]:
			tels.append(telList[i])
	return tels
# Lists of telephone numbers and names
telList  = [  '975318642', '234000111', '777888333', '911911911']
nameList = [   'Angelina',     'Bread',   'Claudia',     'Bruna']

# Test telToName:
tel = input("Tel number? ")
print(telToName(tel, telList, nameList) )
print(telToName('234000111', telList, nameList) == "Bread" )
print(telToName('222333444', telList, nameList) == "222333444" )

# Test nameToTels:
name = input("Name? ")
print( nameToTels(name, telList, nameList) )
print( nameToTels('Clau', telList, nameList) == ['777888333'] )
print( nameToTels('Br', telList, nameList) == ['234000111', '911911911'] )
