class User {
  User({
    this.userName,
    this.email,
    this.name,
    this.phoneNumber,
    this.address,
    this.dateOfBirth,
    this.avatarUrl,
  });

  String? userName;
  String? email;
  String? name;
  String? phoneNumber;
  String? address;
  DateTime? dateOfBirth;
  String? avatarUrl;

  @override
  String toString() {
    return 'User: (userName: $userName, email: $email, phoneNumber: $phoneNumber, address: $address, dateOfBirth: $dateOfBirth, avatarUrl: $avatarUrl)';
  }
}
