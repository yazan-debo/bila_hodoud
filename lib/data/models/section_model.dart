import '../../domain/entities/section.dart';

class SectionModel {
  final String name;
  final int priority;
  final bool isVisible;
  final String description;

  SectionModel({
    required this.name,
    required this.priority,
    required this.isVisible,
    required this.description,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      name: json['name'],
      priority: json['priority'],
      isVisible: json['is_visible'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'priority': priority,
      'is_visible': isVisible,
      'description': description,
    };
  }

  Map<String, dynamic> toJson1() {
    return {
      'name': name,
      'priority': priority,
      'is_visible': isVisible,
    };
  }

  factory SectionModel.fromEntity(Section section) {
    return SectionModel(
      name: section.sectionName,
      priority: section.sectionOrder,
      isVisible: section.sectionStatus,
      description: section.sectionDescription,
    );
  }
}