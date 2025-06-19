class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String specialization;
  final String bio;
  final String? imageUrl;
  final Map<String, dynamic>? settings;
  final List<String>? languages;
  final String? licenseNumber;
  final int experienceYears;
  final Map<String, dynamic>? workingHours;
  final double? rating;
  final int? totalReviews;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.specialization,
    required this.bio,
    this.imageUrl,
    this.settings,
    this.languages,
    this.licenseNumber,
    required this.experienceYears,
    this.workingHours,
    this.rating,
    this.totalReviews,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      specialization: json['specialization'],
      bio: json['bio'] ?? '',
      imageUrl: json['imageUrl'],
      settings: json['settings'],
      languages: json['languages'] != null 
          ? List<String>.from(json['languages'])
          : null,
      licenseNumber: json['licenseNumber'],
      experienceYears: json['experienceYears'] ?? 0,
      workingHours: json['workingHours'],
      rating: json['rating']?.toDouble(),
      totalReviews: json['totalReviews'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'specialization': specialization,
      'bio': bio,
      'imageUrl': imageUrl,
      'settings': settings,
      'languages': languages,
      'licenseNumber': licenseNumber,
      'experienceYears': experienceYears,
      'workingHours': workingHours,
      'rating': rating,
      'totalReviews': totalReviews,
    };
  }

  ProfileModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? specialization,
    String? bio,
    String? imageUrl,
    Map<String, dynamic>? settings,
    List<String>? languages,
    String? licenseNumber,
    int? experienceYears,
    Map<String, dynamic>? workingHours,
  }) {
    return ProfileModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      specialization: specialization ?? this.specialization,
      bio: bio ?? this.bio,
      imageUrl: imageUrl ?? this.imageUrl,
      settings: settings ?? this.settings,
      languages: languages ?? this.languages,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      experienceYears: experienceYears ?? this.experienceYears,
      workingHours: workingHours ?? this.workingHours,
      rating: rating,
      totalReviews: totalReviews,
    );
  }
} 