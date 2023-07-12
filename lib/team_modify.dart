import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'member_view.dart';
import 'team_service.dart';

class TeamModify extends StatefulWidget {
  TeamModify({super.key});
  String _character = '';
  String _goal = '';
  String _promise = '';
  @override
  State<TeamModify> createState() => _TeamModifyState();
}

class _TeamModifyState extends State<TeamModify> {
  TextEditingController characterController = TextEditingController();

  TextEditingController goalController = TextEditingController();

  TextEditingController promiseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TeamService teamService = context.read<TeamService>();
    characterController.text = teamService.team.character;
    goalController.text = teamService.team.goal;
    promiseController.text = teamService.team.promise;
    widget._character = teamService.team.character;
    widget._goal = teamService.team.goal;
    widget._promise = teamService.team.promise;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("팀 소개"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: characterController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 45.0),
                  hintText: "팀 특징을 입력해주세요.",
                ),
                onChanged: (value) {
                  widget._character = value;
                },
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: goalController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 45.0),
                  hintText: "팀 목표를 입력해주세요.",
                ),
                onChanged: (value) {
                  widget._goal = value;
                },
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: promiseController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 45.0),
                  hintText: "팀 약속을 입력해주세요.",
                ),
                onChanged: (value) {
                  widget._promise = value;
                },
              ),
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  teamService.updateTeam(
                      character: widget._character,
                      goal: widget._goal,
                      promise: widget._promise);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
