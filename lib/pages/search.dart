import 'package:covid19_tracker/datasource.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';


class Search extends SearchDelegate {
  
  
  final List countryList;

  Search(this.countryList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryBlack,
      brightness: DynamicTheme.of(context).brightness
    );
  }
  
  // list of widget u want to display in appbar

  @override
  List<Widget> buildActions(BuildContext context) {

      return [
        IconButton(icon: Icon(Icons.clear), onPressed: (){
          query = ''; // WHAT EVER WE WRITE IN THE SEARCH BAR
        })
      ];   

      
    }
  

    /* leading : icon you want to 
    have in lefft side while searching 
    ( example: back icon)
    */
  @override
  Widget buildLeading(BuildContext context) {
      return IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
        Navigator.pop(context);
      },);
    }


    /*

    */
  
    @override
    Widget buildResults(BuildContext context) {
      return Container();
    }
  
    /*
        Suggestioons in the list

    */

    @override
    Widget buildSuggestions(BuildContext context) {

    final suggestionList = query.isEmpty?countryList : countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();


    return ListView.builder(
      itemCount: suggestionList.length,
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
                      Text(suggestionList[index]['country'],style: TextStyle(fontWeight: FontWeight.bold), ),
                      Image.network(suggestionList[index]['countryInfo']['flag'], height: 50,width: 60,  ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Confirmed: " + suggestionList[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange ), ),
                        Text("Active: " + suggestionList[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue ), ),
                        Text("Recovered: " + suggestionList[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green ), ),
                        Text("Deaths: " + suggestionList[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red ), ),
                        
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
      },
    );
  }
  
}