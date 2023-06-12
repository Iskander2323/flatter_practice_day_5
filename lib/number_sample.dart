// import 'dart:io';

// // Переделать на одну функцию и дать правильное название
// numberToSample(String ) {

//   String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
//   RegExp regExp = new RegExp(pattern);

//   String smth = x.trim().replaceAll(' ', '').replaceAll('-', '');
//   // Переписать механизм с учётом длины, а не первой цифры

//   if (x.isEmpty) {
//     print('Phone number is valid!');
//   } else if (regExp.hasMatch(smth) && x.length >= 10) {
//     var num = smth.substring(smth.length - 10);
//   var response = '+7' +
//       '-(' +
//       num.substring(0, 3) +
//       ')-' +
//       num.substring(3, 6) +
//       '-' +
//       num.substring(6, 8) +
//       '-' +
//       num.substring(8, 10);
//   return response;
//   } else {
//     print('The wrong number!');
//   }
  
// }

// class NumberSample {
//   late String x;
  
// }

// void main() {
//   print('Enter your number: ');
//   var x = stdin.readLineSync() ?? '0'; // Добавить валидацию и трим
//   String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
//   RegExp regExp = new RegExp(pattern);

//   String smth = x.trim().replaceAll(' ', '').replaceAll('-', '');
//   // Переписать механизм с учётом длины, а не первой цифры

//   if (x.isEmpty) {
//     print('Phone number is valid!');
//   } else if (regExp.hasMatch(smth) && x.length >= 10) {
//     //print('Enter the correct number');
//     var response = numberToSample(smth);
//     print(response);
//   } else {
//     print('The wrong number!');
//   }
// }
