import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

int calcBMI(int gender, int age, double? height, double? weight) {
  if (height == null || weight == null) {
    return 0;
  }
  double bmi = weight / (height / 100.0) / (height / 100.0);
  bmi = (bmi * 10).round() * 0.1; // precision set to 1
  if (gender == 0) {
    if (bmi >= 28) return 60;
    if (bmi <= 17.8) return 80;
    if (bmi >= 24) return 80;
    return 100;
  } else {
    if (bmi >= 28) return 60;
    if (bmi <= 17.1) return 80;
    if (bmi >= 24) return 80;
    return 100;
  }
}

var maleBreathDict = [
  {
    10: 2300,
    20: 2460,
    30: 2620,
    40: 2780,
    50: 2940,
    60: 3100,
    62: 3220,
    64: 3340,
    66: 3460,
    68: 3580,
    70: 3700,
    72: 3820,
    74: 3940,
    76: 4060,
    78: 4180,
    80: 4300,
    85: 4550,
    90: 4800,
    95: 4920,
    100: 5040
  },
  {
    10: 2350,
    20: 2520,
    30: 2690,
    40: 2860,
    50: 3030,
    60: 3200,
    62: 3320,
    64: 3440,
    66: 3560,
    68: 3680,
    70: 3800,
    72: 3920,
    74: 4040,
    76: 4160,
    78: 4280,
    80: 4400,
    85: 4650,
    90: 4900,
    95: 5020,
    100: 5140
  }
];

var femaleBreathDict = [
  {
    10: 1800,
    20: 1840,
    30: 1880,
    40: 1920,
    50: 1960,
    60: 2000,
    62: 2100,
    64: 2200,
    66: 2300,
    68: 2400,
    70: 2500,
    72: 2600,
    74: 2700,
    76: 2800,
    78: 2900,
    80: 3000,
    85: 3150,
    90: 3300,
    95: 3350,
    100: 3400,
  },
  {
    10: 1850,
    20: 1890,
    30: 1930,
    40: 1970,
    50: 2010,
    60: 2050,
    62: 2150,
    64: 2250,
    66: 2350,
    68: 2450,
    70: 2550,
    72: 2650,
    74: 2750,
    76: 2850,
    78: 2950,
    80: 3050,
    85: 3200,
    90: 3350,
    95: 3400,
    100: 3450,
  }
];

int findMark(int val, Map<int, int> vals) {
  int mark = 0;
  for (var key in vals.keys) {
    if (val >= key) {
      mark = vals[key]!;
    }
  }
  return mark;
}

int calcBreath(int gender, int age, int? val) {
  if (val == null) return 0;
  Map<int, int> t = gender == 0 ? maleBreathDict[age] : femaleBreathDict[age];
  int mark = 0;
  for (int key in t.keys) {
    if (val >= t[key]!) mark = key;
  }
  return mark;
}

var maleRun50 = [
  {
    10: 10.1,
    20: 9.9,
    30: 9.7,
    40: 9.5,
    50: 9.3,
    60: 9.1,
    62: 8.9,
    64: 8.7,
    66: 8.5,
    68: 8.3,
    70: 8.1,
    72: 7.9,
    74: 7.7,
    76: 7.5,
    78: 7.3,
    80: 7.1,
    85: 7.0,
    90: 6.9,
    95: 6.8,
    100: 6.7,
  },
  {
    10: 10.0,
    20: 9.8,
    30: 9.6,
    40: 9.4,
    50: 9.2,
    60: 9.0,
    62: 8.8,
    64: 8.6,
    66: 8.4,
    68: 8.2,
    70: 8.0,
    72: 7.8,
    74: 7.6,
    76: 7.4,
    78: 7.2,
    80: 7.0,
    85: 6.9,
    90: 6.8,
    95: 6.7,
    100: 6.6,
  }
];

