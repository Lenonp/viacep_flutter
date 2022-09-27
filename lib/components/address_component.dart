import 'package:flutter/material.dart';

import '../model/address.dart';

class AddressComponent extends StatelessWidget {
  final Address data;

const AddressComponent({ Key? key, required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
      Text('Street Name: ' + data.streetName),
      Text('District: ' + data.district),
      Text('UF: ' + data.uf),
      Text('State: ' + data.state),
      Text('CEP: ' + data.cep),
    ],);
  }
}
