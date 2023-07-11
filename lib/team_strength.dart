import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.5,
              child: Image.network(
                  "https://t1.daumcdn.net/cfile/tistory/99ABCF3D5C62B55503"),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: memberList.length,
                  itemBuilder: (context, index) {
                    Member member = memberList[index];
                    return ListTile(
                      title: Text(member.name),
                      subtitle: Text(member.merit.isEmpty
                          ? "장점을 서술하지 않았습니다."
                          : member.merit),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
