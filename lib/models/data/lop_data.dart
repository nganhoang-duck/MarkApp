import 'package:kiem_tra/models/lop.dart';
import 'package:kiem_tra/models/data/sinhvien_data.dart';

List<Lop> initializeSinhViensInLops(List<Lop> lopHocs) {
  for (var lopItem in lopHocs) {
    var studentsInLop = sinhViens.where((sv) => sv.maLop == lopItem.maLop).toList();
    lopItem.sinhViens.clear();
    lopItem.sinhViens.addAll(studentsInLop);
    lopItem.siSo = lopItem.sinhViens.length;
  }

  return lopHocs;
}

final lops = initializeSinhViensInLops(lopHocs);

List<Lop> lopHocs = [
  Lop(
    maLop: 1501,
    tenLop: 'CNTT 15-01',
    khoaTuyenSinh: 15,
    sinhViens: [],
    maMonHocs: [01,03],
  ),
  Lop(
    maLop: 1502,
    tenLop: 'CNTT 15-02',
    khoaTuyenSinh: 15,
    sinhViens: [],
    maMonHocs: [01,04],
  ),
  Lop(
    maLop: 1601,
    tenLop: 'CNTT 16-01',
    khoaTuyenSinh: 16,
    sinhViens: [],
    maMonHocs: [02,03],
  ),
  Lop(
    maLop: 1602,
    tenLop: 'CNTT 16-02',
    khoaTuyenSinh: 16,
    sinhViens: [],
    maMonHocs: [02,04],
  ),
];




