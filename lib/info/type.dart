class MyDataType {
  int id;
  int time;
  double prise;
  get ids => this.id;
  get times => this.time;
  get prises => this.prise;

  set ids_(d) {
    this.id = d;
  }

  set times(t) {
    this.time = t;
  }

  set prises(p) {
    this.prise = p;
  }

  MyDataType.name(this.id, this.time, this.prise);
}
