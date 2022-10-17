List<int> winningNumbers = [12, 6, 34, 22, 41, 9];

void main() {
  List<int> ticket1 = [45, 2, 9, 18, 12, 33];
  List<int> ticket2 = [41, 17, 26, 32, 7, 35];

  checkNumbers(ticket1);
}

void checkNumbers(List<int> myNumbers) {
  int count = 0;
  for (int i = 0; i < myNumbers.length; i++) {
    for (int j = 0; j < myNumbers.length; j++) {
      if (winningNumbers[i] == myNumbers[j]) {
        count++;
      }
    }
  }
  print(count);
  count = 0;
  for (int myNum in myNumbers) {
    for (int winNum in winningNumbers) {
      if (myNum == winNum) {
        count++;
      }
    }
  }
  print(count);
}
