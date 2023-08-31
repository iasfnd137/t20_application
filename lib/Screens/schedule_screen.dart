import 'package:flutter/material.dart';
import 'package:t2020_app/Models/schedule_model.dart';
import 'package:t2020_app/Utility/schedule_data.dart';
//string data ak he method lod krta hy jo hmry sat hy defaultasset bundel

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder<List<ScheduleModel>>(
          future: ScheduleData.getAllMatches(context),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              List<ScheduleModel> myData = snapshot.data;
              return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context,index){
                  ScheduleModel match = snapshot.data[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 13,),
                        Text(match.date,style: TextStyle(fontSize: 20,color: Colors.white),),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                ClipRRect( 
                                  borderRadius: BorderRadius.circular(13),
                                    child: Image.asset('assets/flags/${match.flagOne}',height: 50,width: 70,fit: BoxFit.cover,)),
                                const SizedBox(width: 13,),
                                Text(match.teamOne,style: TextStyle(color: Colors.white),),
                              ],
                            ),
                            const Text('Vs',style: TextStyle(color: Colors.white),),
                            Row(
                              children: [
                                Text(match.teamTwo,style: TextStyle(color: Colors.white),),
                                const SizedBox(width: 13,),
                                ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                    child: Image.asset('assets/flags/${match.flagTwo}',height: 50,width: 70,fit: BoxFit.cover,)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Text(match.venue,style: TextStyle(color: Colors.white),),
                        const SizedBox(height: 10,),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 50,
                              width: 90,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),),
                              ),
                              child: Center(child: Text('Group: ${match.group}',style: const TextStyle(color: Colors.white),)),
                            ),
                          ),
                        )
                      ],

                    ),
                  );
                },
              );

            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

