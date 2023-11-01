def countDigits(str):
	count = 0
	for char in str:
		if char.isdigit():
			count += 1
	return count

def main():
	str = input(" >")
	count = countDigits(str)
	print("There's {:2d} digits in the string".format(count))
if __name__ == "__main__":
	main()
