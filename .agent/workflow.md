# Standard Task Workflow for MangaK

Follow these steps for every new feature or bug fix:

## Phase 1: Planning
1. **Analyze Requirements**: Understand the task goal.
2. **Draft Plan**: Create an `implementation_plan.md` artifact.
3. **Review Architecture**: Ensure the plan follows the Data/Domain/Presentation pattern.

## Phase 2: Preparation
1. **Models**: Define needed Data Models in `data/models/`.
2. **Repository**: Define interface in `domain/repositories/` and implement in `data/repositories/`.
3. **Code Gen**: Run `flutter pub run build_runner build` to generate serialization code.

## Phase 3: Implementation
1. **State**: Create Riverpod providers in `presentation/providers/`.
2. **UI**: Build Widgets and Screens in `presentation/widgets/` and `presentation/screens/`.
3. **Router**: Update `app_router.dart` if new pages were added.

## Phase 4: Quality Check
1. **Analyze**: Run `flutter analyze` and fix all warnings/errors.
2. **Build**: Run `flutter build web` or `flutter build apk` to ensure compilation success.
3. **Theme**: Verify the UI looks good in both Dark and Light modes.

## Phase 5: Delivery
1. **Summarize**: Provide a concise summary of changes.
2. **Artifacts**: Link to updated README or relevant documentation.
