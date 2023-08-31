import 'package:flutter/material.dart';
import 'package:t2020_app/Models/history_model.dart';
import 'package:t2020_app/Utility/history_data.dart';
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('History',style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder <List<HistoryModel>> (
        //future ka kam wo method acces karngy jis main hum ny data raka hy
        //builder main 2 chizy hy contxr or ak snapshot futer builder sy data uta ky snapshot ko dety hy
        future: HistoryData.getAllHistory(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<HistoryModel> myHistory = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: myHistory.length,
                itemBuilder: (context,index){
                  HistoryModel history = snapshot.data![index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 180,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                     child: Column(
                       children: [
                         SizedBox(height: 10,),
                         Text('Hosted By ${history.host}  ${history.year}',style: TextStyle(color: Colors.white,fontSize: 20),),
                         SizedBox(height: 10,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Text('Winner',style: TextStyle(color: Colors.white,fontSize: 18),),
                             Text('RunnerUp',style: TextStyle(color: Colors.white,fontSize: 18),),]),
                             SizedBox(height: 10,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Row(
                                   children: [
                                     ClipRRect(
                                     borderRadius: BorderRadius.circular(12),
                                         child: Image.asset('assets/flags/${history.winnerFlag}',height: 50,width: 70,fit: BoxFit.cover,)),
                                     SizedBox(width: 10,),
                                     Text(history.winner,style: TextStyle(color: Colors.white),),
                                   ],
                                 ),
                                 Text('Vs',style: TextStyle(color: Colors.white),),
                                 Row(
                                   children: [
                                     Text(history.runnerUp,style: TextStyle(color: Colors.white),),
                                     SizedBox(width: 10,),
                                     ClipRRect(
                                       borderRadius: BorderRadius.circular(12),
                                         child: Image.asset('assets/flags/${history.runnerUpFlag}',height: 50,width: 70,fit: BoxFit.cover,)),

                                   ],
                                 ),
                               ],
                             )

                           ],
                         )

                  );
                },
              ),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );

          }
        },
      ),
    );
  }
}
