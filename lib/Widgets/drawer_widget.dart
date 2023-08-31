import 'package:flutter/material.dart';
import 'package:t2020_app/Screens/history_screen.dart';
import 'package:t2020_app/Screens/schedule_screen.dart';
import 'package:t2020_app/Screens/team_screen.dart';
import 'package:t2020_app/Screens/venue_screen.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
              child: Column(
            children: [
              SizedBox(height: 10,),
              Icon(Icons.highlight,color: Colors.white,size: 80,),
              SizedBox(height: 10,),
              Text('T20 World Cup',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            ],
          )),
          ListTile(
            onTap: (){
              Navigator.of(context).pop();

            },
            leading: Icon(Icons.home,color: Colors.white,),
            title: Text('Home',style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return ScheduleScreen();
              }));
            },
            leading: Icon(Icons.access_time,color: Colors.white,),
            title: Text('Schedule',style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return VenueScreen();
              }));
            },
            leading: Icon(Icons.location_on,color: Colors.white,),
            title: Text('Venue',style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return HistoryScreen();
              }));
            },
            leading: Icon(Icons.history,color: Colors.white,),
            title: Text('History',style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return TeamScreen();
              }));
            },
            leading: Icon(Icons.group,color: Colors.white,),
            title: Text('Team',style: TextStyle(color: Colors.white),),
          ),
          Divider(
            thickness: 3,
            color: Colors.white,
          ),
          ListTile(
            onTap: (){
            },
            leading: Icon(Icons.star,color: Colors.white,),
            title: Text('Rate App',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
