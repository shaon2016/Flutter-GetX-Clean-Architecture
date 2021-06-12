import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

@entity
class Person {
  // @PrimaryKey(autoGenerate: true)
  @PrimaryKey()
  final int id ;

  final String name ;

  Person({required this.id, required this.name});
}
