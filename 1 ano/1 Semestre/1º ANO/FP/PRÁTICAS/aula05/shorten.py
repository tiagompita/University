def shorten(str):
	abrv = ""
	for c in str:
		if c.isupper():
			abrv += c
	return abrv

def main():
	str = input("Type a name with upper letters for abreviation >")
	abv = shorten(str)
	print(abv)
if __name__ == "__main__":
	main()
