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
        id: 'p1',
        index: '01',
        name: 'AI Transaction Archiving App',
        description:
            'Arabic OCR-powered fintech app — 40% better transaction categorization, full admin dashboard, and AI-driven workflow for automated data entry.',
        tech: ['Flutter', 'TFLite', 'Firebase', 'Riverpod', 'MVP'],
      ),
      Project(
        id: 'p2',
        index: '02',
        name: 'Jobizz — Job Platform',
        description:
            'Full-featured job board built with a 6-person team. Led authentication, Google & Facebook sign-in, and MVVM architecture design.',
        tech: ['Flutter', 'Firebase', 'BLoC', 'MVVM'],
      ),
      Project(
        id: 'p3',
        index: '03',
        name: 'Multiplayer Card Game',
        description:
            'Real-time card game serving 5,000+ users. Cut latency by 80% with a singleton Firebase strategy for seamless live sync.',
        tech: ['Flutter', 'Firebase', 'Dart'],
      ),
    ];
  }
}
