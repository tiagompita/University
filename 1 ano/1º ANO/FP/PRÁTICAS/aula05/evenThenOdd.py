def evenThenOdd(str):
    result_str = ""
    i = 0;
    str_len = len(str)
    while i < str_len/2:
    	if i % 2 == 0:
    		result_str += str[::2]
    	else:
    		result_str += str[1::2]
    	i += 1
    return result_str

def main():
    str = input(" > Type a string > ")
    print(evenThenOdd(str))

if __name__ == "__main__":
    main()
