import 'package:equatable/equatable.dart';

enum EmploymentType { fullTime, freelance }

class Experience extends Equatable {
  const Experience({
    required this.id,
    required this.company,
    required this.period,
    required this.role,
    required this.description,
    required this.type,
  });

  final String id;
  final String company;
  final String period;
  final String role;
  final String description;
  final EmploymentType type;

  @override
  List<Object?> get props => [id, company, period, role, description, type];
}
