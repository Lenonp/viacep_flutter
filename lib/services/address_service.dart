import 'dart:convert';

import 'package:viacep/model/address.dart';
import 'package:http/http.dart' as http;

class AddressService {
  final String uri;

  const AddressService({required this.uri});

  Future<Address> fetchAddress() async {
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$uri/json/'));
    if(response.statusCode == 200) {
      return Address.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load address!');
    }
  }
}
