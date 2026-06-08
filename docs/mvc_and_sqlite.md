# MVC Pattern & SQLite Notes — course_learning

A reference for structuring this Flutter app with the MVC pattern and understanding where the SQLite database file lives.

---

## 1. MVC Pattern for Flutter

> **Note:** Pure MVC isn't the most common Flutter pattern — Flutter leans toward MVVM-style patterns (Provider, Riverpod, BLoC) because widgets and state are tightly coupled. But MVC is a great way to learn separation of concerns, and it maps cleanly onto a course-learning app.

### Folder structure

```
lib/
├── main.dart
├── models/              # MODEL — data + business rules
│   ├── user.dart
│   └── course.dart
├── views/               # VIEW — widgets/screens (UI only)
│   ├── login_page.dart
│   └── course_list_page.dart
├── controllers/         # CONTROLLER — glue between view & model
│   ├── auth_controller.dart
│   └── course_controller.dart
└── services/            # data access (DB, API) — used by controllers
    └── database_service.dart
```

### The roles

| Layer | Responsibility | Example |
|-------|---------------|---------|
| **Model** | Plain data classes + business logic. No Flutter imports. | `User { id, name, email }` with `toMap()` / `fromMap()` for SQLite |
| **View** | Widgets only. Displays data, forwards user actions to the controller. No DB/logic. | `LoginPage` calls `authController.login(...)` |
| **Controller** | Handles input, talks to services, updates state, tells view to rebuild. | `AuthController.login()` validates + queries DB |

### Example — tying it together

**Model:**

```dart
// models/user.dart
class User {
  final int? id;
  final String name;
  final String email;
  User({this.id, required this.name, required this.email});

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'email': email};
  factory User.fromMap(Map<String, dynamic> m) =>
      User(id: m['id'], name: m['name'], email: m['email']);
}
```

**Controller:**

```dart
// controllers/auth_controller.dart
class AuthController extends ChangeNotifier {
  final DatabaseService _db;
  User? currentUser;
  AuthController(this._db);

  Future<bool> login(String email, String password) async {
    final user = await _db.findUser(email, password);
    currentUser = user;
    notifyListeners();          // tells the View to rebuild
    return user != null;
  }
}
```

The View listens to the controller (e.g. via `ChangeNotifierProvider` from the `provider` package) and rebuilds when `notifyListeners()` fires. That `ChangeNotifier` + `notifyListeners` glue is the realistic Flutter way to make MVC work — otherwise you'd be stuck calling `setState` everywhere.

---

## 2. Where does the SQLite file live?

This depends on **which package** you use and **which platform** you run on.

- **Mobile:** use [`sqflite`](https://pub.dev/packages/sqflite)
- **Desktop / Windows:** use [`sqflite_common_ffi`](https://pub.dev/packages/sqflite_common_ffi)

You never pick an absolute path yourself; you ask the OS for the app's private directory via `getDatabasesPath()` (or `path_provider`):

```dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final dbPath = await getDatabasesPath();      // OS-provided app dir
final path = join(dbPath, 'course_learning.db');
final db = await openDatabase(path, version: 1, onCreate: ...);
```

### Actual locations per platform

| Platform | Where the `.db` file ends up |
|----------|------------------------------|
| **Android** | `/data/data/com.example.course_learning/databases/course_learning.db` (private, sandboxed — not visible without root) |
| **iOS** | App sandbox: `.../Library/Application Support/` or the documents dir |
| **Windows** (sqflite_common_ffi) | `C:\Users\<you>\AppData\Roaming\com.example\course_learning\` (or wherever `getApplicationSupportDirectory()` points) |
| **Web** | ⚠️ No real file — `sqflite` doesn't support web. Use `sqflite_common_ffi_web`, which stores data in the browser's **IndexedDB**, not a file on disk |

### Key takeaways

- **You don't choose the folder** — you ask the OS for the app's private directory and join your filename to it. This keeps the DB sandboxed and survives app restarts (but gets deleted on uninstall).
- On **Windows** (likely your dev target), add `sqflite_common_ffi` and init with `databaseFactory = databaseFactoryFfi;` — plain `sqflite` is Android/iOS only.
- To **inspect** the file during development, print the full `path` to the console and open it with a tool like [DB Browser for SQLite](https://sqlitebrowser.org/).

### Windows setup snippet

```dart
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Initialize FFI for desktop (Windows/Linux/macOS)
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}
```
