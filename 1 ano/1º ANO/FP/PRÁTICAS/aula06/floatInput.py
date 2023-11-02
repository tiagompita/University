import math

def floatInput(prompt, min = -math.inf, max= +math.inf):
    while True:
        try:
            res = float(input(prompt))
            if res < min or res > max:
                raise Exception(res)
            break
        except ValueError as e:
            print(e, " : Not a float!")
        except Exception as e2:
            print("Value {:.2f} not in range of the interval [{},{}]".format(e2.args[0], min, max))
    return res

def main():
    print("a) Try entering invalid values such as 1/2 or 3,1416.")
    v = floatInput("Value? ")
    print("v:", v)

    print("b) Try entering invalid values such as 15%, 110 or -1.")
    h = floatInput("Humidity (%)? ", 0, 100)
    print("h:", h)

    print("c) Try entering invalid values such as 23C or -274.")
    t = floatInput("Temperature (Celsius)? ", min=-273.15)
    print("t:", t)

    #d) What happens if you uncomment this?
    #impossible = floatInput("Value in [3, 0]? ", min=3, max=0)

    return 

if __name__ == "__main__":
    main()
