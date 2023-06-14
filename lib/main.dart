import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_practice_day_5/feedback.dart';
import 'package:http/http.dart' as http;

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
      home: const MyHomePage(title: 'Sending Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<bool?> createFeedback(
    String fullName, String phone, String email) async {
  final response =
      await http.post(Uri.parse('http://192.168.1.24:8000/feedback/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'full_name': fullName,
            'phone': phone,
            'email': email,
          }));
  if (response.statusCode == 200) {
    debugPrint('This worked');
    return true;
  } else {
    debugPrint('That did not work');
    return false;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  late var _feedbackPost;

  Future _waitingCircle() {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<void> _dialogStatusTrue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Запрос прошел успешно'),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK')),
            ],
          );
        });
  }

  Future<void> _dialogStatusFalse(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Запрос не прошел'),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK')),
            ],
          );
        });
  }

  var _number = ' ';
  void _numberSample() {
    setState(() {
      String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
      RegExp regExp = new RegExp(pattern);

      String smth =
          phoneController.text.trim().replaceAll(' ', '').replaceAll('-', '');

      if (phoneController.text.isEmpty) {
        _number = 'Phone number is valid!';
      } else if (regExp.hasMatch(smth) && smth.length >= 10) {
        var num = smth.substring(smth.length - 10);
        var response = '+7-(' +
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
        body: Center(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your full name:',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              child: TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your number:',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email:',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  _waitingCircle()
                  String fullName = nameController.text;
                  String phone = phoneController.text;
                  String email = emailController.text;
                  _feedbackPost = await createFeedback(fullName, phone, email);
                  if (_feedbackPost == true) {
                    Navigator.of(context).pop();
                    _dialogStatusTrue(context);
                  } else {
                    _dialogStatusFalse(context);
                    Navigator.of(context).pop();

                  }
                },
                child: Text('Send')),
          ]),
        ));
  }
}
