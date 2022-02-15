import 'package:flutter/material.dart';
import 'brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
BigBrain bigBrain = BigBrain();
void main() => runApp(const MyProject());



class MyProject extends StatelessWidget {
  const MyProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LuckPage(),
    );
  }
}

class LuckPage extends StatefulWidget {
  const LuckPage({Key? key}) : super(key: key);
  @override
  _LuckPageState createState() => _LuckPageState();
}

class _LuckPageState extends State<LuckPage> {
  final inputNumber = TextEditingController();

  @override
  void dispose() {
    inputNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Your Luck'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 90.0,
              backgroundImage: AssetImage('images/lucky.png'),
            ),
            Text('Pick a number from 1-10 to test your luck.',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black87,
              ),
            ),
            Text('Count how many tries you use to get it correct and ',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black87,
              ),
            ),
            Text('consider weather this is your day or not.',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black87,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 310.0),
              child: TextField(
                controller: inputNumber,
                decoration: const InputDecoration(labelText: "Enter your number of choice (1-10)"),
                keyboardType: TextInputType.number,
              ),
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bool correctAnswer = bigBrain.isCorrect(inputNumber);
          if (correctAnswer == true) {
            Alert(
              context: context,
              type: AlertType.success,
              title: 'You are correct',
              desc: 'Good luck on your life',
              buttons: [
                DialogButton(
                  child: const Text(
                    'RESET',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    bigBrain.random();
                  },
                  width: 100,
                ),
              ],
            ).show();
          }
          else {
            Alert(
              context: context,
              type: AlertType.warning,
              title: 'You are wrong',
              desc: 'Try again!',
              buttons: [
                DialogButton(
                  child: const Text(
                    'BACK',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  width: 100,
                ),
              ],
            ).show();
          }
        },
        tooltip: 'Are you sure?',
        child: const Icon(
          Icons.done_outline_outlined,
        ),
      ),
    );
  }
}