// required package imports
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'package:clean_architecture/core/database/dao/person_dao.dart';
import 'package:clean_architecture/core/database/entity/person.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Person])
abstract class AppDb extends FloorDatabase {
  PersonDao get personDao;

  static Future<AppDb> init() async {
    AppDb instance = await $FloorAppDb.databaseBuilder("db_name").build();
    return instance;
  }
}
