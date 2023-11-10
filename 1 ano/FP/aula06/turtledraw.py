# Exercise 5 on "How to think like a computer scientist", ch. 11.

import turtle

t = turtle.Turtle()

# Use t.up(), t.down() and t.goto(x, y)

# Put your code here

with open("drawing.txt", "r") as f:
    for line in f:
        x, y = line.split()
        if line == "UP":
            t.up()
        else:
            t.down()
        t.goto(float(x), float(y))

# wait
turtle.Screen().exitonclick()

