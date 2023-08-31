import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:t2020_app/Models/team_model.dart';

class TeamData{

  static Future<List<TeamModel>> getAllTeams(BuildContext context)async{
    var teams = <TeamModel>[];

    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var teamData = jsonData['teams'];
    for(var teamsData in teamData){
      TeamModel teamModel = TeamModel.fromJSON(teamsData);
      teams.add(teamModel);
    }
    return teams;
  }

}