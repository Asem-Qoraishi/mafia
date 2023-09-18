import 'package:mafia/constants/godfather.dart';

class PlayerModel {
  late String? name;
  late Side side;
  late String role;
  late String imagePath;
  PlayerModel({this.name, required this.side, required this.role, required this.imagePath});
}
