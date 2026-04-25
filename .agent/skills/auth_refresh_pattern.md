# Auth Refresh Pattern (Skill)

This pattern ensures that the application handles token expiration gracefully without interrupting the user session.

## Implementation Details (Dio Interceptor)

- **Trigger**: Any API response with status code `401 Unauthorized`.
- **Logic**:
  1. Check if a refresh is already in progress (`_isRefreshing` flag).
  2. If yes, queue the current request.
  3. If no, trigger `POST /auth/refresh` with the stored `refresh_token`.
  4. On Success:
     - Save new `access_token` and `refresh_token`.
     - Retry the failed request with the new token.
     - Retry all queued requests.
  5. On Failure:
     - Clear tokens.
     - Logout the user via `authLogoutController`.

## Best Practices
- Always use `No-Retry` header for the refresh request itself to prevent infinite loops.
- Use a thread-safe-like approach (queue) for concurrent requests during refresh.
- Ensure `SecureStorage` is used for persistence.

## File Reference
- `lib/core/network/jwt_interceptor.dart`
- `lib/core/storage/secure_storage.dart`
- `lib/core/events/auth_events.dart`
