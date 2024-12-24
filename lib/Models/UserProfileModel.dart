class UserProfileModel {
  final int id;
  final String email;
  final String name;
  final String otp;
  final DateTime otpExpiry;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int roleId;
  final bool isEnabled;
  final Profile profile;

  UserProfileModel({
    required this.id,
    required this.email,
    required this.name,
    required this.otp,
    required this.otpExpiry,
    required this.createdAt,
    required this.updatedAt,
    required this.roleId,
    required this.isEnabled,
    required this.profile,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      otp: json['otp'],
      otpExpiry: DateTime.parse(json['otpExpiry']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      roleId: json['roleId'],
      isEnabled: json['isEnabled'],
      profile: Profile.fromJson(json['profile']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'otp': otp,
      'otpExpiry': otpExpiry.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'roleId': roleId,
      'isEnabled': isEnabled,
      'profile': profile.toJson(),
    };
  }
}

class Profile {
  final int id;
  final int country;
  final String city;
  final String phone;
  final DateTime dateOfBirth;
  final String gender;
  final int height;
  final int weight;
  final int goal;
  final int activityLevel;
  final List<String> dairyPreferences;
  final List<String> cuisinePreferences;

  Profile({
    required this.id,
    required this.country,
    required this.city,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
    required this.height,
    required this.weight,
    required this.goal,
    required this.activityLevel,
    required this.dairyPreferences,
    required this.cuisinePreferences,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      country: json['country'],
      city: json['city'],
      phone: json['phone'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      gender: json['gender'],
      height: json['height'],
      weight: json['weight'],
      goal: json['goal'],
      activityLevel: json['activityLevel'],
      dairyPreferences: List<String>.from(json['dairyPreferences']),
      cuisinePreferences: List<String>.from(json['cuisinePreferences']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country': country,
      'city': city,
      'phone': phone,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'height': height,
      'weight': weight,
      'goal': goal,
      'activityLevel': activityLevel,
      'dairyPreferences': dairyPreferences,
      'cuisinePreferences': cuisinePreferences,
    };
  }
}
