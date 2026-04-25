import '../../domain/entities/experience.dart';

abstract class ExperienceDataSource {
  Future<List<Experience>> getExperience();
}

class ExperienceFactoryDataSource implements ExperienceDataSource {
  @override
  Future<List<Experience>> getExperience() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return const [
      Experience(
        id: 'e1',
        company: 'Devoida',
        period: 'Feb 2025 — Present',
        role: 'Software Developer',
        description:
            'Building cross-platform mobile apps with Flutter, React web interfaces, and Laravel backends. Integrating AI, chatbots, and n8n automation workflows to streamline business operations at scale.',
        type: EmploymentType.fullTime,
      ),
      Experience(
        id: 'e2',
        company: 'Freelance',
        period: 'Jun 2024 — Feb 2025',
        role: 'Flutter Developer',
        description:
            'Built cross-platform apps for early-stage startups, improving user engagement and retention by 30%. Delivered full-stack Firebase solutions with secure authentication and custom error handling, enhancing data security by 20%.',
        type: EmploymentType.freelance,
      ),
    ];
  }
}
