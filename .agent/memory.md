# Project Memory (Social Network / MangaK)

## Current Status
- **Phase**: Core Infrastructure & Auth stabilized.
- **Tech Stack**: Flutter, Riverpod, Dio, GoRouter, SecureStorage.
- **Backend**: https://mangak.io.vn/api/v2 (Auth & Stories endpoints).

## Key Architecture
- **Feature-driven Clean Architecture**: `lib/features/[feature_name]/[data|domain|presentation]`.
- **Global Services**: `lib/core/network`, `lib/core/storage`, `lib/core/theme`.

## Recent Milestones
1. **Token Refresh Implementation**: robust 401 handling with concurrency queuing in `JwtInterceptor`.
2. **Auth Flow**: `SecureStorage` for tokens, `StreamController` for logout events.
3. **Manga UI**: `MangaCard` widget implemented for home screen.

## Crucial Constraints
- **Access Token**: Expires in 1 hour.
- **Refresh Token**: Expires in 30 days.
- **Endpoints**: Skip auth header for login, register, and refresh.
- **Concurrency**: Use `No-Retry` header for refresh calls.

## Technical Debt / Next Steps
- Implement real-time notifications with Pusher (constants defined but not fully integrated).
- Add error handling for network timeouts in UI.
- Standardize Model serialization (ensure `build_runner` is used).
