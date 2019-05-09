import 'package:flutter/material.dart';
import 'package:flutter_app/components/widgets/table.dart';
import 'package:flutter_app/info/type.dart';
import 'package:flutter_app/info/calculate.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<DataRow> rows;
  List<MyDataType> data;
  Calculator _calculator;
  double res;
  TextEditingController _idController;
  TextEditingController _priseController;
  TextEditingController _timeController;
  bool call = false;

  @override
  void initState() {
    super.initState();
    data = new List();
    rows = new List();
    _idController = TextEditingController();
    _timeController = TextEditingController();
    _priseController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Simple App",
      )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            MyTable(rows: rows),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: Text("calculate"),
                  onPressed: () {
                    call = true;
                    sorter();
                    _calculator = new Calculator(data: data);
                    _calculator.check();
                    setState(() {
                      rows.clear();
                      _firstAdd();
                      res = _calculator.result;
                    });
                  }),
            ),
            Container(
                width: 135.0,
                height: 25.0,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(child: Text("resualt is:$res"))),
            SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _showAdd(context);
          }),
    );
  }

  void _showAdd(BuildContext c) {
    showModalBottomSheet(
        context: c,
        builder: (BuildContext context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0))),
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                      child: TextField(
                          controller: _idController,
                          decoration: InputDecoration(labelText: "id"))),
                  SizedBox(width: 20.0),
                  Expanded(
                      child: TextField(
                          decoration: InputDecoration(labelText: "time"),
                          controller: _timeController)),
                  SizedBox(width: 20.0),
                  Expanded(
                      child: TextField(
                          decoration: InputDecoration(labelText: "prise"),
                          controller: _priseController)),
                  SizedBox(width: 20.0),
                  Container(
                    width: 52.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_idController.text != null &&
                            _priseController.text != null &&
                            _timeController.text != null) {
                          data.add(MyDataType.name(
                              (int.parse(_idController.text)),
                              int.parse(_timeController.text),
                              double.parse(_priseController.text)));
                          _priseController.clear();
                          _idController.clear();
                          _timeController.clear();
                          rows.clear();
                          setState(() {
                            _firstAdd();
                          });
                        }
                      },
                      child: Center(child: Icon(Icons.check)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0)),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void _firstAdd() {
    for (int i = 0; i < data.length; i++) {
      rows.add(new DataRow(cells: [
        DataCell(Text(data[i].id.toString())),
        DataCell(Text(data[i].time.toString())),
        DataCell(Text(
          data[i].prise.toString(),
          style: call == true
              ? TextStyle(
                  color: _calculator.chosen.contains(data[i].id)
                      ? Colors.green
                      : Colors.black)
              : null,
        ))
      ]));
    }
  }

  void sorter() {
    data.sort((a, b) => a.prise.compareTo(b.prise));
    data = data.reversed.toList();
  }
}
