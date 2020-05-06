import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';



class CovidChart extends StatelessWidget {

  final Map worldData;

  const CovidChart({Key key, this.worldData}) : super(key: key);

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
        }),
      ),
    );
  }
}