var femaleRun50 = [
  {
    10: 11.3,
    20: 11.1,
    30: 10.9,
    40: 10.7,
    50: 10.5,
    60: 10.3,
    62: 10.1,
    64: 9.9,
    66: 9.7,
    68: 9.5,
    70: 9.3,
    72: 9.1,
    74: 8.9,
    76: 8.7,
    78: 8.5,
    80: 8.3,
    85: 8.0,
    90: 7.7,
    95: 7.6,
    100: 7.5,
  },
  {
    10: 11.2,
    20: 11.0,
    30: 10.8,
    40: 10.6,
    50: 10.4,
    60: 10.2,
    62: 10.0,
    64: 9.8,
    66: 9.6,
    68: 9.4,
    70: 9.2,
    72: 9.0,
    74: 8.8,
    76: 8.6,
    78: 8.4,
    80: 8.2,
    85: 7.9,
    90: 7.6,
    95: 7.5,
    100: 7.4,
  }
];

int calcRun50(int gender, int age, double? val) {
  if (val == null) return 0;
  Map<int, double> t = gender == 0 ? maleRun50[age] : femaleRun50[age];
  int mark = 0;
  for (int key in t.keys) {
    if (val <= t[key]!) mark = key;
  }
  return mark;
}

var maleStretch = [
  {
    10: -1.3,
    20: -0.3,
    30: 0.7,
    40: 1.7,
    50: 2.7,
    60: 3.7,
    62: 5.1,
    64: 6.5,
    66: 7.9,
    68: 9.3,
    70: 10.7,
    72: 12.1,
    74: 13.5,
    76: 14.9,
    78: 16.3,
    80: 17.7,
    85: 19.5,
    90: 21.3,
    95: 23.1,
    100: 24.9,
  },
  {
    10: -0.8,
    20: 0.2,
    30: 1.2,
    40: 2.2,
    50: 3.2,
    60: 4.2,
    62: 5.6,
    64: 7.0,
    66: 8.4,
    68: 9.8,
    70: 11.2,
    72: 12.6,
    74: 14.0,
    76: 15.4,
    78: 16.8,
    80: 18.2,
    85: 19.9,
    90: 21.5,
    95: 23.3,
    100: 25.1,
  }
];

var femaleStretch = [
  {
    10: 2.0,
    20: 2.8,
    30: 3.6,
    40: 4.4,
    50: 5.2,
    60: 6.0,
    62: 7.3,
    64: 8.6,
    66: 9.9,
    68: 11.2,
    70: 12.5,
    72: 13.8,
    74: 15.1,
    76: 16.4,
    78: 17.7,
    80: 19.0,
    85: 20.6,
    90: 22.2,
    95: 24.0,
    100: 25.8,
  },
  {
    10: 2.5,
    20: 3.3,
    30: 4.1,
    40: 4.9,
    50: 5.7,
    60: 6.5,
    62: 7.8,
    64: 9.1,
    66: 10.4,
    68: 11.7,
    70: 13.0,
    72: 14.3,
    74: 15.6,
    76: 16.9,
    78: 18.2,
    80: 19.5,
    85: 21.0,
    90: 22.4,
    95: 24.4,
    100: 26.3,
  }
];

int calcStretch(int gender, int age, double? val) {
  if (val == null) return 0;
  Map<int, double> t = gender == 0 ? maleStretch[age] : femaleStretch[age];
  int mark = 0;
  for (int key in t.keys) {
    if (val >= t[key]!) mark = key;
  }
  return mark;
}

var maleJump = [
  {
    10: 183,
    20: 188,
    30: 193,
    40: 198,
    50: 203,
    60: 208,
    62: 212,
    64: 216,
    66: 220,
    68: 224,
    70: 228,
    72: 232,
    74: 236,
    76: 240,
    78: 244,
    80: 248,
    85: 256,
    90: 263,
    95: 268,
    100: 273,
  },
  {
    10: 185,
    20: 190,
    30: 195,
    40: 200,
    50: 205,
    60: 210,
    62: 214,
    64: 218,
    66: 222,
    68: 226,
    70: 230,
    72: 234,
    74: 238,
    76: 242,
    78: 246,
    80: 250,
    85: 258,
    90: 265,
    95: 270,
    100: 275,
  },
];

