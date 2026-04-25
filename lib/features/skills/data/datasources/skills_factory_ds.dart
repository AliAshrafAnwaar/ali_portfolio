import '../../domain/entities/skill_category.dart';

abstract class SkillsDataSource {
  Future<List<SkillCategory>> getSkills();
}

class SkillsFactoryDataSource implements SkillsDataSource {
  @override
  Future<List<SkillCategory>> getSkills() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return const [
      SkillCategory(categoryKey: 'skillCategoryMobile', tags: [
        SkillTag(label: 'Flutter', warm: true),
        SkillTag(label: 'Dart', warm: true),
        SkillTag(label: 'Riverpod'),
        SkillTag(label: 'BLoC'),
        SkillTag(label: 'Provider'),
      ]),
      SkillCategory(categoryKey: 'skillCategoryWeb', tags: [
        SkillTag(label: 'React', warm: true),
        SkillTag(label: 'Laravel', warm: true),
        SkillTag(label: 'Node.js'),
        SkillTag(label: 'RESTful APIs'),
      ]),
      SkillCategory(categoryKey: 'skillCategoryBackend', tags: [
        SkillTag(label: 'Firebase'),
        SkillTag(label: 'Google Cloud'),
        SkillTag(label: 'PHP'),
        SkillTag(label: 'n8n'),
      ]),
      SkillCategory(categoryKey: 'skillCategoryArchitecture', tags: [
        SkillTag(label: 'MVVM'),
        SkillTag(label: 'MVP'),
        SkillTag(label: 'MVC'),
        SkillTag(label: 'Clean Arch'),
      ]),
      SkillCategory(categoryKey: 'skillCategoryAi', tags: [
        SkillTag(label: 'TFLite'),
        SkillTag(label: 'TensorFlow'),
        SkillTag(label: 'Scikit-learn'),
        SkillTag(label: 'OCR'),
      ]),
    ];
  }
}
