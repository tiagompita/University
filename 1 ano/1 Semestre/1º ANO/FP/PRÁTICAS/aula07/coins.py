# A set of functions to deal with bags of money.
#
# JMR 2017
# Face values of coins (in cents):
from re import A


COINS = [200, 100, 50, 20, 10, 5, 2, 1]

def value(bag):
    total = 0
    if bool(bag):
        for coin, n in bag.items():
            total += coin * n
        return total
    return total

def transfer1coin(bag1, c, bag2):
    if c in bag1:
        if bag1[c] > 0 and not bool(bag2):
            bag1[c] -= 1
            bag2[c] = 1
            return True
        elif bag1[c] > 0 and bool(bag2):    ## There should a better way to do this idk
            bag1[c] -= 1                    ## Kinda wack!
            bag2[c] += 1
            return True
        else:
            return False
    else:
        return False
def transfer(bag1, amount, bag2):
    """Try to transfer an amount from bag1 to bag2.
    If possible, transfer coins and return True,
    otherwise, return False and leave bags with same values."""
    if amount == 0:
        return True
    if value(bag1) < amount:
        return False
    ...
            

def strbag(bag):
    string = ''
    if bool(bag):
        string = '+'.join('{}x{}'.format(coin,number) for coin,number in sorted(bag.items(), reverse= True))
    string += '=' + str(value(bag))
    return string

def main():
    # A bag of coins is represented by a dict of {coin: number} items
    bag1 = {1: 4, 2: 0, 5:1, 10: 0, 20: 5, 50: 4, 100: 2, 200: 1}
    bag2 = {}
    
    # Test the value function.
    # assert value({}) == 0
    # assert value({1:7, 5:2, 20:4, 100:1}) == 197
    # Test the strbag function.
    # print( strbag({1:7, 5:2, 20:4, 100:1}) )        # 1x100+4x20+2x5+7x1=197
    # print( strbag({1:7, 5:2, 10:0, 20:4, 100:1}) )  # 1x100+4x20+2x5+7x1=197

    # print("bag1:", strbag(bag1))    # bag1: 1x200+2x100+4x50+5x20+1x5+4x1=709
    # print("bag2:", strbag(bag2))    # bag2: =0
    
    print(transfer1coin(bag1, 10, bag2))    # False!
    print("bag1:", strbag(bag1))    # bag1: 1x200+2x100+4x50+5x20+1x5+4x1=709
    print("bag2:", strbag(bag2))    # bag2: =0

    print(transfer1coin(bag1, 20, bag2))    # True
    print("bag1:", strbag(bag1))    # bag1: 1x200+2x100+4x50+4x20+1x5+4x1=689
    print("bag2:", strbag(bag2))    # bag2: 1x20=20

    print(transfer1coin(bag1, 20, bag2))    # True
    print("bag1:", strbag(bag1))    # bag1: 1x200+2x100+4x50+3x20+1x5+4x1=669
    print("bag2:", strbag(bag2))    # bag2: 2x20=40

    print(transfer(bag1, 157, bag2))        # True (should be easy)
    print("bag1:", strbag(bag1))    # bag1: 1x200+1x100+3x50+3x20+2x1=512
    print("bag2:", strbag(bag2))    # bag2: 1x100+1x50+2x20+1x5+2x1=197

    print(transfer(bag1, 60, bag2)) # not easy, but possible...
    print("bag1:", strbag(bag1))
    print("bag2:", strbag(bag2))

    return

if __name__ == "__main__":
    main()

