class SettingsModel {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  SettingsModel(this.firstName, this.lastName, this.phone, this.email);

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
        json['firstName'], json['lastName'], json['phone'], json['email']);
  }
}
