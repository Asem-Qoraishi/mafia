enum GameType {
  GODFATHER,
  MAFIA,
  ZODIAC,
}

String aboutGameText(GameType gameType) {
  switch (gameType) {
    case GameType.GODFATHER:
      return _aboutGodFather;
    case GameType.MAFIA:
      return _aboutMafiaGame;
    case GameType.ZODIAC:
      return _aboutZodiacGame;
  }
}

String titleText(GameType gameType) {
  switch (gameType) {
    case GameType.GODFATHER:
      return 'بازی پدر خواند';
    case GameType.MAFIA:
      return 'بازی مافیا ';
    case GameType.ZODIAC:
      return 'بازی زودیاک';
  }
}

// Godfather roles descriptions
String _aboutGodFather =
    'سناریو های بازی مافیا عموما باهم در قوانین مشترک هستند. در سناریو های مافیا بازی شامل دوفاز شب و روز است\nدر فاز شب، بازیکنان نقش دار، از توانایی خود استفاده میکنند و در فاز روز، بدون اطلاق به نقش خود، بایکدیگر در نوبت خودشان صحبت میکنند.\nتیم شهروند که اکثریت نا آگاه هستند (یعنی شهروندان یکدیگر را نمی شناسند)، باید سعی کنند تیم مافیا را تشخیص داده و با رای گیری از بازی خارج کنند.\n در برخی سناریو های بازی مافیا مثل سناریو پدر خوانده یک نقش مستقل هم در بازی وجود دارد.\nروز معارفه : در روز اول که آن را روز معارفه مینامند، تیم مافیا یکدیگر را نمی شناسند. اما تمام بازیکنان نقش های خود را میدانند.\nهر بازیکن نیم دقیقه وقت دارد که خود را معرفی کند. در نوبت معارفه بازیکنان نمیتوانند به یکدیگر چالش یا چلنح بدهند. روز معارفه رای گیری ندارد.\nشب معارفه : در انتهای روز معارفه شب میشود و تیم مافیا یکدیگر را میشناسند. نقش نستراداموس فقط در شب معارفه بیدار میشود.\nفاز روز : در  فاز روز بازیکنان در نوبت خود صحبت میکنند. در نوبت خود میتوانند به یک بازیکن نیز چالش دهند.\nچالش به این معناست که بازیکنی که انتخاب شده میتواند خارج از نوبت خود نیز صحبت کند.\nدر فاز روز شهروندان سعی میکنند مستقل و مافیا را پیدا کنند و بازکنان مافیا سعی میکنند بازیکنان شهروند را گمراه کنند.\nشهروند ها میتوانند بازیکنان مشکوک را با اکثریت رای بیرون کنند.\nرای گیری : رای گیری در سناریو پدرخوانده شامل دو مرحله است. مرحله رای گیری برای آمدن به دفاعیه و مرحله رای گیری برای خارج کردن بازیکن از بازی\nفورمول حداقل رای برای وارد شدن بازیکنان به دفاعیه به این شرح است: نصف بازیکنان منهای یک.\nاگر در مرحله اول رای گیری تنها یک نفر وارد دفاعیه شده باشد. پس از دفاعیه 40 ثانیه ای به مرحله دوم میرسد. اگر در مرحله دوم همان فورمول فوق اجرا شد، بازیکن از بازی خارج میشود.\nاگر بیشتر از یک بازیکن در دفاع باشد هر بازیکنی که بیشترین اندازه رای را آورده باشد از بازی خارج میشود.\nدر پایان رای گیری، بازیکنی که بیشترین رای را آورده یکی از کارت های حرکت آخر را به صورت تصادفی انتخاب میکند.\nنقش های بازی پدر خوانده به ترتیب ذیل بیدار میشوند.\n1-نوستراداموس(فقط در شب معارفه بیدار میشود).\n2-اعضای تیم مافیا\n3-دکتر واتسون\n4-لـئون یا حرفه یی\n5-همشهری کین\n6-کنستانتین (فرشته نجات)';
