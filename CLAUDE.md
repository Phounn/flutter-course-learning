# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

`course_learning` is a Flutter app (a learning/coursework project) where a user logs in, browses a grid of courses, opens course details, and "applies" to courses. UI strings are written in **Lao**. Target dev platform is Windows.

## Commands

```powershell
flutter pub get        # install dependencies
flutter run            # run the app (pick a device when prompted)
flutter analyze        # static analysis / lint — keep this at zero issues
flutter test           # run all tests
flutter test test/widget_test.dart   # run a single test file
dart format .          # format
```

Note: `test/widget_test.dart` is the default Flutter counter test and does **not** match this app (which has no counter). It will fail if run as-is; update or replace it before relying on `flutter test`.

## Architecture

The codebase loosely follows an **MVC** layout but currently has only two of the intended layers:

- `lib/models/` — plain data classes (`CourseModel`, `LoginModel`). No Flutter imports.
- `lib/views/` — all screens and widgets (the UI + interaction logic live here).
- `lib/main.dart` — `MyApp` → `MaterialApp`, `home: LoginPage`.

Screen flow (all navigation is imperative `Navigator.push`/`pop` — there are **no named routes**):

```
LoginPage ──push──> CoursePage ──push──> CourseDetailPage
                        │
                        └──drawer──> SettingsPage
```

### Things that are non-obvious and easy to break

- **State "persistence" is a deliberate static-list trick.** `CourseList.listCourse` (in `lib/models/course.dart`) is a `static` list of `CourseModel`, and `CourseModel.isApplied` is intentionally **mutable** (non-`final`). Applying a course in `CourseDetailPage` mutates the shared model in place; `CoursePage._openDetail` awaits the push and then calls `setState(() {})` to re-render the "Applied" badge. There is no database or external store — state lives only in this in-memory static list and resets on app restart. Do not make `isApplied` final or copy the list, or this breaks.
- **Auth is hardcoded.** `LoginPage._login` checks `username == "Himmel" && password == "1234"` directly. `LoginModel` exists but is **not** wired into the login flow. The displayed user name "Himmel" is also hardcoded in the drawer header and settings page.
- **Logout is a double `pop`.** The drawer's logout does `Navigator.pop` (close drawer) then `Navigator.pop` (back to `LoginPage`) — it relies on the navigation stack depth, not an explicit route.
- **Settings toggles are local-only.** `_notifications` and `_darkMode` in `SettingsPage` are `setState` booleans not connected to anything (dark mode does not affect the theme).

### Intended-but-not-yet-built

`docs/mvc_and_sqlite.md` describes a fuller architecture with `controllers/`, `services/`, `ChangeNotifier`, and **SQLite persistence** (`sqflite` on mobile, `sqflite_common_ffi` on Windows). **None of that exists yet** — there are no controllers, no services, and no database dependency in `pubspec.yaml`. Treat that doc as a roadmap, not a description of the current code, when adding persistence.

## Conventions

- New user-facing text should be in **Lao** to match existing strings.
- Keep `flutter analyze` clean — prior work has verified zero issues.
- Theme seed color is `Color.fromARGB(255, 58, 133, 183)` (`0xFF3A85B7`); the gradient accent is `0xFF6FB1DC`.
