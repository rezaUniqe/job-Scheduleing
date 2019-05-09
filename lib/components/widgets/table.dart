import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  final List<DataColumn> columns = <DataColumn>[
    DataColumn(label: Text("person id")),
    DataColumn(label: Text("time")),
    DataColumn(label: Text("prise"))
  ];
  final List<DataRow> rows;

  MyTable({this.rows});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columns,
      rows: rows,
    );
  }
}
