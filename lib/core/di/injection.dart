import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/experience/data/datasources/experience_factory_ds.dart';
import '../../features/experience/data/datasources/experience_remote_ds.dart';
import '../../features/experience/data/repositories/experience_repository_impl.dart';
import '../../features/experience/domain/repositories/experience_repository.dart';
import '../../features/experience/view_model/experience_cubit.dart';
import '../../features/portfolio/data/datasources/portfolio_factory_ds.dart';
import '../../features/portfolio/data/datasources/portfolio_remote_ds.dart';
import '../../features/portfolio/data/repositories/portfolio_repository_impl.dart';
import '../../features/portfolio/domain/repositories/portfolio_repository.dart';
import '../../features/portfolio/view_model/portfolio_cubit.dart';
import '../../features/projects/data/datasources/projects_factory_ds.dart';
import '../../features/projects/data/datasources/projects_remote_ds.dart';
import '../../features/projects/data/repositories/projects_repository_impl.dart';
import '../../features/projects/domain/repositories/projects_repository.dart';
import '../../features/projects/view_model/projects_cubit.dart';
import '../../features/skills/data/datasources/skills_factory_ds.dart';
import '../../features/skills/data/datasources/skills_remote_ds.dart';
import '../../features/skills/data/repositories/skills_repository_impl.dart';
import '../../features/skills/domain/repositories/skills_repository.dart';
import '../../features/skills/view_model/skills_cubit.dart';
import '../constants/api_endpoints.dart';
import '../localization/locale_cubit.dart';
import '../network/dio_client.dart';
import '../theme/font_switcher_cubit.dart';
import '../theme/theme_mode_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  // ── External ─────────────────────────────────────────────────────────
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
  sl.registerLazySingleton<Dio>(DioClient.create);

  // ── Global cubits ────────────────────────────────────────────────────
  sl.registerLazySingleton<FontSwitcherCubit>(
    () => FontSwitcherCubit(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<LocaleCubit>(
    () => LocaleCubit(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<ThemeModeCubit>(
    () => ThemeModeCubit(sl<SharedPreferences>()),
  );

  // ── Portfolio ────────────────────────────────────────────────────────
  sl.registerLazySingleton<PortfolioDataSource>(
    () => kUseFactoryData
        ? PortfolioFactoryDataSource()
        : PortfolioRemoteDataSource(sl<Dio>()),
  );
  sl.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryImpl(sl<PortfolioDataSource>()),
  );
  sl.registerFactory<PortfolioCubit>(
    () => PortfolioCubit(sl<PortfolioRepository>()),
  );

  // ── Skills ───────────────────────────────────────────────────────────
  sl.registerLazySingleton<SkillsDataSource>(
    () => kUseFactoryData
        ? SkillsFactoryDataSource()
        : SkillsRemoteDataSource(sl<Dio>()),
  );
  sl.registerLazySingleton<SkillsRepository>(
    () => SkillsRepositoryImpl(sl<SkillsDataSource>()),
  );
  sl.registerFactory<SkillsCubit>(() => SkillsCubit(sl<SkillsRepository>()));

  // ── Projects ─────────────────────────────────────────────────────────
  sl.registerLazySingleton<ProjectsDataSource>(
    () => kUseFactoryData
        ? ProjectsFactoryDataSource()
        : ProjectsRemoteDataSource(sl<Dio>()),
  );
  sl.registerLazySingleton<ProjectsRepository>(
    () => ProjectsRepositoryImpl(sl<ProjectsDataSource>()),
  );
  sl.registerFactory<ProjectsCubit>(
    () => ProjectsCubit(sl<ProjectsRepository>()),
  );

  // ── Experience ───────────────────────────────────────────────────────
  sl.registerLazySingleton<ExperienceDataSource>(
    () => kUseFactoryData
        ? ExperienceFactoryDataSource()
        : ExperienceRemoteDataSource(sl<Dio>()),
  );
  sl.registerLazySingleton<ExperienceRepository>(
    () => ExperienceRepositoryImpl(sl<ExperienceDataSource>()),
  );
  sl.registerFactory<ExperienceCubit>(
    () => ExperienceCubit(sl<ExperienceRepository>()),
  );
}