var femaleJump = [
  {
    10: 126,
    20: 131,
    30: 136,
    40: 141,
    50: 146,
    60: 151,
    62: 154,
    64: 157,
    66: 160,
    68: 163,
    70: 166,
    72: 169,
    74: 172,
    76: 175,
    78: 178,
    80: 181,
    85: 188,
    90: 195,
    95: 201,
    100: 207,
  },
  {
    10: 127,
    20: 132,
    30: 137,
    40: 142,
    50: 147,
    60: 152,
    62: 155,
    64: 158,
    66: 161,
    68: 164,
    70: 167,
    72: 170,
    74: 173,
    76: 176,
    78: 179,
    80: 182,
    85: 189,
    90: 196,
    95: 202,
    100: 208,
  }
];

int calcJump(int gender, int age, int? val) {
  if (val == null) return 0;
  Map<int, int> t = gender == 0 ? maleJump[age] : femaleJump[age];
  int mark = 0;
  for (int key in t.keys) {
    if (val >= t[key]!) mark = key;
  }
  return mark;
}

var maleSpec = [
  {
    10: 5,
    20: 6,
    30: 7,
    40: 8,
    50: 9,
    60: 10,
    64: 11,
    68: 12,
    72: 13,
    76: 14,
    80: 15,
    85: 16,
    90: 17,
    95: 18,
    100: 19,
  },
  {
    10: 6,
    20: 7,
    30: 8,
    40: 9,
    50: 10,
    60: 11,
    64: 12,
    68: 13,
    72: 14,
    76: 15,
    80: 16,
    85: 17,
    90: 18,
    95: 19,
    100: 20,
  }
];

var femaleSpec = [
  {
    10: 16,
    20: 18,
    30: 20,
    40: 22,
    50: 24,
    60: 26,
    62: 28,
    64: 30,
    66: 32,
    68: 34,
    70: 36,
    72: 38,
    74: 40,
    76: 42,
    78: 44,
    80: 46,
    85: 49,
    90: 52,
    95: 54,
    100: 56,
  },
  {
    10: 17,
    20: 19,
    30: 21,
    40: 23,
    50: 25,
    60: 27,
    62: 29,
    64: 31,
    66: 33,
    68: 35,
    70: 37,
    72: 39,
    74: 41,
    76: 43,
    78: 45,
    80: 47,
    85: 50,
    90: 53,
    95: 55,
    100: 57,
  }
];
int calcSpec(int gender, int age, int? val) {
  if (val == null) return 0;
  Map<int, int> t = gender == 0 ? maleSpec[age] : femaleSpec[age];
  int mark = 0;
  for (int key in t.keys) {
    if (val >= t[key]!) mark = key;
  }
  return mark;
}

var maleLongRun = [
  {
    10: 372,
    20: 352,
    30: 332,
    40: 312,
    50: 292,
    60: 272,
    62: 267,
    64: 262,
    66: 257,
    68: 252,
    70: 247,
    72: 242,
    74: 237,
    76: 232,
    78: 227,
    80: 222,
    85: 214,
    90: 207,
    95: 202,
    100: 197,
  },
  {
    10: 370,
    20: 350,
    30: 330,
    40: 310,
    50: 290,
    60: 270,
    62: 265,
    64: 260,
    66: 255,
    68: 250,
    70: 245,
    72: 240,
    74: 235,
    76: 230,
    78: 225,
    80: 220,
    85: 212,
    90: 205,
    95: 200,
    100: 195,
  }
];

