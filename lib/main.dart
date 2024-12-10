import 'package:flutter/material.dart';
import 'widgets/pages/homepage.dart';
import 'widgets/pages/quanly_sinhvien.dart';
import 'widgets/pages/quanly_lop.dart';
import 'widgets/pages/quanly_monhoc.dart';
import 'widgets/pages/quanly_diem.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quản lý sinh viên",
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/quanly_sinhvien": (context) => QuanLySinhVienPage(),
        "/quanly_lop": (context) => QuanLyLopPage(),
        "/quanly_monhoc": (context) => QuanLyMonHocPage(),
        "/quanly_diem": (context) => QuanLyDiemPage(),
      },
    );
  }
}


