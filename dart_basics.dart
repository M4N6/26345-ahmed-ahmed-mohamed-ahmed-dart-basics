// Student: AHMED AHMED MOHAMED AHMED
// Reg no: 26345
const String regNo = '26345';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ---------- B2: countVowels ----------
int countVowels(String text) {
  // by AA
  String lower = text.toLowerCase(); // this line makes capital letters count
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
    i++;
  }
  return count;
}

// ---------- B3: initials ----------
String initials(String fullName) {
  // by AA
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';
  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += parts[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return result;
}

// ---------- C5: drawTriangle ----------
void drawTriangle(int height) {
  // by AA
  int row = 1;
  while (row <= height) {
    String symbol = row % 2 == 1 ? '*' : '#';
    int spaces = height - row;
    print((' ' * spaces) + (symbol * row));
    row++;
  }
}

// ---------- D2: MoMo receipt printer ----------
int momoFee(int amount) {
  // by AA
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by AA
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) +
      ('*' * (phone.length - 5)) +
      phone.substring(phone.length - 2);
}

void main() {
  // by AA
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  String myName = 'AHMED AHMED MOHAMED AHMED';
  print('$myName has ${countVowels(myName)} vowels');

  // B3
  print(initials(myName));
  print(initials('  ana   uwase  '));
  print(initials('   '));

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  String phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    totalFees += fee;
    i++;
  }
  print('Total fees: $totalFees RWF');
}