var femaleLongRun = [
  {
    10: 324,
    20: 314,
    30: 304,
    40: 294,
    50: 284,
    60: 274,
    62: 269,
    64: 264,
    66: 259,
    68: 254,
    70: 249,
    72: 244,
    74: 239,
    76: 234,
    78: 229,
    80: 224,
    85: 217,
    90: 210,
    95: 204,
    100: 198,
  },
  {
    10: 322,
    20: 312,
    30: 302,
    40: 292,
    50: 282,
    60: 272,
    62: 267,
    64: 262,
    66: 257,
    68: 252,
    70: 247,
    72: 242,
    74: 237,
    76: 232,
    78: 227,
    80: 222,
    85: 215,
    90: 208,
    95: 202,
    100: 196,
  }
];
int calcLongRun(int gender, int age, String val) {
  if (!RegExp(r"^[0-9]+:[0-9]+$").hasMatch(val)) return 0;
  var datas = val.split(":");
  int myval = int.parse(datas[0]) * 60 + int.parse(datas[1]);
  if (myval == 0) return 0;
  Map<int, int> t = gender == 0 ? maleLongRun[age] : femaleLongRun[age];
  int mark = 0;
  for (int key in t.keys) {
    if (myval <= t[key]!) mark = key;
  }
  return mark;
}

