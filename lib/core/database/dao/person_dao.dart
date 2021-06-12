import 'package:clean_architecture/core/database/entity/person.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id is not null and id = :id')
  Future<Person?> findPersonById(int id);

  @insert
  Future<void> insertPerson(Person person);
}