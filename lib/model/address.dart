class Address {
  final String streetName;
  final String district;
  final String uf;
  final String state;
  final String cep;

  const Address(
      {required this.streetName,
      required this.district,
      required this.uf,
      required this.state,
      required this.cep});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        streetName: json['logradouro'],
        district: json['bairro'],
        uf: json['uf'],
        state: json['localidade'],
        cep: json['cep']);
  }


}