int calcGradeAll(int gradeBMI, int gradeBreath, int gradeRun50,
    int gradeStretch, int gradeJump, int gradeSpec, int gradeLongRun) {
  return (0.15 * gradeBMI +
          0.15 * gradeBreath +
          0.2 * gradeRun50 +
          0.1 * gradeStretch +
          0.1 * gradeJump +
          0.1 * gradeSpec +
          0.2 * gradeLongRun)
      .round();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const Scaffold(
        body: Calc(),
      ),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class Calc extends StatefulWidget {
  const Calc({
    Key? key,
  }) : super(key: key);

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  // gender true for male and false for female
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _breathController = TextEditingController();
  final TextEditingController _run50Controller = TextEditingController();
  final TextEditingController _stretchController = TextEditingController();
  final TextEditingController _jumpController = TextEditingController();
  final TextEditingController _specController = TextEditingController();
  final TextEditingController _longRunController = TextEditingController();
  int gender = 0;
  int age = 0;
  int gradeBMI = 0;
  int gradeBreath = 0;
  int gradeRun50 = 0;
  int gradeStretch = 0;
  int gradeJump = 0;
  int gradeSpec = 0;
  int gradeLongRun = 0;
  int gradeAll = 0;
  final GlobalKey formKey = GlobalKey<FormState>();
  Widget buildSpec(BuildContext context) {
    return gender == 0
        ? buildNumField(
            "引体向上", "请输入引体向上成绩", const Icon(Icons.plumbing), _specController)
        : buildNumField("仰卧起坐", "请输入仰卧起坐成绩", const Icon(Icons.control_point),
            _specController);
  }

  Widget buildNumField(
      String label, String hint, Icon icon, TextEditingController controller) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: icon,
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[0-9]|\.")),
      ],
      validator: (v) =>
          RegExp(r"^[0-9]+(\.[0-9]+)?$").hasMatch(v!) ? null : "请输入数字",
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: recalc,
    );
  }

  Widget buildGradeDisplay(String label, Icon icon, int grade) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: icon,
                ),
                Text(label, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: grade / 100.0,
              color: grade >= 60 ? Colors.green : Colors.red,
              semanticsLabel: label,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 40,
            child: Text("$grade/100",
                style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }

  void recalc(String? x) {
    // recalculate all grades and change the output table accordingly
    setState(() {
      gradeBMI = calcBMI(
        gender,
        age,
        double.tryParse(_heightController.text),
        double.tryParse(_weightController.text),
      );
      gradeBreath =
          calcBreath(gender, age, int.tryParse(_breathController.text));
      gradeRun50 =
          calcRun50(gender, age, double.tryParse(_run50Controller.text));
      gradeStretch =
          calcStretch(gender, age, double.tryParse(_stretchController.text));
      gradeJump = calcJump(gender, age, int.tryParse(_jumpController.text));
      gradeSpec = calcSpec(gender, age, int.tryParse(_specController.text));
      gradeLongRun = calcLongRun(gender, age, _longRunController.text);
      gradeAll = calcGradeAll(gradeBMI, gradeBreath, gradeRun50, gradeStretch,
          gradeJump, gradeSpec, gradeLongRun);
    });
  }

  final Uri _url = Uri.parse('https://github.com/Clouder0/pecalc');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: ListView(
        children: [
          Center(
            child: Text(
              "哈深体测分数计算器",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 0,
                    groupValue: gender,
                    onChanged: (x) {
                      setState(() {
                        gender = x!;
                        recalc(null);
                      });
                    },
                  ),
                  const Text("男"),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: gender,
                    onChanged: (x) {
                      setState(() {
                        gender = x!;
                        recalc(null);
                      });
                    },
                  ),
                  const Text("女"),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 0,
                    groupValue: age,
                    onChanged: (x) {
                      setState(() {
                        age = x!;
                        recalc(null);
                      });
                    },
                  ),
                  const Text("大一大二"),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: age,
                    onChanged: (x) {
                      setState(() {
                        age = x!;
                        recalc(null);
                      });
                    },
                  ),
                  const Text("大三大四"),
                ],
              ),
            ],
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                buildNumField("身高(cm)", "请输入身高", const Icon(Icons.height),
                    _heightController),
                buildNumField("体重(kg)", "请输入体重", const Icon(Icons.line_weight),
                    _weightController),
                buildNumField("肺活量", "请输入肺活量", const Icon(Icons.bubble_chart),
                    _breathController),
                buildNumField("50 米", "请输入 50 米成绩",
                    const Icon(Icons.run_circle), _run50Controller),
                buildNumField("坐位体前屈", "请输入坐位体前屈成绩",
                    const Icon(Icons.sports_gymnastics), _stretchController),
                buildNumField("立定跳远(cm)", "请输入立定跳远成绩",
                    const Icon(Icons.straight), _jumpController),
                buildSpec(context),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "耐力跑(1000/800)",
                    hintText: "请输入耐力跑成绩(格式如4:30)",
                    prefixIcon: Icon(Icons.alarm),
                  ),
                  controller: _longRunController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]|:")),
                  ],
                  validator: (v) => RegExp(r"^[0-9]+:[0-9]+$").hasMatch(v!)
                      ? null
                      : "请输入正确的格式，如 4:30",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: recalc,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Column(
            children: [
              buildGradeDisplay("BMI", const Icon(Icons.line_weight), gradeBMI),
              buildGradeDisplay(
                  "肺活量", const Icon(Icons.bubble_chart), gradeBreath),
              buildGradeDisplay(
                  "50 米", const Icon(Icons.run_circle), gradeRun50),
              buildGradeDisplay(
                  "坐位体前屈", const Icon(Icons.sports_gymnastics), gradeStretch),
              buildGradeDisplay("立定跳远", const Icon(Icons.straight), gradeJump),
              gender == 0
                  ? buildGradeDisplay(
                      "引体向上", const Icon(Icons.plumbing), gradeSpec)
                  : buildGradeDisplay(
                      "仰卧起坐", const Icon(Icons.control_point), gradeSpec),
              buildGradeDisplay("长跑", const Icon(Icons.alarm), gradeLongRun),
              buildGradeDisplay("总分", const Icon(Icons.grade), gradeAll),
            ],
          ),
          const Divider(thickness: 1),
          const Center(
            child: Text(
              "Authored by Clouder\n计算结果仅供参考",
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: TextButton(
              onPressed: _launchUrl,
              child: const Text(
                "Open GitHub Repo",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
