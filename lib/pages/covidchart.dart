import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class CovidChart extends StatefulWidget {
  @override
  _CovidChartState createState() => _CovidChartState();
}

class _CovidChartState extends State<CovidChart> {


  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchWorldWideData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualize'),
      ),
      body: Container(
        child: PieChart(dataMap: {
          'Confirmed' : worldData['cases'].toDouble(),
          'Active' : worldData['active'].toDouble(),
          'Recovered' : worldData['recovered'].toDouble(),
          'Deaths' : worldData['deaths'].toDouble(),
        },
        
        colorList: [

            Colors.orange[300],
            Colors.blue[300],
            Colors.green[300],
            Colors.red[500],

        ],
        
        ),
      ),
    );
  }
}