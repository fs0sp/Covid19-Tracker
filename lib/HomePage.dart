import 'package:covid19_tracker/datasource.dart';
import 'package:covid19_tracker/panels/InfoPanel.dart';
import 'package:covid19_tracker/panels/mostaffectedtoday.dart';
import 'package:covid19_tracker/panels/mosteffectedcountries.dart';
import 'package:covid19_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

   List countryData;
  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  List countryAfftectedTodayData;
  fetchCountryTodayData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=todayCases');
    setState(() {
      countryAfftectedTodayData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    fetchCountryTodayData();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid19 Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Container(
              alignment: Alignment.center,
              height: 100,
              color: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(DataSource.quote,
                style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('WorldWide', 
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
               ),
               Container(
                 decoration: BoxDecoration(
                   color: primaryBlack,
                   borderRadius: BorderRadius.circular(15)
                 ),
                 padding: EdgeInsets.all(10),
                 child: Text('Regional',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold)),
               )
                ],
              )
              
            ),
            worldData == null ? CircularProgressIndicator() : WorldWidePannel(worldData: worldData,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Text('Most Affected Countries', 
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                 ),
            ),
            SizedBox(height: 10.0,),
            countryData == null ? Container() :  MostAffectedPanel(countryData: countryData,),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Text('Most Affected Countries Today', 
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                 ),
            ),
            SizedBox(height: 10.0,),
            countryAfftectedTodayData == null ? Container() :  MostAffectedToday(countryAfftectedTodayData: countryAfftectedTodayData,),
            SizedBox(height: 50,),
            InfoPanel(),

            SizedBox(height: 20,),
            Center(
              child: Text("Hacked By Shivam Pokhriyal",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}