# MangaK Flutter Development Skill

This skill guide outlines the standards and patterns for the MangaK Flutter project.

## Core Patterns

### 1. Clean Architecture (Feature-based)
- **Data Layer**: Models (Freezed/JSON), Repositories Implementation.
- **Domain Layer**: Entities, Repository Interfaces, Usecases.
- **Presentation Layer**: Screens, Widgets, Providers (Riverpod).

### 2. State Management (Riverpod)
- Prefer `FutureProvider` or `StreamProvider` for data fetching.
- Use `StateNotifierProvider` or `NotifierProvider` for complex UI states (e.g., Auth).
- Always use `HooksConsumerWidget` when using hooks like `useTextEditingController`.

### 3. Networking (Dio)
- Use the `dioProvider` to get a configured Dio instance.
- JWT tokens are handled automatically via `JwtInterceptor`.
- Handle error codes globally or via `try-catch` in repositories.

### 4. Navigation (GoRouter)
- Define all routes in `lib/router/app_router.dart`.
- Use `context.push()` for sub-pages and `context.go()` for main tab switching.
- Auth redirection is centralized in the GoRouter configuration.

## Coding Standards
- **Linting**: Always run `flutter analyze` before committing.
- **Code Generation**: Use `flutter pub run build_runner build --delete-conflicting-outputs` for Freezed/JSON models.
- **Naming**: Use camelCase for variables/functions and PascalCase for classes.
- **Widgets**: Split large widgets into smaller, reusable components in `lib/core/widgets` or feature-specific `widgets/` folder.