Map<String, String> godfatherRolesDescriptions = {
  'godfather':
      'پدرخوانده عضو مهم و اصلی مافیاست و شهروندان با شلیک او از بازی خارج می شوند.\nهمچنین او یک جلیقه به تن دارد که اگر تیر بخورد با تیر اول بیرون نمی رود. علاوه بر این، پدرخوانده  یک توانایی به نام حس ششم دارد که اَکت (نمایش) آن، نشان دادن سر با انگشت های اشاره است.\n حس ششم یعنی یکی از بازیکنان را به راوی نشان میدهد و نقش دقیقش را حدس میزند، اگر درست حدس بزند صبح روز بعد بازیکن مورد نظر از بازی خارج می‏شود.به عبارت دیگر حتی اگر جلیقه یا هر چیز دیگری داشته باشد، به نوعی سلاخی می‏شود.',
  'saul_goodman':
      'زمانی که یکی از هم تیمی های گودمن از بازی خارج شد، این امکان را دارد که یکی از شهروندان را خریداری کند.\n خریداری زمانی موفق است که آن شهروند، نقش "شهروند ساده" را دارا می باشد در غیر آن خریداری ناموفق می‏باشد.\nاگر خریداری موفق باشد، شهر خریداری شده آن شب و شب های دیگر با مافیا بیدار می‏شود.',
  'matador':
      'نقش ماتادور در پدر خوانده از جذابیت‏های این بازی است؛ ماتادور این امکان را دارد که هرشب یکی از بازیکنان را نشان کند، تا توانایی آن شخص را در آن شب از آن بگیرد.\nشخصی که قابلیتش توسط ماتادور گرفته شده است، با ضربدر نمودن دست ها توسط راوی، متوجه می‏شود که امشب قابلیت یا توانایی اش گرفته شده است.\nماتادور نمی تواند دو شب پشت سرهم یک بازیکن را مورد هدف قرار دهد، ولی با وقفه یک شبه می تواند بازیکن تکراری انتخاب کند.\n',
  'leon':
      'لئون شهروند بوده، در اسلحه خود فقط دو تیر دارد، یعنی فقط دوبار می تواند از قابلیت خود استفاده کند.\nاگر به سمت مافیا شلیک کند مافیا بیرون میرود، اما اگر اسلحه خود را به سمت شهروند نشان بگیرد خودش بیرون می‏رود.\nلئون مثل پدرخوانده جلیقه دارد و به شلیک اول مافیا از بین نمی‏رود.',
  'doctor_watson':
      'نقش دکتر واتسون میتواند هر شب یکی را در مقابل شلیک تیم مافیا نجات دهد.\nدکتر واتسون، خود را فقط یک بار، اما بقیه را هر چند بار که بخواهد می تواند نجات دهد.',
  'citizen_kane':
      'همشهری کین با نشان دادن یکی از بازیکنان در شب به راوی، می‏تواند استعلام یکی از بازی کنان را بگیرد.\n اگر آن بازیکن مافیا باشد، راوی در روز به همه اعلام میکند که فلان بازیکن (بازیکنی که استعلامش گرفته شده) مافیا می‏باشد و شب آن روز همشهری کین با شات راوی از بازی بیرون می‏شود.\nاما اگر استعلام یک شهروند را بگیرد هیچ اتفاقی در روز نمی افتد، و همشهری کین نیز در بازی می‏ماند.\n',
  'constantine':
      'این شخص در طول بازی می‏تواند یک نفر را احضار روح کند، یعنی بازیکن مرده را به بازی برگرداند، به شرطیکه آن بازیکن نقش‏اش افشا نشده باشد و یا اینکه توسط پدرخوانده سلاخی نشده باشند.\nکنستانتین می‏تواند شهروند یا حتی مافیا را به بازی برگرداند.',
  'citizen':
      'شهروند ساده در شب کاری را از پیش برده نمی توانند، اما باید در روز تمام تلاشش را بکند تا مافیا ها را درست تشخیص داده و در تصمیم گیری درست به شهر کمک کند.\nیک شهروند ساده نباید طوری بازی کند که مافیا ها نقشش را حدس بزنند، چون امکان خریداری  و سلاخی آن توسط مافیا وجود دارد.\n',
  'jack_sparrow':
      'در فصل دو پدرخوانده نقش مستقل دیگه با سایدها بازی نمیکنه و کاملا به صورت مستقل و تنها باید برنده بازی بشه.\nجک اسپارو هر شب یک نفر رو به عنوان طلسم خودش انتخاب میکنه. در صورتی که در ۲۴ ساعت بعدی، طلسم از بازی خارج بشه، جک اسپارو هم همراهش خارج میشه.\nجک در شب و روز زره داره و به هیچ وجه خارج نمیشه. یعنی اگه توی شب توسط مافیا یا لئون شات بشه، توی بازی میمونه. اگر هم توی روز اجماع بشه، گرداننده اعلام میکنه که این فرد جک هست و در بازی باقی میمونه.\n\nچطور جک اسپارو از بازی خارج میشه؟\nجک به سه روش از بازی خارج میشه:\n•	طلسم جک تو شب یا روز از بازی خارج بشه.\n•	 قبل از اینکه جک توی روز اجماع بشه و برای همه مشخص بشه که جک چه کسی هست، پدرخوانده میتونه با سلاخی جک رو از بازی خارج کنه.\n•	توسط کارت ذهن زیبا\n\nتغییرات کارت ذهن زیبا\nتوی فصل جدید دیگه نوستراداموس توی بازی نیست و کارت ذهن زیبا به نقش جک اسپارو مرتبط هست. فردی که از بازی خارج میشه، باید حدس بزنه که جک اسپارو چه کسی هست. اگر هم جک نقشش توی روز مشخص شده باشه، وقتی کارت حرکت آخر ذهن زیبا میاد، بازیکن باید طلسم جک رو انتخاب کنه.\n',
  'nostradamus':
      'نقش مستقل بازی بوده که توسط راوی در شب معارفه بیدار می‏شود و سه نفر را به راوی نشان می دهد،راوی تعداد مافیاهایی که در بین آن سه نفر وجود دارد را به او نشان می دهد و او خود انتخاب می‏کند که در ساید (کنار) مافیا بازی کند یا شهروند. اما اگر از بین آن سه، دو مافیا در بیاید نوستراداموس ناچار است تا با مافیا بازی کند، زیرا او دو مافیا را تشخیص داده است.\n•	نوستراداموس هیچ وقت با شات شب (مافیا یا لئون) از بازی بیرون نمی‏رود.\n•	استعلام این بازیکن همیشه منفی می‏باشد(چه در ساید مافیا باشد چه شهر).',
};

// Mafia roles descriptions
String _aboutMafiaGame = '';

// Zodiac roles descriptions
String _aboutZodiacGame = '';