
import 'package:flutter/material.dart';



class MostAffectedToday extends StatelessWidget {


final List countryAfftectedTodayData;

  const MostAffectedToday({Key key, this.countryAfftectedTodayData}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            child: Row(
              children: <Widget>[
                
                Image.network(countryAfftectedTodayData[index]['countryInfo']['flag'],height: 25.0,),
                SizedBox(width: 10.0,),
                Text(countryAfftectedTodayData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(width: 10.0,),
                Text('Deaths:' + countryAfftectedTodayData[index]['deaths'].toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,

                ),
                 ),
                 SizedBox(width: 10.0),
                 Text('Recovered:' + countryAfftectedTodayData[index]['recovered'].toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,

                ),
                 ),
              ],
            ),
          );

        },
        itemCount: 5,
      ),
    );
  }
}