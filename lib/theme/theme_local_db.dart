import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('theme.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE theme (
      id INTEGER PRIMARY KEY,
      themeName INTEGER NOT NULL
    )
    ''');
  }

  Future<int> saveTheme(int themeName) async {
    final db = await instance.database;

    await db.delete('theme'); // Clear existing data
    return await db.insert('theme', {'themeName': themeName});
  }

  Future<int?> loadTheme() async {
    final db = await instance.database;
    final maps = await db.query('theme');

    if (maps.isNotEmpty) {
      return maps.first['themeName'] as int?;
    } else {
      return null;
    }
  }
}
