import 'package:flutter/material.dart';

class Member {
  Member({
    required this.name,
    required this.mbti,
    required this.merit,
    required this.style,
    required this.blog,
  });

  String name;
  String mbti;
  String merit;
  String style;
  String blog;

  Map toJson() {
    return {
      'name': name,
    };
  }

  factory Member.fromJson(json) {
    return Member(
      name: json['name'],
      mbti: json['mbti'],
      merit: json['merit'],
      style: json['style'],
      blog: json['blog'],
    );
  }
}

class MemberService extends ChangeNotifier {
  List<Member> memberList = [
    Member(
      name: '멤버1',
      mbti: '',
      merit: '',
      style: '',
      blog: 'https://velog.io/@ldh7054',
    ), // 더미(dummy) 데이터
    Member(
      name: '멤버2',
      mbti: '',
      merit: '',
      style: '',
      blog: '',
    ), // 더미(dummy) 데이터
    Member(
      name: '멤버3',
      mbti: '',
      merit: '',
      style: '',
      blog: '',
    ), // 더미(dummy) 데이터
    Member(
      name: '멤버4',
      mbti: '',
      merit: '',
      style: '',
      blog: '',
    ), // 더미(dummy) 데이터
    Member(
      name: '멤버5',
      mbti: '',
      merit: '',
      style: '',
      blog: '',
    ), // 더미(dummy) 데이터
  ];

  createMember({
    required String name,
    required String mbti,
    required String style,
    required String merit,
    required String blog,
  }) {
    Member member = Member(
      name: name,
      mbti: mbti,
      style: style,
      merit: merit,
      blog: blog,
    );
    memberList.insert(
        0, member); // Consumer<MemberService>의 builder 부분을 호출해서 화면 새로고침
    notifyListeners();
  }

  updateMember({
    required int index,
    required String name,
    required String mbti,
    required String style,
    required String merit,
    required String blog,
  }) {
    Member member = memberList[index];
    member.name = name;
    member.mbti = mbti;
    member.merit = merit;
    member.style = style;
    member.blog = blog;
    notifyListeners();
  }

  deleteMember({required int index}) {
    memberList.removeAt(index);
    notifyListeners();
  }
}
