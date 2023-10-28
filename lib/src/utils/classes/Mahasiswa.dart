class Mahasiswa {
  late int id;
  late String name;
  late int age;
  late String image;

  void setId(int id){
    this.id = id;
  }

  void setName(String name){
    this.name = name;
  }

  void setAge(int age){
    this.age = age;
  }

  void setImage(String image){
    this.image = image;
  }

  int getId(){
    return this.id;
  }

  String getName(){
    return this.name;
  }

  int getAge(){
    return this.age;
  }

  String getImage(){
    return this.image;
  }
  
}