class Mahasiswa {
  late int id;
  late String name;
  late int age;
  late String image;
  late String email;
  late String password;

  // constructor
  Mahasiswa(
      {required this.id,
      required this.name,
      required this.age,
      required this.image});

  void setId(int id) {
    this.id = id;
  }

  void setName(String name) {
    this.name = name;
  }

  void setAge(int age) {
    this.age = age;
  }

  void setImage(String image) {
    this.image = image;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  int getId() {
    return this.id;
  }

  String getName() {
    return this.name;
  }

  int getAge() {
    return this.age;
  }

  String getImage() {
    return this.image;
  }

  String getEmail() {
    return this.email;
  }

  String getPassword() {
    return this.password;
  }
}
