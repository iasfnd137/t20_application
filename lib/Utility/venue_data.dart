import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:t2020_app/Models/venue_model.dart';

class VenueData{

  static Future<List<VenueModel>> getAllVenues(BuildContext context)async{
    await Future.delayed(Duration(seconds: 1));
    var venues = <VenueModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var venuesData = jsonData['venues'];
    for(var stadiumData in venuesData){
      VenueModel venueModel = VenueModel.fromJSON(stadiumData);
      venues.add(venueModel);
    }

    return venues;

  }

}
