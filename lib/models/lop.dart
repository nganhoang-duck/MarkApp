import 'package:kiem_tra/models/sinhvien.dart';

class Lop {
  final int maLop;
  final String tenLop;
  late int siSo = 0;
  final int khoaTuyenSinh;
  List<SinhVien> sinhViens;
  List<int> maMonHocs;

  Lop({
    required this.maLop,
    required this.tenLop,
    required this.khoaTuyenSinh,
    required this.sinhViens,
    required this.maMonHocs,
  });
}