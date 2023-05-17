class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String? cellPhone;
  final String? avatar;
  final String token;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    this.cellPhone,
    this.avatar,
    required this.token,
  });
}
