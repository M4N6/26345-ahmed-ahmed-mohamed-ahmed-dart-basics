// Student: AHMED AHMED MOHAMED AHMED
// Reg no: 26345
const String regNo = '26345';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ---------- copied from D2 ----------
int momoFee(int amount) {
  // by AA
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// ---------- F1: formatRwf ----------
String formatRwf(int amount) {
  // by AA
  bool negative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count > 0 && count % 3 == 0) {
      result = ',' + result;
    }
    result = digits[i] + result;
    count++;
    i--;
  }
  return (negative ? '-' : '') + result + ' RWF';
}

// ---------- F2: isValidPin ----------
bool isValidPin(String pin) {
  // by AA
  if (pin.length != 5) return false;
  int i = 0;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) return false; // not a digit 0-9
    i++;
  }
  if (pin == '12345') return false;
  if (pin == pin[0] * 5) return false; // same digit five times
  return true;
}

// ---------- F3: sendMoney ----------
int sendMoney(int balance, int amount) {
  // by AA
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// ---------- F4: buyAirtime ----------
int buyAirtime(int balance, int amount) {
  // by AA
  if (amount < 100 || amount > 50000) {
    print('Failed: amount must be from 100 to 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by AA
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. PIN checks
  print("isValidPin('12345') -> ${isValidPin('12345')}");
  print("isValidPin('77777') -> ${isValidPin('77777')}");
  print("isValidPin('4821') -> ${isValidPin('4821')}");
  print("isValidPin('48a21') -> ${isValidPin('48a21')}");
  print("isValidPin('4821$d') -> ${isValidPin('4821$d')}");

  // 2. starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. transactions in order
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. my own tests (expected output in the comment)
  print('formatRwf(100) -> ${formatRwf(100)}'); // 100 RWF
  // expected: -100 RWF (a simple version could wrongly give -,100)
  print('formatRwf(-100) -> ${formatRwf(-100)}');
  print('formatRwf(1000000) -> ${formatRwf(1000000)}'); // 1,000,000 RWF
  print('formatRwf(12) -> ${formatRwf(12)}'); // 12 RWF
  // expected: false (same digit five times)
  print("isValidPin('00000') -> ${isValidPin('00000')}");
  // expected: true (a leading zero is fine)
  print("isValidPin('01234') -> ${isValidPin('01234')}");
  // expected: false (empty, must not crash on pin[0])
  print("isValidPin('') -> ${isValidPin('')}");
  print("isValidPin('123456') -> ${isValidPin('123456')}"); // false (6 characters)
}
