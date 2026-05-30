#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void numberGuess() {

  int guess, num, limitGuess = 0;

  srand(time(NULL));

  num = rand() % 80;

  printf("Number between 1 and %d\n", 100);

  do {

    if (limitGuess > 10) {
      puts("You Loose!!\n");
      break;
    }

    printf("What a number? : ");
    scanf("%d", &guess);

    if (guess > num) {
      printf("Lower\n");
      limitGuess++;
    }

    else if (num > guess) {
      printf("Higher\n");
      limitGuess++;
    }

    else
      printf("Your guess is right  %d, congratulations\n", num);

  } while (guess != num);
}

int main() { 
 
  numberGuess();

}
