import 'package:flutter/material.dart';
import 'package:viacep/screens/home.dart';

void main() {
  runApp(const ViaCEP());
}

class ViaCEP extends StatelessWidget {
const ViaCEP({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'ViaCEP',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
