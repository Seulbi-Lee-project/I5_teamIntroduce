import 'package:flutter/material.dart';
import 'member_service.dart';
import 'team_strength_service.dart';

class TeamStrength extends StatelessWidget {
  const TeamStrength({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    List<Member> memberList = MemberService().memberList;
    List<StrengthComment> strengthCommentList =
        TeamStrengthService().strengthCommentList;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   height: MediaQuery.of(context).size.width * 0.5,
            //   child: Image.network(
            //       "https://t1.daumcdn.net/cfile/tistory/99ABCF3D5C62B55503"),
            // ),
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
                    })),
            Text("댓글란"),
            Expanded(
              child: TeamStrengthService().strengthCommentList.isEmpty
                  ? Center(child: Text("댓글이 없습니다."))
                  : ListView.builder(
                      itemCount:
                          TeamStrengthService().strengthCommentList.length,
                      itemBuilder: (context, index) {
                        StrengthComment strengthComment =
                            strengthCommentList[index];
                        return ListTile(
                          title: Text(strengthComment.comment),
                          trailing: IconButton(
                              onPressed: () {
                                TeamStrengthService()
                                    .deleteStrengthComment(index: index);
                              },
                              icon: Icon(Icons.delete)),
                        );
                      },
                    ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        controller: myController,
                        decoration: InputDecoration(hintText: "댓글을 입력하세요."),
                        onSubmitted: (value) {
                          TeamStrengthService()
                              .createStrengthComment(comment: value);
                          myController.clear();
                        },
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
