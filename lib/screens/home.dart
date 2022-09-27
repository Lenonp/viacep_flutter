import 'package:flutter/material.dart';
import 'package:viacep/components/address_component.dart';
import 'package:viacep/model/address.dart';
import 'package:viacep/services/address_service.dart';

class Home extends StatefulWidget {
  Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Address>? futureAddress;
  final TextEditingController cepTextController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ViaCEP'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(controller: cepTextController, keyboardType: TextInputType.number, maxLength: 8,),
            ElevatedButton(onPressed: () {
              final AddressService addressService = AddressService(uri: cepTextController.text);
              setState(() {
                futureAddress = addressService.fetchAddress();
              });
            }, child: Text('Find address')),

            (futureAddress == null) ? Text('Nothing to show') : FutureBuilder<Address>(future: futureAddress, builder: ((context, snapshot) {
              if(snapshot.hasData) {
                return AddressComponent(data: snapshot.data!);
              } else if(snapshot.hasError) {
                return Text('No address available');
              }
              return CircularProgressIndicator();
            }),),
          ],
        ),
      ),
    );
  }
}
