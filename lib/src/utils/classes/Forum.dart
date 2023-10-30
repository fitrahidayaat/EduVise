import 'package:eduvise/src/utils/classes/Thread.dart';

class Forum {
  late List<Thread> threads;
  late int totalThreads;

  void createThread(Thread thread) {
    this.threads.add(thread);
    this.totalThreads++;
  }

  Thread findThread(int id) {
    for (int i = 0; i < this.threads.length; i++) {
      if (this.threads[i].getId() == id) {
        return this.threads[i];
      }
    }
    return this.threads[0];
  }

  void deleteThread(int id) {
    for (int i = 0; i < this.threads.length; i++) {
      if (this.threads[i].getId() == id) {
        this.threads.removeAt(i);
        this.totalThreads--;
      }
    }
  }
}
