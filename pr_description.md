# 🧪 Add tests for LoginScreen Auth Mode Toggle State

🎯 **What:** Addressed the testing gap regarding the state change of the Auth Mode toggle on the `LoginScreen`. Previously, tapping the button to switch between Login and Register modes was untested.

📊 **Coverage:**
- Initial state verification (Login Mode: 'Se connecter' and 'Pas encore de compte ? Créer un compte').
- Toggling to Register Mode ('Créer un compte' and 'Déjà un compte ? Se connecter') via TextButton tap.
- Toggling back to Login Mode on subsequent taps.
- Extracted `Theme.of(context)` into a local variable within `build` as per performance directives.
- Updated deprecated `background` property to `surface` in `lib/main.dart` and addressed a duplicate named argument that was uncovered by `flutter analyze`.

✨ **Result:** Enhanced test coverage for user-facing interactions on the authentication screen, improving reliability and confidence to prevent regressions during future refactoring. All tests pass with no network dependencies via `flutter test --no-pub`.
