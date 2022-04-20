import '../localStorage.dart';

resetUuids() {
  localStorage.instance.setStringList('doneHomeworkUuids', []);
}