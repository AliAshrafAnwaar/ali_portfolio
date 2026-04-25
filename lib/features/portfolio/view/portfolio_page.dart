import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/url_opener.dart';
import '../../../core/widgets/font_switcher_bar.dart';
import '../../../core/widgets/loaders/error_view.dart';
import '../../../core/widgets/loaders/shimmer_card.dart';
import '../../../core/widgets/section/section_container.dart';
import '../../../core/widgets/section/section_header.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../experience/view/experience_section.dart';
import '../../experience/view_model/experience_cubit.dart';
import '../../projects/view/projects_section.dart';
import '../../projects/view_model/projects_cubit.dart';
import '../../skills/view/skills_section.dart';
import '../../skills/view_model/skills_cubit.dart';
import '../view_model/portfolio_cubit.dart';
import '../view_model/portfolio_state.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer_bar.dart';
import 'widgets/hero_section.dart';
import 'widgets/nav_bar.dart';
import 'widgets/stats_grid.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PortfolioCubit>()..load()),
        BlocProvider(create: (_) => sl<SkillsCubit>()..load()),
        BlocProvider(create: (_) => sl<ProjectsCubit>()..load()),
        BlocProvider(create: (_) => sl<ExperienceCubit>()..load()),
      ],
      child: const _PortfolioView(),
    );
  }
}

class _PortfolioView extends StatefulWidget {
  const _PortfolioView();

  @override
  State<_PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<_PortfolioView> {
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _workKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
        alignment: 0.0,
      );
    }
  }

  void _scrollTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.cream,
      body: BlocBuilder<PortfolioCubit, PortfolioState>(
        builder: (context, state) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverToBoxAdapter(child: FontSwitcherBar()),
              SliverPersistentHeader(
                pinned: true,
                delegate: _NavBarDelegate(
                  child: NavBar(
                    onAbout: () => _scrollTo(_aboutKey),
                    onWork: () => _scrollTo(_workKey),
                    onExperience: () => _scrollTo(_experienceKey),
                    onContact: () => _scrollTo(_contactKey),
                    onResume: () {
                      final url = state is PortfolioLoaded
                          ? (state).profile.resumeUrl
                          : 'https://drive.google.com/file/d/1PEeUn-aSc4sLOD--OEKtAx0ln39Bdtv5/view?usp=sharing';
                      UrlOpener.open(url);
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: switch (state) {
                  PortfolioInitial() || PortfolioLoading() =>
                    const Padding(
                      padding: EdgeInsets.all(AppSpacing.xl4),
                      child: ShimmerBox(height: 420),
                    ),
                  PortfolioError(:final message) => Padding(
                      padding: const EdgeInsets.all(AppSpacing.xl4),
                      child: ErrorView(
                        message: message,
                        onRetry: () =>
                            context.read<PortfolioCubit>().load(),
                      ),
                    ),
                  PortfolioLoaded(:final profile) => HeroSection(
                      profile: profile,
                      onWork: () => _scrollTo(_workKey),
                      onContact: () => _scrollTo(_contactKey),
                    ),
                },
              ),
              SliverToBoxAdapter(
                child: SectionContainer(
                  id: ValueKey(_aboutKey),
                  child: KeyedSubtree(
                    key: _aboutKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(
                          number: '00',
                          title: l.sectionAtAGlance,
                        ),
                        if (state is PortfolioLoaded)
                          StatsGrid(stats: state.profile.stats)
                        else
                          const ShimmerBox(height: 140),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(
                        number: '01',
                        title: l.sectionWhatIWorkWith,
                      ),
                      const SkillsSection(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionContainer(
                  child: KeyedSubtree(
                    key: _workKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(
                          number: '02',
                          title: l.sectionSelectedWork,
                        ),
                        const ProjectsSection(),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionContainer(
                  child: KeyedSubtree(
                    key: _experienceKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(
                          number: '03',
                          title: l.sectionExperience,
                        ),
                        const ExperienceSection(),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionContainer(
                  child: KeyedSubtree(
                    key: _contactKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(
                          number: '04',
                          title: l.sectionLetsTalk,
                        ),
                        if (state is PortfolioLoaded)
                          ContactSection(profile: state.profile)
                        else
                          const SizedBox(height: 200),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FooterBar(onBackToTop: _scrollTop),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _NavBarDelegate extends SliverPersistentHeaderDelegate {
  _NavBarDelegate({required this.child});
  final Widget child;
  @override
  double get minExtent => 60;
  @override
  double get maxExtent => 60;
  @override
  Widget build(BuildContext context, double shrink, bool overlaps) => child;
  @override
  bool shouldRebuild(covariant _NavBarDelegate oldDelegate) =>
      oldDelegate.child != child;
}
