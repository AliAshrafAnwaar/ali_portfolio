import '../../domain/entities/project.dart';

abstract class ProjectsDataSource {
  Future<List<Project>> getProjects();
}

class ProjectsFactoryDataSource implements ProjectsDataSource {
  @override
  Future<List<Project>> getProjects() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return const [
      Project(
        id: 'ali_portfolio',
        index: '01',
        name: 'ali_portfolio',
        description:
            'My Flutter portfolio website.',
        tech: ['Flutter', 'Dart'],
        url: 'https://github.com/AliAshrafAnwaar/ali_portfolio',
      ),
      Project(
        id: 'aliVerse',
        index: '02',
        name: 'aliVerse',
        description:
            'Public JavaScript project.',
        tech: ['JavaScript'],
        url: 'https://github.com/AliAshrafAnwaar/aliVerse',
      ),
      Project(
        id: 'course-exam-project',
        index: '03',
        name: 'course-exam-project',
        description: 'JavaScript course exam project.',
        tech: ['JavaScript'],
        url: 'https://github.com/AliAshrafAnwaar/course-exam-project',
      ),
      Project(
        id: 'cv-builder',
        index: '04',
        name: 'cv-builder',
        description: 'JavaScript CV builder project.',
        tech: ['JavaScript'],
        url: 'https://github.com/AliAshrafAnwaar/cv-builder',
      ),
      Project(
        id: 'promptic',
        index: '05',
        name: 'promptic',
        description: 'Public JavaScript project.',
        tech: ['JavaScript'],
        url: 'https://github.com/AliAshrafAnwaar/promptic',
      ),
      Project(
        id: 'flash-sale-checkout',
        index: '06',
        name: 'flash-sale-checkout',
        description: 'PHP flash sale checkout project.',
        tech: ['PHP'],
        url: 'https://github.com/AliAshrafAnwaar/flash-sale-checkout',
      ),
      Project(
        id: 'AliAshrafAnwaar',
        index: '07',
        name: 'AliAshrafAnwaar',
        description: 'Public GitHub profile repository.',
        tech: ['GitHub'],
        url: 'https://github.com/AliAshrafAnwaar/AliAshrafAnwaar',
      ),
      Project(
        id: 'recipe_app',
        index: '08',
        name: 'recipe_app',
        description: 'Flutter recipe app.',
        tech: ['Flutter', 'Dart'],
        url: 'https://github.com/AliAshrafAnwaar/recipe_app',
      ),
      Project(
        id: 'transaction_app',
        index: '09',
        name: 'transaction_app',
        description: 'Flutter transaction app.',
        tech: ['Flutter', 'Dart'],
        url: 'https://github.com/AliAshrafAnwaar/transaction_app',
      ),
      Project(
        id: 'card_game_app',
        index: '10',
        name: 'card_game_app',
        description: 'Flutter card game app.',
        tech: ['Flutter', 'Dart'],
        url: 'https://github.com/AliAshrafAnwaar/card_game_app',
      ),
      Project(
        id: 'Job_Finder_App',
        index: '11',
        name: 'Job_Finder_App',
        description: 'Flutter job finder app.',
        tech: ['Flutter', 'Dart'],
        url: 'https://github.com/AliAshrafAnwaar/Job_Finder_App',
      ),
      Project(
        id: 'object-detection-using-yolo-v5',
        index: '12',
        name: 'object-detection-using-yolo-v5',
        description: 'Object detection using YOLO v5.',
        tech: ['Jupyter Notebook', 'Python'],
        url: 'https://github.com/AliAshrafAnwaar/object-detection-using-yolo-v5',
      ),
      Project(
        id: 'Hemo',
        index: '13',
        name: 'Hemo',
        description: 'Python project.',
        tech: ['Python'],
        url: 'https://github.com/AliAshrafAnwaar/Hemo',
      ),
      Project(
        id: 'Face_Mask_Detection',
        index: '14',
        name: 'Face_Mask_Detection',
        description: 'Face mask detection using CNN and Haar Cascade.',
        tech: ['Jupyter Notebook', 'Python'],
        url: 'https://github.com/AliAshrafAnwaar/Face_Mask_Detection',
      ),
    ];
  }
}
