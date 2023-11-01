def listN(n):
	list_N = []
	for i in range(1, n + 1):
		lst = [i]
		list_N.append(lst*i)
	return list_N

def main():
	n = int(input("n? => "))
	list_N = listN(n)
	
	print(list_N)

if __name__ == "__main__":
	main()
