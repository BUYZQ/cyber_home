class User {
  final String fullName;
  final String date;
  final String gender;
  final String email;
  final String password;
  final bool isAdmin;

  User({
    required this.fullName,
    required this.date,
    required this.gender,
    required this.email,
    required this.password,
    required this.isAdmin,
  });
}