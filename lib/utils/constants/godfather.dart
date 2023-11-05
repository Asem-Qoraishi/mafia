import 'package:mafia/Models/last_card.model.dart';
import 'package:mafia/Models/player.model.dart';
import 'package:mafia/utils/constants/texts.dart';

enum Side {
  mafia,
  citizin,
  independent,
}

class GodfatherConstants {
  static final _roles = {
    Side.mafia: ['godfather', 'matador', 'saul_goodman'],
    Side.citizin: ['leon', 'citizen_kane', 'doctor_watson', 'constantine', 'citizen'],
    Side.independent: ['jack_sparrow', 'nostradamus'],
  };

  static List<PlayerModel> get players {
    List<PlayerModel> players = [];
    var rolesImagePath = 'assets/role_images';

    for (var role in _roles[Side.mafia]!) {
      var player = PlayerModel(
          side: Side.mafia,
          role: role,
          imagePath: '$rolesImagePath/$role.png',
          description: godfatherRolesDescriptions[role] ?? 'این نقش معرفی نشده است');

      players.add(player);
    }

    for (var role in _roles[Side.citizin]!) {
      var player = PlayerModel(
          side: Side.citizin,
          role: role,
          imagePath: '$rolesImagePath/$role.png',
          description: godfatherRolesDescriptions[role] ?? 'این نقش معرفی نشده است');

      players.add(player);
    }

    for (var role in _roles[Side.independent]!) {
      var player = PlayerModel(
          side: Side.independent,
          role: role,
          imagePath: '$rolesImagePath/$role.png',
          description: godfatherRolesDescriptions[role] ?? 'این نقش معرفی نشده است');
      players.add(player);
    }
    return players;
  }

  static List<LastCard> get lastCards {
    List<LastCard> lastCards = [
      LastCard(name: 'Lamb\'s Silence', isUsed: false, imagePath: 'assets/lastcard_images/lambs_silence.png'),
      LastCard(name: 'A Beautiful Mind', isUsed: false, imagePath: 'assets/lastcard_images/beautiful_mind.png'),
      LastCard(
          name: 'Disclosure Of Identity',
          isUsed: false,
          imagePath: 'assets/lastcard_images/disclosure_of_identity.png'),
      LastCard(name: 'Face Off', isUsed: false, imagePath: 'assets/lastcard_images/face_off.png'),
      LastCard(name: 'Handcuff', isUsed: false, imagePath: 'assets/lastcard_images/handcuff.png'),
    ];
    return lastCards;
  }
}
