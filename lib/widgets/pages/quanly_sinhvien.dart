import 'package:flutter/material.dart';
import 'package:kiem_tra/models/data/sinhvien_data.dart';
import 'package:kiem_tra/widgets/components/drawer.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:kiem_tra/widgets/pages/them_sinhvien.dart';
import 'package:kiem_tra/widgets/components/danhsach_sinhvien.dart';
import 'package:kiem_tra/models/data/lop_data.dart';

class QuanLySinhVienPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    sinhViens.sort((a, b) => a.maSinhVien.compareTo(b.maSinhVien));
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý sinh viên'),
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
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: CupertinoButton(
              color: Color(0xFF405189),
              child: Text('Thêm sinh viên'),
              onPressed: (){
                navigateToThemSinhVien(context);
              },
            ),
          ),
          Expanded(
              child: DanhSachSinhVien(sinhViens),
          )
        ],
      ),
    );
  }
  void navigateToThemSinhVien(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThemSinhVien(updateLopHocs: updateLopHocs),
      ),
    );
  }

  void updateLopHocs() {
    lopHocs = initializeSinhViensInLops(lopHocs);
  }
}
