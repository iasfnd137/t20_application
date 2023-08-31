import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:t2020_app/Screens/history_screen.dart';
import 'package:t2020_app/Screens/schedule_screen.dart';
import 'package:t2020_app/Screens/team_screen.dart';
import 'package:t2020_app/Screens/venue_screen.dart';
import 'package:t2020_app/Utility/connectivity.dart';
import 'package:t2020_app/Widgets/drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widgets/home_item.dart';
//drawer headr ky sat jo upar menue hy uska bi color chnge krna hy home work or iska code main ,main hota hy 2 line ka code hy
//api ka mtlb hy jo interface main hamry sat nazr araha hy wo pehly sy hamry sat api main mojiod hoita hy us data ko serf access karty hy humm
//api ky 3 type hoty hy free api paid api personal api
//free api log kuch maqsad  liye rakty hy ky koei ads waghira lagye log ya hum apny program main add karty hy
//kuch api paid hoty hy jasy fottbla main hgoty hy wo paid hoty hy sall main ya mionth main hum oesy dety hy
//personal api wo hoty hy ju hum serf apny liye use karty hy kisi ko send nai karty
//post api free nai milty is main hum data bhjty hy
//grt api free milty hy hum data get karty hy is ka zariye
//postman ko install krna hy
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'T20 World Cup',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.star,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          children: [
            HomeItem(
                title: 'Schedule',
                iconData: Icons.access_time,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return const ScheduleScreen();
                  })) ;
                }),
            HomeItem(
                title: 'Venues',
                iconData: Icons.location_on_outlined,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return const VenueScreen();
                  }));
                }),
            HomeItem(
                title: 'History',
                iconData: Icons.history,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return HistoryScreen();
                  }));
                }),
            HomeItem(
                title: 'Teams',
                iconData: Icons.group,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                    return TeamScreen();
                  }));
                }),
            HomeItem(
                title: 'LiveScore',
                iconData: Icons.live_tv,
                onPressed: () async{
                  // or conectivity ky liye bi hum dependecy add karngy
                  //jub hum url lod krty hy yahan par sub sy pehly hum dependicies add karngy lunch url ky name hy
                  //jub hum veriable name ky sat underscore lety hy iska mtlb hy ye private hy like _url
                  var _url = 'https://www.icc-cricket.com/live-cricket/live';
                 if(await ConnectivityData().isConnected()) {
                   if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
                 }else {
                    Fluttertoast.showToast(
                       msg: "please provide internet connection",
                       toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.CENTER,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.red,
                       textColor: Colors.white,
                       fontSize: 20.0
                   );
                 }
                }),
            HomeItem(
                title: 'Highlights',
                iconData: Icons.video_call_outlined,
                onPressed: () async{
                  var _url = 'https://www.youtube.com/';
                  if(await ConnectivityData().isConnected()) {
                  if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
                  }else {
                  Fluttertoast.showToast(
                  msg: "please provide internet connection",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 20.0
                  );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
