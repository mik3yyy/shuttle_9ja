class Transco {
  final String id;
  final String companyName;
  final String email;
  final String address;

  Transco({
    required this.id,
    required this.companyName,
    required this.email,
    required this.address,
  });

  factory Transco.fromJson(Map<String, dynamic> json) {
    return Transco(
      id: json['_id'],
      companyName: json['company_name'],
      email: json['email'],
      address: json['address'],
    );
  }
}
