import 'package:flutter/material.dart';
import 'package:praktikum_10/helper/db_helper.dart';

class MyDbView extends StatefulWidget {
  @override
  _MyDbViewState createState() => _MyDbViewState();
}

class _MyDbViewState extends State<MyDbView> {
  final DbHelper dbHelper = DbHelper();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _hobbyController = TextEditingController();
  List<Map<String, dynamic>> _dbData = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      _dbData = data;
    });
  }

  Future<void> _addData() async {
    await dbHelper.insert({
      'name': _nameController.text,
      'nim': _nimController.text,
      'address': _addressController.text,
      'hobby': _hobbyController.text,
    });
    _nameController.clear();
    _nimController.clear();
    _addressController.clear();
    _hobbyController.clear();
    await _refreshData();
  }

  Future<void> _deleteData(int id) async {
    await dbHelper.delete(id);
    await _refreshData();
  }

  void _showAddDialog() {
    _nameController.clear();
    _nimController.clear();
    _addressController.clear();
    _hobbyController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Biodata Mahasiswa'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: _nimController,
                  decoration: InputDecoration(labelText: 'NIM'),
                ),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Alamat'),
                ),
                TextField(
                  controller: _hobbyController,
                  decoration: InputDecoration(labelText: 'Hobi'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _addData();
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Biodata Mahasiswa'),
      ),
      body: _dbData.isEmpty
          ? Center(child: Text('Belum ada data.'))
          : ListView.builder(
              itemCount: _dbData.length,
              itemBuilder: (context, index) {
                final item = _dbData[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(item['name'] ?? 'No Name'),
                    subtitle: Text(
                      'NIM: ${item['nim'] ?? ''}\nAlamat: ${item['address'] ?? ''}\nHobi: ${item['hobby'] ?? ''}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteData(item['id']),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
