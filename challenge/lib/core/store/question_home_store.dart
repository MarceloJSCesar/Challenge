import 'package:mobx/mobx.dart';

part 'question_home_store.g.dart';

class QuestionHomeStore = _QuestionHomeStoreBase with _$QuestionHomeStore;

abstract class _QuestionHomeStoreBase with Store {
  @observable
  int questionIndex = 0;
}
