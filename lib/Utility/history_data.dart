import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:t2020_app/Models/history_model.dart';

class HistoryData{

  static Future<List<HistoryModel>> getAllHistory(BuildContext context)async{
   await Future.delayed(Duration(seconds: 1));
    var history = <HistoryModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var historyData = jsonData['history'];
    for(var allHistory in historyData){
      HistoryModel historyModel = HistoryModel.fromJSON(allHistory);
      history.add(historyModel);
    }
    return history;
  }
}