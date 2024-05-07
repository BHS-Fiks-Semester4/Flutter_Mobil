import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mobile/Model/LoginRespon.dart';

class DatabaseHelper {
  static Future<Database> initializeDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'akhwat_computer2.db'), // Perbaiki nama database
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, address TEXT, username TEXT, phoneNumber TEXT, religion TEXT, birthDate TEXT)",
        );
      },
      version: 1,
    );
  }

  static Future<int> insertUser(LoginResponse loginResponse) async {
    final Database db = await initializeDatabase();
    return await db.insert('users', loginResponse.toMap());
  }

  static Future<List<LoginResponse>> getUsers() async {
    final Database db = await initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return LoginResponse(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        address: maps[i]['address'],
        username: maps[i]['username'],
        phoneNumber: maps[i]['phoneNumber'],
        religion: maps[i]['religion'],
        birthDate: DateTime.parse(maps[i]['birthDate']),
      );
    });
  }
}
