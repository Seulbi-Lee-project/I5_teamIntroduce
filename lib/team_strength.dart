import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      bool passwordBool = false;
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
                            leading: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("비밀번호확인"),
                                        content: TextField(
                                          maxLength: 4,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]'))
                                          ],
                                          onSubmitted: (value) {
                                            int passwordCheck =
                                                int.parse(value);
                                            passwordBool = teamStrengthService
                                                .passwordCheck(
                                                    index: index,
                                                    password: passwordCheck);
                                          },
                                        ),
                                        actions: <Widget>[
                                          FloatingActionButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              passwordBool
                                                  ? showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title:
                                                              Text("수정하시겠습니까?"),
                                                          content: TextField(
                                                            decoration: InputDecoration(
                                                                label: Text(teamStrengthService
                                                                    .strengthCommentList[
                                                                        index]
                                                                    .comment)),
                                                            onSubmitted:
                                                                (value) {
                                                              teamStrengthService
                                                                  .updateStrengthComment(
                                                                      index:
                                                                          index,
                                                                      comment:
                                                                          value);
                                                            },
                                                          ),
                                                          actions: <Widget>[
                                                            FloatingActionButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text("ok"),
                                                            ),
                                                            FloatingActionButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                teamStrengthService
                                                                    .deleteStrengthComment(
                                                                        index: strengthCommentList.length -
                                                                            1);
                                                              },
                                                              child: Text(
                                                                  "cancle"),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    )
                                                  : Navigator.of(context).pop();
                                            },
                                            child: Text("0k"),
                                          ),
                                          FloatingActionButton(
                                            onPressed: () {},
                                            child: Text("cancle"),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.update)),
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("비밀번호를 설정하시겠습니까?"),
                                  content: TextField(
                                    maxLength: 4,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'))
                                    ],
                                    onSubmitted: (value) {
                                      int password = int.parse(value);
                                      teamStrengthService
                                          .updateStrengthPassword(
                                              password: password,
                                              index:
                                                  strengthCommentList.length -
                                                      1);
                                    },
                                  ),
                                  actions: <Widget>[
                                    FloatingActionButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("ok"),
                                    ),
                                    FloatingActionButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        teamStrengthService
                                            .deleteStrengthComment(
                                                index:
                                                    strengthCommentList.length -
                                                        1);
                                      },
                                      child: Text("cancle"),
                                    ),
                                  ],
                                );
                              },
                            );
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
