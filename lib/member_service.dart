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
      name: '배근태',
      mbti: 'ISTP',
      merit: '끈기 있습니다',
      style: '내가 할 일은 책임감 있게 합니다',
      blog: 'https://velog.io/@kt2790',
    ), // 더미(dummy) 데이터
    Member(
      name: '이슬비',
      mbti: 'ISTJ',
      merit: '실수가 적다',
      style: '숨은 강자',
      blog: 'https://velog.io/@ifssfws',
    ), // 더미(dummy) 데이터
    Member(
      name: '이승훈',
      mbti: 'INFJ',
      merit: '포기하지 않고 열심히 합니다',
      style: '민폐 안끼치고 할 일 하겠습니다',
      blog: 'https://hara9052.tistory.com/',
    ), // 더미(dummy) 데이터
    Member(
      name: '소준선',
      mbti: 'ISTP',
      merit: '평화주의자',
      style: '열심히 잘 따라갑니다',
      blog: 'https://junseon98.tistory.com/',
    ), // 더미(dummy) 데이터
    Member(
      name: '이동희',
      mbti: 'ISTJ',
      merit: '계획적이다',
      style: '열심히 따라함',
      blog: 'https://velog.io/@ldh7054',
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
