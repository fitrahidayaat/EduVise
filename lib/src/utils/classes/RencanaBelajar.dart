class RencanaBelajar{
  late String title;
  late String schedule;
  late bool marked = false;

  void setTitle(String title){
    this.title = title;
  }

  void setSchedule(String schedule){
    this.schedule = schedule;
  }

  String getTitle(){
    return this.title;
  }

  String getSchedule(){
    return this.schedule;
  }

  void checkMarked(){
    this.marked = !this.marked;
  }

}