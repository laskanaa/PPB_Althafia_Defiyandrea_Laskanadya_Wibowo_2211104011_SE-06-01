import 'dart:io'; // Impor modul dart:io untuk menggunakan stdin

String evaluateScore(int score) {
  if (score > 70) {
    return "$score merupakan Nilai A";
  } else if (score > 40 && score <= 70) {
    return "$score merupakan Nilai B";
  } else if (score > 0 && score <= 40) {
    return "$score merupakan Nilai C";
  } else {
    return ""; // Mengembalikan teks kosong jika tidak memenuhi kondisi
  }
}

void main() {
  // Mengambil input dari pengguna
  print("Masukkan nilai: ");
  int? userInput =
      int.tryParse(stdin.readLineSync()!); // Membaca input dari pengguna

  // Memeriksa apakah input valid
  if (userInput != null) {
    // Menampilkan hasil evaluasi
    print(evaluateScore(userInput));
  } else {
    print("Input tidak valid");
  }
}
