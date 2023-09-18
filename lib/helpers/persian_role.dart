String toPersian(String role) {
  Map<String, String> roles = {
    'citizen': 'شهروند',
    'citizen_kane': 'همشهری کین',
    'leon': 'حرفه یی',
    'constantine': 'فرشته نجات',
    'doctor_watson': 'داکتر شهر',
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
