import 'package:flutter/material.dart';
import 'package:t2020_app/Models/team_model.dart';
import 'package:t2020_app/Utility/team_data.dart';
//api firebase or local json ye sary ak he jason hy
//api start ya list sy hoga ya map sy hoga
//api local json nai hy globle json hy
//firebase main ak json file hota hy wo hum downlod karngy lakin wo file jub hum dhkngy wo khali hoga
//firebase main keyvalue pair firebase waly khud automatically set kar dety hy
class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Teams'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder <List<TeamModel>>(
          future: TeamData.getAllTeams(context),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              List<TeamModel> mydata = snapshot.data;
              return ListView.builder(
                itemCount: mydata.length,
                itemBuilder: (context,index){
                  TeamModel teams = snapshot.data[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                            child: Image.asset(teams.flag,height: 60,width: 80,fit: BoxFit.cover,)),
                        SizedBox(width: 12,),
                        Text(teams.fullName,style: TextStyle(fontSize: 20,color: Colors.white),),
                      ],
                    ),
                  );
                },
              );
            }else
              {
                return Center(child: CircularProgressIndicator());
              }
          },
        ),
      ),
    );
  }
}
