import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject{
  @HiveField(0)
  late String firstName;
  @HiveField(1)
  late String lastName;
  @HiveField(2)
  late String emailAddress;
  @HiveField(3)
  late String userID;
  @HiveField(4)
  late String district;
  @HiveField(5)
  late String phoneNo;
  @HiveField(6)
  late String pincode;
  @HiveField(7)
  late String country;
}
