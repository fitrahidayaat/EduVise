class RencanaBelajar {
  late String title;
  late String schedule;
  late bool marked = false;

  // constructor
  RencanaBelajar({required this.title, required this.schedule});

  void setTitle(String title) {
    this.title = title;
  }

  void setSchedule(String schedule) {
    this.schedule = schedule;
  }

  String getTitle() {
    return this.title;
  }

  String getSchedule() {
    return this.schedule;
  }

  void checkMarked() {
    this.marked = !this.marked;
  }
}
