import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.name,
    required super.role,
    required super.location,
    required super.email,
    required super.phone,
    required super.linkedIn,
    required super.github,
    required super.whatsapp,
    required super.resumeUrl,
    required super.idCardSubtitle,
    required super.stats,
    required super.stackTags,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] as String,
      role: json['role'] as String,
      location: json['location'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      linkedIn: json['linkedIn'] as String,
      github: json['github'] as String,
      whatsapp: json['whatsapp'] as String,
      resumeUrl: json['resumeUrl'] as String,
      idCardSubtitle: json['idCardSubtitle'] as String,
      stats: (json['stats'] as List)
          .map((e) => Stat(
                value: e['value'] as String,
                labelKey: e['labelKey'] as String,
              ))
          .toList(),
      stackTags: List<String>.from(json['stackTags'] as List),
    );
  }
}
