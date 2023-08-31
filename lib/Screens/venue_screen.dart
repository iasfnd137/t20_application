import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t2020_app/Models/venue_model.dart';
import 'package:t2020_app/Utility/venue_data.dart';
//splash screen hmry sat har ak app main hota hy app lanch hgony sy pehly hmary satjo screen atahy wo splash screen hota hy
//native splash pub div main sarch karngy iska mtlb hy splash screen
class VenueScreen extends StatelessWidget {
  const VenueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Venues',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<List<VenueModel>>(
          future: VenueData.getAllVenues(context),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<VenueModel> myVenue = snapshot.data;
              return ListView.builder(
                itemCount: myVenue.length,
                itemBuilder: (context, index) {
                  VenueModel venue = snapshot.data[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    height: 280,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Country: ${venue.country}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'City: ${venue.city}',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          venue.stadium,
                          style: TextStyle(fontSize: 20),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              venue.image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
