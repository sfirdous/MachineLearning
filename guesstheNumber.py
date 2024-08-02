import random


def guess_the_number():
    print('Welcome to the Guess The Number Game')
    print("I/'m thinking of the number between 1 to 100")


    number_to_guess = random.randint(1,100)
    number_attempts = 0
    correctly_gussed = True

    while  correctly_gussed:
       guess = input('Enter the number ')
       try:
           guess = int(guess)
       except ValueError:
           print('Enter Valid Number ')
           continue
       
       number_attempts += 1
       if(guess > number_to_guess):
           print('Too High')
       elif(guess < number_to_guess):
           print('Too Low')
       else:
           correctly_gussed = True
           print(f"Congratulations! You've guessed the number in{number_attempts} attempts.")

guess_the_number()
    
