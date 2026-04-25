import 'package:equatable/equatable.dart';

class Project extends Equatable {
  const Project({
    required this.id,
    required this.index,
    required this.name,
    required this.description,
    required this.tech,
    this.url,
  });

  final String id;
  final String index;
  final String name;
  final String description;
  final List<String> tech;
  final String? url;

  @override
  List<Object?> get props => [id, index, name, description, tech, url];
}
