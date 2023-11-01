def delRepeteadChars(str):
    final_str = []
    for c in str:
        if c not in final_str:
            final_str.append(c)
    return ''.join(final_str)


def main():
    str = input(" >")
    final_s = delRepeteadChars(str)
    print(final_s)

if __name__ == "__main__":
    main()