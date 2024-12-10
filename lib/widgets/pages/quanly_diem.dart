import 'package:flutter/material.dart';
import 'package:kiem_tra/models/data/lop_data.dart';
import 'package:kiem_tra/widgets/components/drawer.dart';
import 'package:kiem_tra/widgets/pages/homepage.dart';
import 'package:kiem_tra/widgets/pages/bangdiem.dart';
import 'package:kiem_tra/models/data/monhoc_data.dart';

class QuanLyDiemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý điểm'),
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
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('STT')),
            DataColumn(label: Text('Tên lớp')),
            DataColumn(label: Text('Môn học')),
          ],
          columnSpacing: 15,
          headingRowHeight: 50,
          rows: lops.map(
                (lop) {
              List<String> tenMonHocs = lop.maMonHocs
                  .map((maMonHoc) =>
              monHocs.firstWhere((monHoc) => monHoc.maMonHoc == maMonHoc).tenMonHoc)
                  .toList();

              return DataRow(
                cells: [
                  DataCell(FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text((lops.indexOf(lop) + 1).toString()),
                  )),
                  DataCell(FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(lop.tenLop),
                  )),
                  DataCell(FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Wrap(
                      spacing: 4,
                      children: tenMonHocs
                          .map((tenMonHoc) => InkWell(
                        child: Text(tenMonHoc),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BangDiem(
                                lop: lop,
                                monHoc: monHocs.firstWhere(
                                        (monHoc) => monHoc.tenMonHoc == tenMonHoc),
                              ),
                            ),
                          );
                        },
                      )).toList(),
                    ),
                  )),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}