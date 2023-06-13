import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Number Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  var _number = ' ';
  void _numberSample(String countryCode) {
    setState(() {
      String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
      RegExp regExp = new RegExp(pattern);

      String smth =
          myController.text.trim().replaceAll(' ', '').replaceAll('-', '');

      if (myController.text.isEmpty) {
        _number = 'Phone number is valid!';
      } else if (regExp.hasMatch(smth) && smth.length >= 10) {
        var num = smth.substring(smth.length - 10);
        var response = '${countryCode}-(' +
            num.substring(0, 3) +
            ')-' +
            num.substring(3, 6) +
            '-' +
            num.substring(6, 8) +
            '-' +
            num.substring(8, 10);
        _number = response;
      } else {
        _number = 'The number is not long enough or incorrect!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 10,
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 251, 250),
                  border: Border(bottom: BorderSide(color: Colors.blueAccent)),
                ),
                alignment: Alignment.topCenter,
                height: 30,
                width: 400,
                child: Text(
                  _number,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 80,
                  horizontal: 8,
                ),
                child: TextFormField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your number:',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 10, 115, 201)),
                ),
                onPressed: () {
                  _numberSample('+7');
                },
                child: Text(
                  'To Sample',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 45,
                horizontal: 10,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        icon: Flag.fromCode(
                          FlagsCode.KZ,
                        ),
                        iconSize: 5,
                        onPressed: () {
                          _numberSample('+7');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        icon: Flag.fromCode(
                          FlagsCode.US,
                        ),
                        iconSize: 5,
                        onPressed: () {
                          _numberSample('+1');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        icon: Flag.fromCode(
                          FlagsCode.UA,
                        ),
                        iconSize: 5,
                        onPressed: () {
                          _numberSample('+380');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
