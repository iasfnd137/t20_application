//var matches ko hum khali list pas karngy
//var assetbundell ko hum Defultasset bundel pass karngy . of context
//var data ko hum assetbundel.loadstring(key main wo location pass karngy)
//var jasondata ko hum lason.decode or data valuible pass karngy
// var scheduladata ko hum jasondata pass kardangy or phis us main wo jason file sy scedule pass kar langy
//for loop use karngy q k hamry sat schedule main 3 mapp hy tu loop ak ak map k liye bar bar use karonga
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../Models/schedule_model.dart';
//jub hum wibsite invalve karngy ak app main tu humm webview use karty hy
//jub medthod satatic na ho tu hum xonstructor lagaingy
class ScheduleData{

   static Future<List<ScheduleModel>> getAllMatches(BuildContext context) async{
     //data dely karna jan boj kar
     await Future.delayed(Duration(seconds: 1));
      var matches = <ScheduleModel>[];
      //read data from jason to this
      var assetsBundle = DefaultAssetBundle.of(context);
      var data = await assetsBundle.loadString('assets/data/ttwenty.json');
      var jsonData = json.decode(data);
      var scheduleData = jsonData['schedule'];
      for(var matcheData in scheduleData){
         ScheduleModel scheduleModel = ScheduleModel.fromJSON(matcheData);
         matches.add(scheduleModel);
      }
      return matches;
   }
}