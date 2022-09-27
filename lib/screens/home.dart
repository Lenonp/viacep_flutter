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
  late Future<Address> futureAddress;
  final AddressService addressService = AddressService(uri: 'https://viacep.com.br/ws/01001000/json/');

  @override
  void initState(){
    super.initState();
    futureAddress = addressService.fetchAddress();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ViaCEP'),
      ),
      body: Center(
        child: FutureBuilder<Address>(future: futureAddress, builder: ((context, snapshot) {
          if(snapshot.hasData) {
            return AddressComponent(data: snapshot.data!);
          } else if(snapshot.hasError) {
            return Text('No address available');
          }
          return CircularProgressIndicator();
        }),),
      ),
    );
  }
}
