# MangaK Workflow (Concise)

## 1. Prepare (Data & Domain)
- **Define Models**: `lib/features/*/data/models/`.
- **Repo Contract**: `lib/features/*/domain/repositories/`.
- **Code Gen**: `flutter pub run build_runner build --delete-conflicting-outputs`.

## 2. Build (Presentation & Logic)
- **State**: Riverpod providers in `lib/features/*/presentation/providers/`.
- **UI**: Components & Screens in `lib/features/*/presentation/`.
- **Routing**: Register in `lib/router/app_router.dart`.

## 3. Verify (Quality)
- **Analyze**: `flutter analyze`.
- **Test**: Ensure 401 handling works (if networking is involved).
- **Theme**: Check Dark/Light mode compatibility.
