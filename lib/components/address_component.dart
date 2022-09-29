import 'package:flutter/material.dart';

import '../model/address.dart';

class AddressComponent extends StatelessWidget {
  final Address data;

const AddressComponent({ Key? key, required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _TextShow(label: 'Street Name: ', info: data.streetName),
        _TextShow(label: 'District: ', info: data.district),
        _TextShow(label: 'UF: ', info: data.uf),
        _TextShow(label: 'State: ', info: data.state),
        _TextShow(label: 'CEP: ', info: data.cep),
    ],);
  }
}

class _TextShow extends StatelessWidget {
  final String label;
  final String info;
  const _TextShow({Key? key, required this.label, required this.info }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text.rich(
        TextSpan(
          text: label,
          children: <TextSpan>[
            TextSpan(text: info),
          ],
        ),
      ),
    );
  }
}
