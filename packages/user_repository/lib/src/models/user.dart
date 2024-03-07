class User {
  final String firstName;
  final String lastName;
  final String email;
  // final String password;
  final String phoneNumber;
  // final String gender;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    // required this.password,
    required this.phoneNumber,
    // required this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      // password: json['password'],
      phoneNumber: json['phone_number'],
      // gender: json['gender'],
    );
  }
  factory User.fill() {
    return User(
      firstName: '',
      lastName: '',
      email: '',
      // password: '',
      phoneNumber: '',
      // gender: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      // 'password': password,
      'phone_number': phoneNumber,
      // 'gender': gender,
    };
  }
}
