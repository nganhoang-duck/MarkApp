import 'package:kiem_tra/models/diem.dart';
class SinhVien {
  final int maSinhVien;
  final int maLop;
  final String hoVaTen;
  final DateTime ngaySinh;
  final String queQuan;
  final String cccd;
  List<Diem> diems;
  
  SinhVien({
    required this.maSinhVien,
    required this.maLop,
    required this.hoVaTen,
    required this.ngaySinh,
    required this.queQuan,
    required this.cccd,
    required this.diems,
  });
}