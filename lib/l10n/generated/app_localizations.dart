import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Ali Ashraf Anwar'**
  String get appTitle;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get navWork;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @navResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get navResume;

  /// No description provided for @fontLabel.
  ///
  /// In en, this message translates to:
  /// **'FONT'**
  String get fontLabel;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'LANG'**
  String get languageLabel;

  /// No description provided for @heroAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available for work · Alexandria, Egypt'**
  String get heroAvailable;

  /// No description provided for @heroOpenToOpps.
  ///
  /// In en, this message translates to:
  /// **'Open to opportunities'**
  String get heroOpenToOpps;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer — Flutter · React · Laravel'**
  String get heroTitle;

  /// No description provided for @heroBio.
  ///
  /// In en, this message translates to:
  /// **'I build things — clean mobile apps, solid backends, and thoughtful experiences that hold up under real-world pressure.'**
  String get heroBio;

  /// No description provided for @heroBioBold.
  ///
  /// In en, this message translates to:
  /// **'trust'**
  String get heroBioBold;

  /// No description provided for @heroCtaPrimary.
  ///
  /// In en, this message translates to:
  /// **'See my work'**
  String get heroCtaPrimary;

  /// No description provided for @heroCtaSecondary.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get heroCtaSecondary;

  /// No description provided for @idCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer · BSc CS & AI, GPA 3.48'**
  String get idCardSubtitle;

  /// No description provided for @sectionAtAGlance.
  ///
  /// In en, this message translates to:
  /// **'At a glance'**
  String get sectionAtAGlance;

  /// No description provided for @sectionWhatIWorkWith.
  ///
  /// In en, this message translates to:
  /// **'What I work with'**
  String get sectionWhatIWorkWith;

  /// No description provided for @sectionSelectedWork.
  ///
  /// In en, this message translates to:
  /// **'Selected work'**
  String get sectionSelectedWork;

  /// No description provided for @sectionExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get sectionExperience;

  /// No description provided for @sectionLetsTalk.
  ///
  /// In en, this message translates to:
  /// **'Let\'s talk'**
  String get sectionLetsTalk;

  /// No description provided for @stat1Label.
  ///
  /// In en, this message translates to:
  /// **'Shipped projects with real users'**
  String get stat1Label;

  /// No description provided for @stat2Label.
  ///
  /// In en, this message translates to:
  /// **'Happy clients'**
  String get stat2Label;

  /// No description provided for @stat3Label.
  ///
  /// In en, this message translates to:
  /// **'Building cross-platform apps'**
  String get stat3Label;

  /// No description provided for @skillCategoryMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get skillCategoryMobile;

  /// No description provided for @skillCategoryWeb.
  ///
  /// In en, this message translates to:
  /// **'Web'**
  String get skillCategoryWeb;

  /// No description provided for @skillCategoryBackend.
  ///
  /// In en, this message translates to:
  /// **'Backend'**
  String get skillCategoryBackend;

  /// No description provided for @skillCategoryArchitecture.
  ///
  /// In en, this message translates to:
  /// **'Architecture'**
  String get skillCategoryArchitecture;

  /// No description provided for @skillCategoryAi.
  ///
  /// In en, this message translates to:
  /// **'AI & ML'**
  String get skillCategoryAi;

  /// No description provided for @projectsMoreSoon.
  ///
  /// In en, this message translates to:
  /// **'More coming soon'**
  String get projectsMoreSoon;

  /// No description provided for @expBadgeFullTime.
  ///
  /// In en, this message translates to:
  /// **'Full-time'**
  String get expBadgeFullTime;

  /// No description provided for @expBadgeFreelance.
  ///
  /// In en, this message translates to:
  /// **'Freelance'**
  String get expBadgeFreelance;

  /// No description provided for @contactHeading.
  ///
  /// In en, this message translates to:
  /// **'Got a project'**
  String get contactHeading;

  /// No description provided for @contactHeadingAccent.
  ///
  /// In en, this message translates to:
  /// **'in mind?'**
  String get contactHeadingAccent;

  /// No description provided for @contactSub.
  ///
  /// In en, this message translates to:
  /// **'Whether it\'s a mobile app, a web platform, or something in between — I\'d love to hear about it.'**
  String get contactSub;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get contactLinkedIn;

  /// No description provided for @contactGithub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get contactGithub;

  /// No description provided for @contactWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get contactWhatsApp;

  /// No description provided for @footerCopy.
  ///
  /// In en, this message translates to:
  /// **'© 2025 Ali Ashraf Anwar'**
  String get footerCopy;

  /// No description provided for @footerBackToTop.
  ///
  /// In en, this message translates to:
  /// **'Back to top ↑'**
  String get footerBackToTop;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
