import 'dart:io'; // Impor modul dart:io untuk input pengguna

void main() {
  // Mengambil input panjang piramida dari pengguna
  print("Masukkan panjang piramida: ");
  int? panjang = int.tryParse(stdin.readLineSync()!);

  // Memeriksa apakah input valid
  if (panjang != null && panjang > 0) {
    // Mencetak piramida bintang
    for (int i = 1; i <= panjang; i++) {
      // Mencetak spasi
      for (int j = 1; j <= panjang - i; j++) {
        stdout.write(" "); // Menggunakan stdout.write untuk spasi
      }
      // Mencetak bintang
      for (int k = 1; k <= (2 * i - 1); k++) {
        stdout.write("*");
      }
      print(""); // Pindah ke baris berikutnya
    }
  } else {
    print("Input tidak valid, harap masukkan angka positif.");
  }
}
