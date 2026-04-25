import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.phone,
    required this.linkedIn,
    required this.github,
    required this.whatsapp,
    required this.resumeUrl,
    required this.idCardSubtitle,
    required this.stats,
    required this.stackTags,
  });

  final String name;
  final String role;
  final String location;
  final String email;
  final String phone;
  final String linkedIn;
  final String github;
  final String whatsapp;
  final String resumeUrl;
  final String idCardSubtitle;
  final List<Stat> stats;
  final List<String> stackTags;

  @override
  List<Object?> get props => [
        name,
        role,
        location,
        email,
        phone,
        linkedIn,
        github,
        whatsapp,
        resumeUrl,
        idCardSubtitle,
        stats,
        stackTags,
      ];
}

class Stat extends Equatable {
  const Stat({required this.value, required this.labelKey});
  final String value;
  final String labelKey;

  @override
  List<Object?> get props => [value, labelKey];
}
