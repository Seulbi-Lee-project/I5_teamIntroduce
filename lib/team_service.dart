import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'member_view.dart';

class Team {
  Team({
    required this.character,
    required this.goal,
    required this.promise,
  });

  String character;
  String goal;
  String promise;
}

class TeamService extends ChangeNotifier {
  Team team = Team(character: 'character', goal: 'goal', promise: 'promise');

  updateTeam({
    required String character,
    required String goal,
    required String promise,
  }) {
    team.character = character;
    team.goal = goal;
    team.promise = promise;
    notifyListeners();
  }
}
