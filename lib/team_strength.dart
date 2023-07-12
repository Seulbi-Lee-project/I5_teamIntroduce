import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_service.dart';
import 'team_strength_service.dart';

class TeamStrength extends StatefulWidget {
  const TeamStrength({super.key});

  @override
  State<TeamStrength> createState() => _TeamStrengthState();
}

class _TeamStrengthState extends State<TeamStrength> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    MemberService memberService = context.read<MemberService>();
    return Consumer<TeamStrengthService>(
        builder: (context, teamStrengthService, index) {
      List<StrengthComment> strengthCommentList =
          teamStrengthService.strengthCommentList;
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: memberService.memberList.length,
                      itemBuilder: (context, index) {
                        Member member = memberService.memberList[index];
                        return ListTile(
                          title: Text(member.name),
                          subtitle: Text(member.merit.isEmpty
                              ? "장점을 서술하지 않았습니다."
                              : member.merit),
                        );
                      })),
              Text("댓글란"),
              Expanded(
                child: teamStrengthService.strengthCommentList.isEmpty
                    ? Center(child: Text("댓글이 없습니다."))
                    : ListView.builder(
                        itemCount:
                            teamStrengthService.strengthCommentList.length,
                        itemBuilder: (context, index) {
                          StrengthComment strengthComment =
                              strengthCommentList[index];
                          return ListTile(
                            title: Text(strengthComment.comment),
                            trailing: IconButton(
                                onPressed: () {
                                  teamStrengthService.deleteStrengthComment(
                                      index: index);
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
                            teamStrengthService.createStrengthComment(
                                comment: value);
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
    });
  }
}
