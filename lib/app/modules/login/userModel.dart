// ignore_for_file: file_names

class UserModel {
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? phone;
  String? userId;
  String? legalStatus;
  DateTime? dob;
  String? photoUrl;

  UserModel(
      {this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.legalStatus,
      this.dob,
      this.phone,
      this.userId,
      this.photoUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    email = json['Email'];
    firstName = json['First_Name'];
    lastName = json['Last_Name'];
    password = json['Password'];
    phone = json['Phone'];
    userId = json['User_Id'];
    legalStatus = json['Legal_Status'];
    dob = DateTime.tryParse(json['Dob']);
    photoUrl = json['Photo_Url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Username'] = username;
    data['Email'] = email;
    data['First_Name'] = firstName;
    data['Last_Name'] = lastName;
    data['Password'] = password;
    data['Phone'] = phone;
    data['User_Id'] = userId;
    data['Legal_Status'] = legalStatus;
    data['Dob'] = dob?.toIso8601String();
    data['Photo_Url'] = photoUrl;
    return data;
  }
}
