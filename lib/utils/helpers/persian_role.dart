String toPersian(String role) {
  Map<String, String> roles = {
    'citizen': 'شهروند ساده',
    'citizen_kane': 'همشهری کین',
    'leon': 'حرفه یی',
    'constantine': 'کنستانتین',
    'doctor_watson': 'داکتر واتسون',
    'nostradamus': 'نوستراداموس',
    'jack_sparrow': 'جک اسپارو',
    'godfather': 'پدرخوانده',
    'matador': 'ماتادور',
    'saul_goodman': 'ساول گودمن',
  };
  String? persinaRole = roles[role];
  // if (persinaRole == null) {
  //   return 'wrong role';
  // }
  return persinaRole!;
}



// String aboutRole() {
//   return 
// }