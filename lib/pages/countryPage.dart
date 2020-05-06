import 'package:covid19_tracker/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCountryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){

            showSearch(context: context, delegate: Search(countryData));

          })
        ],
        title: Text("Country Statistics "),
      ),
      body: countryData == null ? Center(child: CircularProgressIndicator(),)  : ListView.builder(
        itemBuilder: (context,index) {
          return Container(
            height: 130,
            child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold), ),
                      Image.network(countryData[index]['countryInfo']['flag'], height: 50,width: 60,  ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Confirmed: " + countryData[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange ), ),
                        Text("Active: " + countryData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue ), ),
                        Text("Recovered: " + countryData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green ), ),
                        Text("Deaths: " + countryData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red ), ),
                        
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: countryData == null ? 0 : countryData.length,
      ),
    );
  }
}