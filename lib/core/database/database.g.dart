// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder databaseBuilder(String name) => _$AppDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder inMemoryDatabaseBuilder() => _$AppDbBuilder(null);
}

class _$AppDbBuilder {
  _$AppDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDb extends AppDb {
  _$AppDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PersonDao? _personDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Person` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'Person',
            (Person item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Person> _personInsertionAdapter;

  @override
  Future<List<Person>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, Object?> row) =>
            Person(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<Person?> findPersonById(int id) async {
    return _queryAdapter.query(
        'SELECT * FROM Person WHERE id is not null and id = ?1',
        mapper: (Map<String, Object?> row) =>
            Person(id: row['id'] as int, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertPerson(Person person) async {
    await _personInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }
}
