# Complete the code to make the HiLo game...

import random

def main():
    # Pick a random number between 1 and 100, inclusive
    secret = random.randrange(1, 101)
    print("Can you guess my secret?")
    count = 1
    guess = 0
    while guess != secret:
        guess = int(input("Guess the number? "))
        if guess > secret:
            print("High")
        else:
            print("Low")
        count += 1
    print("You did it, with {:2d} guesses" .format(count))
main()
