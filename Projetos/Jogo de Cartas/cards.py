from tkinter import *
import random

root = Tk()

root.title("Card Deck")
root.geometry("900x500")
# Load the background image
bg = PhotoImage(file="images/mesa.png")

# Create a label to hold the background image
bg_label = Label(root, image=bg)
bg_label.place(x=0, y=0, relwidth=1, relheight=1)


#Shuffle Cards
def shuffle():
    suits = ["diamonds", "clubs", "hearts", "spades"]
    values = range(2,15)

    global deck
    deck = []

    for suit in suits:
        for value in values:
            deck.append(f"{value}_of_{suit}")

    #Creating players
    global dealer, player
    dealer = []
    player = []

    #Random Card For dealer
    card = random.choice(deck)
    deck.remove(card)

    #Give card to dealer
    dealer.append(card)
    #Output to screen
    dealer_Label.config(text=card)


    #Random Card For player
    card = random.choice(deck)
    deck.remove(card)

    #Give card to player
    player.append(card)
    #Output to screen
    player_Label.config(text=card)


    #Deck Card Left in Title
    root.title(f"Card Game - {len(deck)} Cards left")




main_Frame = Frame(root, bg="green")
main_Frame.pack(pady=20)

#Frames for Cards
dealer_Frame = LabelFrame(main_Frame, text="Dealer", bd=0)
dealer_Frame.grid(row=0, column=0, padx=20, ipadx=20)

player_Frame = LabelFrame(main_Frame, text="Player", bd=0)
player_Frame.grid(row=0, column=1, ipadx=20)

#Put Cards in Frame
dealer_Label = Label(dealer_Frame, text="")
dealer_Label.pack(pady=20)

player_Label = Label(player_Frame, text="")
player_Label.pack(pady=20)

#Buttons
shuffle_button = Button(root, text="Shuffle Deck", font=("Arial",14), command=shuffle)
shuffle_button.pack(pady=20)

dealcard_button = Button(root, text="Deal Card", font=("Arial",14))
dealcard_button.pack(pady=20)

root.mainloop()