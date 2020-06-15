class User {
  final int id;
  final String name;
  final String career;
  final String email;
  final String phone;
  final String imageUrl;
  final bool is_admin;

  User(this.id, this.name, this.email, this.career, this.phone, this.imageUrl,
      this.is_admin);
}

final User currentUser =
    User(3, 'abdulaziz', 'aalbelali@ns3a.com', 'CEO', '050999999', null, true);

//example
List<User> users = [
  User(1, 'nora', 'nora@ns3a.com', 'System Analyst', '0509732281', 'image',
      true),
  User(2, 'adwa', 'adwa@ns3a.com', 'Founder', '0500000000', 'image2', false),
  User(3, 'abdulaziz', 'aalbelali@ns3a.com', 'CEO', '050999999', 'image', false)
];
