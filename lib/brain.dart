import 'dart:math';
class BigBrain{
  int randomNumber = Random().nextInt(10) + 1;

  bool isCorrect(inputNumber) {
    return randomNumber == int.parse(inputNumber.text);
  }
  void random() {
    randomNumber = Random().nextInt(10) + 1;
    print(randomNumber);
  }


}