import 'package:flutter/material.dart';
import 'package:kiem_tra/widgets/components/formsua_sinhvien.dart';
import 'package:kiem_tra/models/sinhvien.dart';
import 'package:kiem_tra/models/data/sinhvien_data.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';

class SuaSinhVien extends StatefulWidget {
  final VoidCallback updateLopHocs;
  final SinhVien sinhVien;

  SuaSinhVien({required this.updateLopHocs, required this.sinhVien});

  @override
  State<SuaSinhVien> createState() => _SuaSinhVienState();
}

class _SuaSinhVienState extends State<SuaSinhVien> {
  late TextEditingController _hoVaTenController;
  late TextEditingController _ngaySinhController;
  late TextEditingController _queQuanController;
  late TextEditingController _cccdController;

  @override
  void initState() {
    super.initState();
    _hoVaTenController = TextEditingController(text: widget.sinhVien.hoVaTen);
    _ngaySinhController = TextEditingController(
        text: widget.sinhVien.ngaySinh.toString().split(' ')[0]);
    _queQuanController = TextEditingController(text: widget.sinhVien.queQuan);
    _cccdController = TextEditingController(text: widget.sinhVien.cccd);
  }

  @override
  void dispose() {
    _hoVaTenController.dispose();
    _ngaySinhController.dispose();
    _queQuanController.dispose();
    _cccdController.dispose();
    super.dispose();
  }

  suaSinhVien(int maLop, int maSinhVien, String hoVaTen, DateTime ngaySinh,
      String queQuan, String cccd) {
    final updatedSinhVien = SinhVien(
      maLop: maLop,
      maSinhVien: maSinhVien,
      hoVaTen: hoVaTen,
      ngaySinh: ngaySinh,
      queQuan: queQuan,
      cccd: cccd,
      diems: widget.sinhVien.diems,
    );

    setState(() {
      sinhViens[sinhViens.indexOf(widget.sinhVien)] = updatedSinhVien;
    });

    widget.updateLopHocs();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cập nhật sinh viên thành công"),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sửa thông tin sinh viên'),
        backgroundColor: Color(0xFF405189),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: FormSuaSinhVien(
            suaSinhVien: suaSinhVien,
            maLop: widget.sinhVien.maLop.toString(),
            maSinhVien: widget.sinhVien.maSinhVien.toString(),
            hoVaTen: _hoVaTenController.text,
            ngaySinh: _ngaySinhController.text,
            queQuan: _queQuanController.text,
            cccd: _cccdController.text,
          ),
        ),
      ),
    );
  }
}