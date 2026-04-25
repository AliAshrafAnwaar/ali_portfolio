import '../../domain/entities/profile.dart';
import '../models/profile_model.dart';

abstract class PortfolioDataSource {
  Future<ProfileModel> getProfile();
}

/// Demo data source — content lifted from DNA.md §1 + §7.
class PortfolioFactoryDataSource implements PortfolioDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    return const ProfileModel(
      name: 'Ali Ashraf Anwar',
      role: 'Software Engineer — Flutter · React · Laravel',
      location: 'Alexandria, Egypt',
      email: 'aliashrafanwaar@gmail.com',
      phone: '+201025591901',
      linkedIn: 'https://www.linkedin.com/in/aliashraf899/',
      github: 'https://github.com/AliAshrafAnwaar',
      whatsapp: 'https://wa.me/201025591901',
      resumeUrl:
          'https://drive.google.com/file/d/1PEeUn-aSc4sLOD--OEKtAx0ln39Bdtv5/view?usp=sharing',
      idCardSubtitle: 'Software Engineer · BSc CS & AI',
      stackTags: ['React', 'Laravel', 'AI integration', 'Flutter'],
      stats: [
        Stat(value: '10+', labelKey: 'stat1Label'),
        Stat(value: '2+', labelKey: 'stat2Label'),
        Stat(value: '2y+', labelKey: 'stat3Label'),
      ],
    );
  }
}
