class Chatbot {
  late String name;
  late String status;

  // constructor
  Chatbot({required this.name, required this.status});

  void setName(String name) {
    this.name = name;
  }

  void setStatus(String status) {
    this.status = status;
  }

  String getName() {
    return this.name;
  }

  String getStatus() {
    return this.status;
  }
}
