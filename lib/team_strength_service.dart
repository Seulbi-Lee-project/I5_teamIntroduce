import 'dart:convert';
import 'package:flutter/material.dart';
import 'main.dart';

class StrengthComment {
  StrengthComment({
    required this.commentIndex,
    required this.comment,
    required this.password,
  });

  int commentIndex;
  int? password;
  String comment;

  Map toJson() {
    return {
      'commentIndex': commentIndex,
      'comment': comment,
      'password': password
    };
  }

  factory StrengthComment.fromJson(json) {
    return StrengthComment(
        commentIndex: json['commentIndex'],
        comment: json['comment'],
        password: json['password']);
  }
}

class TeamStrengthService extends ChangeNotifier {
  TeamStrengthService() {
    loadStrengthCommentList();
  }
  List<StrengthComment> strengthCommentList = [];

  createStrengthComment({
    required String comment,
  }) {
    StrengthComment stengthComment = StrengthComment(
        commentIndex: strengthCommentList.length,
        comment: comment,
        password: 0000);
    strengthCommentList.add(stengthComment);
    notifyListeners();
    saveStrengthCommentList();
  }

  updateStrengthComment({required index, required comment}) {
    StrengthComment updateComent = strengthCommentList[index];
    updateComent.comment = comment;
    if (comment.isNull) deleteStrengthComment(index: index);
    notifyListeners();
    saveStrengthCommentList();
  }

  saveStrengthCommentList() {
    List stengthCommentJsonList = strengthCommentList
        .map((strengthCommentList) => strengthCommentList.toJson())
        .toList();

    String jsonString = jsonEncode(stengthCommentJsonList);

    prefs.setString('StrengthCommentList', jsonString);
  }

  loadStrengthCommentList() {
    String? jsonString = prefs.getString('StrengthCommentList');

    if (jsonString == null) return; // null 이면 로드하지 않음

    List strengthCommentJsonList = jsonDecode(jsonString);

    strengthCommentList = strengthCommentJsonList
        .map((json) => StrengthComment.fromJson(json))
        .toList();
  }

  deleteStrengthComment({required int index}) {
    strengthCommentList.removeAt(index);
    notifyListeners();
  }

  updateStrengthPassword({required int password, required int index}) {
    StrengthComment strengthComment = strengthCommentList[index];
    strengthComment.password = password;
    notifyListeners();
  }

  passwordCheck({required int index, required int password}) {
    StrengthComment passwordcheck = strengthCommentList[index];
    if (passwordcheck.password == password) {
      return true;
    } else {
      return false;
    }
  }
}
