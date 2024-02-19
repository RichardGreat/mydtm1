import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {

  @HiveField(0)
  dynamic token;
}