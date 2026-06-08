# Widgets & Functions Inventory — course_learning

A reference of every Flutter widget, function/API, and helper used in this project.

- **Part 1 — Per File:** grouped by each `.dart` file (with duplicates across files kept).
- **Part 2 — Combined (Mixed):** one de-duplicated master list for the whole `lib/`.

---

# Part 1 — Per File (Not Mixed)

## `lib/main.dart`

| Type | Items |
|---|---|
| Widgets | `MaterialApp`, `StatelessWidget` |
| Functions/APIs | `runApp()`, `ThemeData`, `ColorScheme.fromSeed`, `Color.fromARGB` |

## `lib/views/login_page.dart`

| Type | Items |
|---|---|
| Widgets | `StatefulWidget`, `Scaffold`, `AppBar`, `Padding`, `Form`, `Column`, `Icon`, `SizedBox`, `TextFormField`, `InputDecoration`, `OutlineInputBorder`, `ElevatedButton`, `Text`, `SnackBar` |
| Functions/APIs | `GlobalKey<FormState>`, `TextEditingController`, `validator:`, `_formKey.currentState!.validate()`, `Navigator.push()`, `MaterialPageRoute`, `ScaffoldMessenger.of()`, `showSnackBar()`, `clearSnackBars()`, `dispose()`, `Theme.of()` |

## `lib/views/courses_page.dart`

| Type | Items |
|---|---|
| Widgets | `StatefulWidget`, `StatelessWidget`, `Scaffold`, `AppBar`, `Drawer`, `ListView`, `Container`, `CircleAvatar`, `Icon`, `ListTile`, `Divider`, `Column`, `Padding`, `Text`, `Expanded`, `Center`, `GridView.builder`, `Card`, `Stack`, `GestureDetector`, `ClipRRect`, `Image.network`, `SizedBox` |
| Functions/APIs | `setState()`, `Navigator.push()`, `Navigator.pop()`, `MaterialPageRoute`, `BoxDecoration`, `LinearGradient`, `SliverGridDelegateWithFixedCrossAxisCount`, `BorderRadius`, `errorBuilder:`, `itemBuilder:`, `Theme.of()`, `Future<void>` (async/await) |

## `lib/views/course_detail_page.dart`

| Type | Items |
|---|---|
| Widgets | `StatefulWidget`, `Scaffold`, `AppBar`, `IconButton`, `Icon`, `SingleChildScrollView`, `Column`, `Row`, `SizedBox`, `Image.network`, `Padding`, `Text`, `ElevatedButton.icon`, `SnackBar` |
| Functions/APIs | `setState()`, `Navigator.pop()`, `ElevatedButton.styleFrom`, `RoundedRectangleBorder`, `BorderRadius.circular`, `ScaffoldMessenger.of()`, `showSnackBar()`, `widget.course` (State→Widget access), `errorBuilder:` |

## `lib/views/settings_page.dart`

| Type | Items |
|---|---|
| Widgets | `StatefulWidget`, `Scaffold`, `AppBar`, `ListView`, `Container`, `Row`, `Column`, `CircleAvatar`, `Icon`, `Text`, `SizedBox`, `SwitchListTile` |
| Functions/APIs | `setState()`, `BoxDecoration`, `LinearGradient`, `BorderRadius.circular`, `Theme.of()`, `onChanged:` |

## `lib/models/course.dart` — *pure Dart, no widgets*

| Type | Items |
|---|---|
| Classes | `CourseModel` (data class), `CourseList` |
| Functions/APIs | `static List<CourseModel>`, named constructor with `required` params, mutable `bool isApplied` |

## `lib/models/auth.dart` — *pure Dart, no widgets*

| Type | Items |
|---|---|
| Classes | `LoginModel` (data class) |
| Functions/APIs | constructor with `required` params (⚠️ defined but **not used** anywhere yet) |

---

# Part 2 — Combined / Mixed (De-duplicated)

Every item appears once, even if used in multiple files.

## Widgets (unique)

`MaterialApp` · `StatelessWidget` · `StatefulWidget` · `Scaffold` · `AppBar` · `Drawer` · `Padding` · `Form` · `Column` · `Row` · `Stack` · `Container` · `Center` · `Expanded` · `SizedBox` · `Icon` · `IconButton` · `CircleAvatar` · `Text` · `TextFormField` · `InputDecoration` · `OutlineInputBorder` · `ElevatedButton` · `ElevatedButton.icon` · `ListView` · `ListTile` · `Divider` · `GridView.builder` · `Card` · `GestureDetector` · `ClipRRect` · `Image.network` · `SingleChildScrollView` · `SwitchListTile` · `SnackBar`

## Functions / APIs (unique)

`runApp()` · `setState()` · `Navigator.push()` · `Navigator.pop()` · `MaterialPageRoute` · `dispose()` · `Theme.of()` · `ThemeData` · `ColorScheme.fromSeed` · `Color.fromARGB` · `GlobalKey<FormState>` · `TextEditingController` · `validator:` · `_formKey.currentState!.validate()` · `onChanged:` · `onTap:` · `onPressed:` · `itemBuilder:` · `errorBuilder:` · `ScaffoldMessenger.of()` · `showSnackBar()` · `clearSnackBars()` · `BoxDecoration` · `LinearGradient` · `BorderRadius.circular` · `BorderRadius.vertical` · `RoundedRectangleBorder` · `ElevatedButton.styleFrom` · `SliverGridDelegateWithFixedCrossAxisCount` · `Future<void>` (async/await) · `widget.` (State→Widget access)

## Styling / value helpers (unique)

`TextStyle` · `EdgeInsets.all` · `EdgeInsets.fromLTRB` · `EdgeInsets.symmetric` · `EdgeInsets.zero` · `Alignment` · `MainAxisAlignment` · `CrossAxisAlignment` · `TextAlign` · `TextOverflow.ellipsis` · `BoxFit.cover` · `FontWeight.bold` · `Colors` · `Duration`

## Your own classes / methods (unique)

`MyApp` · `LoginPage` · `CoursePage` · `CourseCard` · `CourseDetailPage` · `SettingsPage` · `CourseModel` · `CourseList` · `LoginModel` · `_login()` · `_openDetail()`
