import "package:flutter/material.dart";

class FormThemSinhVien extends StatelessWidget {
  final Function themSinhVien;

  final _maLopController = TextEditingController();
  final _maSinhVienController = TextEditingController();
  final _hoVaTenController = TextEditingController();
  final _ngaySinhController = TextEditingController();
  final _queQuanController = TextEditingController();
  final _cccdController = TextEditingController();

  FormThemSinhVien(this.themSinhVien);

  submitData(BuildContext context) {
    final enterMaLopController = _maLopController.text;
    final enterMaSinhVienController = _maSinhVienController.text;
    final enterHoVaTenController = _hoVaTenController.text;
    final enterNgaySinhController = _ngaySinhController.text;
    final enterQueQuanController = _queQuanController.text;
    final enterCccdController = _cccdController.text;

    if ((enterMaLopController.length == 4) && (enterMaSinhVienController.length == 6)) {
      themSinhVien(
        int.parse(enterMaLopController),
        int.parse(enterMaSinhVienController),
        enterHoVaTenController,
        parseNgaySinh(enterNgaySinhController),
        enterQueQuanController,
        enterCccdController,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Thêm sinh viên thành công"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mã lớp không hợp lệ"),
        ),
      );
    }
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
              controller: _maLopController,
              decoration: InputDecoration(labelText: "Mã lớp"),
              onSubmitted: (_) => submitData(context),
            ),
            TextField(
              controller: _maSinhVienController,
              decoration: InputDecoration(labelText: "Mã sinh viên"),
              onSubmitted: (_) => submitData(context),
            ),
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
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF405189)),
              ),
              child: Text("Thêm sinh viên"),
            ),
          ],
        ),
      ),
    );
  }
}

