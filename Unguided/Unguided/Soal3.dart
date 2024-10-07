import 'dart:io'; // Untuk menggunakan stdin dan stdout

// Fungsi untuk mengecek apakah bilangan prima
bool isPrime(int number) {
  if (number < 2) {
    return false; // Bilangan kurang dari 2 bukan bilangan prima
  }
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) {
      return false; // Bilangan habis dibagi, maka bukan prima
    }
  }
  return true; // Jika tidak ada yang habis dibagi, maka prima
}

void main() {
  // Meminta input dari pengguna
  print("Masukkan bilangan bulat: ");
  int? input = int.tryParse(stdin.readLineSync()!);

  // Memeriksa apakah input valid
  if (input != null) {
    if (isPrime(input)) {
      print("$input adalah bilangan prima");
    } else {
      print("$input bukan bilangan prima");
    }
  } else {
    print("Input tidak valid, harap masukkan bilangan bulat.");
  }
}
