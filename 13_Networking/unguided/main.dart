import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller untuk mengelola catatan
class NotesController extends GetxController {
  // Daftar catatan disimpan dalam List reaktif
  var notes = <Map<String, String>>[].obs;

  // Tambahkan catatan baru
  void addNote(String title, String description) {
    notes.add({'title': title, 'description': description});
  }

  // Hapus catatan berdasarkan indeks
  void deleteNoteAt(int index) {
    notes.removeAt(index);
  }
}
// Halaman Utama
class HomePage extends StatelessWidget {
  final NotesController controller = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Sederhana'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.notes.isEmpty
            ? const Center(
                child: Text('Belum ada catatan, tambahkan sekarang!'),
              )
            : ListView.builder(
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  final note = controller.notes[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(note['title'] ?? ''),
                      subtitle: Text(note['description'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.deleteNoteAt(index),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNotePage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Halaman Tambah Catatan
class AddNotePage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final NotesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Judul Catatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Deskripsi Catatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();

                if (title.isNotEmpty && description.isNotEmpty) {
                  controller.addNote(title, description);
                  Get.back(); // Kembali ke halaman utama
                } else {
                  Get.snackbar(
                    'Input Tidak Lengkap',
                    'Judul dan deskripsi tidak boleh kosong.',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: const Text('Simpan Catatan'),
            ),
          ],
        ),
      ),
    );
  }
}

// Main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/add', page: () => AddNotePage()),
      ],
    );
  }
}
