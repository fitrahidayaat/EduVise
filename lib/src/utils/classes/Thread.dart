class Thread {
  late int id;
  late String title;
  late String description;
  late int likes;
  late int dislikes;
  late List<Thread> replies;

  // constructor
  Thread(
      {required this.id,
      required this.title,
      required this.description,
      required this.likes,
      required this.dislikes,
      required this.replies});

  // getter and setter
  void setId(int id) {
    this.id = id;
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setDescription(String description) {
    this.description = description;
  }

  void setLikes(int likes) {
    this.likes = likes;
  }

  void setDislikes(int dislikes) {
    this.dislikes = dislikes;
  }

  void setReplies(List<Thread> replies) {
    this.replies = replies;
  }

  int getId() {
    return this.id;
  }

  String getTitle() {
    return this.title;
  }

  String getDescription() {
    return this.description;
  }

  int getLikes() {
    return this.likes;
  }

  int getDislikes() {
    return this.dislikes;
  }

  List<Thread> getReplies() {
    return this.replies;
  }
}
