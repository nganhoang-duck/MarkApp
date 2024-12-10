import 'package:flutter/material.dart';
import 'package:kiem_tra/widgets/components/formthem_sinhvien.dart';
import 'package:kiem_tra/models/sinhvien.dart';
import 'package:kiem_tra/models/data/sinhvien_data.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';

class ThemSinhVien extends StatefulWidget {
  final VoidCallback updateLopHocs;

  ThemSinhVien({required this.updateLopHocs});
  @override
  State<ThemSinhVien> createState() => _ThemSinhVienState();
}
class _ThemSinhVienState extends State<ThemSinhVien>{

  themSinhVien(int maLop, int maSinhVien, String hoVaTen, DateTime ngaySinh,
      String queQuan, String cccd){
    final newSinhVien = SinhVien(
      maLop: maLop,
      maSinhVien: maSinhVien,
      hoVaTen: hoVaTen,
      ngaySinh: ngaySinh,
      queQuan: queQuan,
      cccd: cccd,
      diems: [],
    );
    setState(() {
      sinhViens.add(newSinhVien);
    });

    widget.updateLopHocs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm sinh viên'),
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
      body: FormThemSinhVien(themSinhVien),
    );
  }
}