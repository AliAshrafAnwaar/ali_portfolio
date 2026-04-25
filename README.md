# ali_portfolio

Personal portfolio for **Ali Ashraf Anwar** — a Flutter app implementing the
"Editorial Warm" design system (DM Serif Display + DM Sans + DM Mono, cream/ink/warm tokens).

## Stack

- **State management:** `flutter_bloc` (Cubit-as-ViewModel)
- **Networking:** `dio` + `pretty_dio_logger`
- **Architecture:** feature-first **MVVM** (`data` / `domain` / `view_model` / `view`)
- **DI:** `get_it`
- **Routing:** `go_router`
- **i18n:** `flutter_localizations` + ARB files (`en`, `ar` with RTL)
- **UI:** `google_fonts`, `flutter_animate`

## Folder layout

```
lib/
├─ app/                    # MaterialApp.router root + go_router + bloc observer
├─ core/
│  ├─ constants/           # api endpoints, asset paths
│  ├─ di/                  # get_it container
│  ├─ error/               # sealed Failure + dio error mapper
│  ├─ localization/        # LocaleCubit (EN/AR)
│  ├─ network/             # DioClient
│  ├─ theme/               # colors, text styles, theme, font switcher cubit
│  ├─ utils/               # responsive breakpoints, url opener
│  └─ widgets/             # GLOBAL reusable: buttons, pills, section, serif heading, ...
├─ features/
│  ├─ portfolio/           # umbrella: profile + hero + stats + contact + footer
│  ├─ skills/
│  ├─ projects/
│  └─ experience/
│     └─ data / domain / view_model / view / widgets
└─ l10n/                   # app_en.arb + app_ar.arb (+ generated/)
```

Each feature follows the same MVVM split:

```
features/<name>/
├─ data/
│  ├─ datasources/   <name>_factory_ds.dart  (demo)  +  <name>_remote_ds.dart  (Dio)
│  ├─ models/
│  └─ repositories/  <name>_repository_impl.dart
├─ domain/
│  ├─ entities/
│  └─ repositories/  abstract <Name>Repository
├─ view_model/       <name>_cubit.dart  (Loading / Loaded / Error)
└─ view/             section.dart  +  widgets/...
```

## Switching factory ↔ real API

Toggle the single flag in `lib/core/constants/api_endpoints.dart`:

```dart
const bool kUseFactoryData = true;   // factory demo data (default)
// const bool kUseFactoryData = false; // hit ApiEndpoints.baseUrl via Dio
```

Then update `ApiEndpoints.baseUrl` to your backend.

## Run

```sh
flutter pub get
flutter gen-l10n
flutter run -d chrome      # web (recommended for portfolio preview)
flutter run -d windows     # desktop
flutter run                # whatever device is attached
```

## Test

```sh
flutter test
flutter analyze
```

## Avatar

Drop the cartoon portrait at `assets/images/avatar.png`. A serif "A"
placeholder is rendered automatically until the asset is added.
