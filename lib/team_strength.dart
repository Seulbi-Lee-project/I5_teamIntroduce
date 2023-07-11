import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'member_view.dart';
import 'member_service.dart';

class TeamStrength extends StatelessWidget {
  const TeamStrength({super.key});

  @override
  Widget build(BuildContext context) {
    List<Member> memberList = MemberService().memberList;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
              itemCount: memberList.length,
              itemBuilder: (context, index) {
                Member member = memberList[index];
                return ListTile(
                  title: Text(member.name),
                  subtitle: Text(
                      member.merit.isEmpty ? "장점을 서술하지 않았습니다." : member.merit),
                );
              }),
        ),
      )),
    );
  }
}
