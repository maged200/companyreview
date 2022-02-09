import 'package:flutter/material.dart';

class LoginBody {
  String email;
  String password;

  LoginBody({@required this.email, @required this.password});

  LoginBody.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class UserData {
  String fullName;
  String fullNameAr;
  int nationalId;
  int phoneNumber;
  String birthDate;
  int gender;
  String jobTitle;
  String originName;
  String address;
  String profilePicture;
  int socialStatus;
  int status;
  String about;
  int postalCode;
  int countryId;
  int regionId;
  int cityId;
  int registrationTypeId;
  bool isVerified;
  String specialization;
  String password;

  List<int> roleIds;
  List<UserExperiences> userExperiences;
  int id;
  String email;

  UserData({
    this.fullName,
    this.fullNameAr,
    this.nationalId,
    this.phoneNumber,
    this.birthDate,
    this.gender,
    this.jobTitle,
    this.originName,
    this.address,
    this.profilePicture,
    this.socialStatus,
    this.status,
    this.about,
    this.postalCode,
    this.countryId,
    this.regionId,
    this.cityId,
    this.registrationTypeId,
    this.isVerified,
    this.roleIds,
    this.userExperiences,
    this.id,
    this.email,
    this.specialization,
    this.password,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    fullNameAr = json['fullNameAr'];
    nationalId = json['nationalId'];
    phoneNumber = json['phoneNumber'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    jobTitle = json['jobTitle'];
    originName = json['originName'];
    address = json['address'];
    profilePicture = json['profilePicture'];
    socialStatus = json['socialStatus'];
    status = json['status'];
    about = json['about'];
    postalCode = json['postalCode'];
    countryId = json['countryId'];
    regionId = json['regionId'];
    cityId = json['cityId'];
    registrationTypeId = json['registrationTypeId'];
    isVerified = json['isVerified'];
    specialization = json['specialization'];
    password = json['password'];

    roleIds = json['roleIds'].cast<int>();
    if (json['userExperiences'] != null) {
      // ignore: deprecated_member_use
      userExperiences = new List<UserExperiences>();
      json['userExperiences'].forEach((v) {
        userExperiences.add(new UserExperiences.fromJson(v));
      });
    }
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['fullNameAr'] = this.fullNameAr;
    data['nationalId'] = this.nationalId;
    data['phoneNumber'] = this.phoneNumber;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['jobTitle'] = this.jobTitle;
    data['originName'] = this.originName;
    data['address'] = this.address;
    data['profilePicture'] = this.profilePicture;
    data['socialStatus'] = this.socialStatus;
    data['status'] = this.status;
    data['about'] = this.about;
    data['postalCode'] = this.postalCode;
    data['countryId'] = this.countryId;
    data['regionId'] = this.regionId;
    data['cityId'] = this.cityId;
    data['registrationTypeId'] = this.registrationTypeId;
    data['isVerified'] = this.isVerified;
    data['roleIds'] = this.roleIds;
    data['specialization'] = this.specialization;
    data['password'] = this.password;

    if (this.userExperiences != null) {
      data['userExperiences'] =
          this.userExperiences.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['email'] = this.email;
    return data;
  }
}

class UserExperiences {
  String name;
  Null year;
  Null level;
  int type;
  int userId;

  UserExperiences({this.name, this.year, this.level, this.type, this.userId});

  UserExperiences.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    year = json['year'];
    level = json['level'];
    type = json['type'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['year'] = this.year;
    data['level'] = this.level;
    data['type'] = this.type;
    data['userId'] = this.userId;
    return data;
  }
}
