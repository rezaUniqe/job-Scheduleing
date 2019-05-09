import 'package:flutter_app/info/type.dart';

class Calculator {
  List<MyDataType> data;
  List<int> chosen = new List();
  List<double> times = new List();
  double res = 0;
  int max_t = 0;

  Calculator({this.data});

  get result => this.res;

  get sortedData => this.data;

  void check() {
    _fillArray();
    for (int i = 0; i < data.length; i++) {
      if (times.elementAt(data[i].time - 1) == 0) {
        times[data[i].time - 1] = data[i].prise;
        chosen.add(data[i].id);
        res += data[i].prise;
      }
    }
    print(times.toString());
    print(max_t.toString());
  }

  void _fillArray() {
    for (int i = 0; i < data.length; i++) {
      List<MyDataType> temp = List.from(data);
      temp.sort((a, b) => a.time.compareTo(b.time));
      temp = temp.reversed.toList();
      max_t = temp.first.time;
    }
    for (int i = 0; i < max_t; i++) {
      times.add(0);
    }
  }
}
