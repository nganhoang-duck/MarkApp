import 'package:flutter/material.dart';

class FormSuaSinhVien extends StatefulWidget {
  final Function suaSinhVien;
  final String maLop;
  final String maSinhVien;
  final String hoVaTen;
  final String ngaySinh;
  final String queQuan;
  final String cccd;

  FormSuaSinhVien({
    required this.suaSinhVien,
    required this.maLop,
    required this.maSinhVien,
    required this.hoVaTen,
    required this.ngaySinh,
    required this.queQuan,
    required this.cccd,
  });

  @override
  _FormSuaSinhVienState createState() => _FormSuaSinhVienState();
}

class _FormSuaSinhVienState extends State<FormSuaSinhVien> {
  late TextEditingController _hoVaTenController;
  late TextEditingController _ngaySinhController;
  late TextEditingController _queQuanController;
  late TextEditingController _cccdController;

  @override
  void initState() {
    super.initState();
    _hoVaTenController = TextEditingController(text: widget.hoVaTen);
    _ngaySinhController = TextEditingController(text: widget.ngaySinh);
    _queQuanController = TextEditingController(text: widget.queQuan);
    _cccdController = TextEditingController(text: widget.cccd);
  }

  @override
  void dispose() {
    _hoVaTenController.dispose();
    _ngaySinhController.dispose();
    _queQuanController.dispose();
    _cccdController.dispose();
    super.dispose();
  }

  submitData(BuildContext context) {
    final enterHoVaTenController = _hoVaTenController.text;
    final enterNgaySinhController = _ngaySinhController.text;
    final enterQueQuanController = _queQuanController.text;
    final enterCccdController = _cccdController.text;

    widget.suaSinhVien(
      int.parse(widget.maLop),
      int.parse(widget.maSinhVien),
      enterHoVaTenController,
      parseNgaySinh(enterNgaySinhController),
      enterQueQuanController,
      enterCccdController,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cập nhật sinh viên thành công"),
      ),
    );
  }

  DateTime parseNgaySinh(String ngaySinhString) {
    List<String> parts = ngaySinhString.split('-');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _hoVaTenController,
              decoration: InputDecoration(labelText: "Họ và tên"),
              onSubmitted: (_) => submitData(context),
            ),
            TextField(
              controller: _ngaySinhController,
              decoration: InputDecoration(labelText: "Ngày sinh"),
              onSubmitted: (_) => submitData(context),
            ),
            TextField(
              controller: _queQuanController,
              decoration: InputDecoration(labelText: "Quê quán"),
              onSubmitted: (_) => submitData(context),
            ),
            TextField(
              controller: _cccdController,
              decoration: InputDecoration(labelText: "CCCD"),
              onSubmitted: (_) => submitData(context),
            ),
            ElevatedButton(
              onPressed: () {
                submitData(context);
              },
              child: Text("Cập nhật sinh viên"),
            )
          ],
        ),
      ),
    );
  }
}