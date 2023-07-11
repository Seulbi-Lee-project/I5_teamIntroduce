import 'package:flutter/material.dart';

class StrengthComment {
  StrengthComment({
    required this.commentIndex,
    //required this.password,
    required this.comment,
  });

  int commentIndex;
  //int password;
  String comment;
}

class TeamStrengthService extends ChangeNotifier {
  List<StrengthComment> strengthCommentList = [
    StrengthComment(commentIndex: 0, comment: "coment"),
    StrengthComment(commentIndex: 1, comment: "test")
  ];

  createStrengthComment({
    //required int password,
    required String comment,
  }) {
    StrengthComment stengthComment = StrengthComment(
        commentIndex: strengthCommentList.length,
        //password: password,
        comment: comment);
    strengthCommentList.add(stengthComment);
    notifyListeners();
  }

  updateStrengthComment() {}

  deleteStrengthComment({required int index}) {
    strengthCommentList.removeAt(index);
    notifyListeners();
  }
}
