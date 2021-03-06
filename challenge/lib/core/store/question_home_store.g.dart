// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestionHomeStore on _QuestionHomeStoreBase, Store {
  final _$questionIndexAtom =
      Atom(name: '_QuestionHomeStoreBase.questionIndex');

  @override
  int get questionIndex {
    _$questionIndexAtom.reportRead();
    return super.questionIndex;
  }

  @override
  set questionIndex(int value) {
    _$questionIndexAtom.reportWrite(value, super.questionIndex, () {
      super.questionIndex = value;
    });
  }

  final _$_QuestionHomeStoreBaseActionController =
      ActionController(name: '_QuestionHomeStoreBase');

  @override
  void nextQuestion() {
    final _$actionInfo = _$_QuestionHomeStoreBaseActionController.startAction(
        name: '_QuestionHomeStoreBase.nextQuestion');
    try {
      return super.nextQuestion();
    } finally {
      _$_QuestionHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousQuestion() {
    final _$actionInfo = _$_QuestionHomeStoreBaseActionController.startAction(
        name: '_QuestionHomeStoreBase.previousQuestion');
    try {
      return super.previousQuestion();
    } finally {
      _$_QuestionHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void playAgain() {
    final _$actionInfo = _$_QuestionHomeStoreBaseActionController.startAction(
        name: '_QuestionHomeStoreBase.playAgain');
    try {
      return super.playAgain();
    } finally {
      _$_QuestionHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
questionIndex: ${questionIndex}
    ''';
  }
}
