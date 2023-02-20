import 'package:flutter/material.dart';
class MySearchDelegate extends SearchDelegate{
  final lists=[
    "000000000","333333333333","55555","22222",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return  Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   var data=query.isEmpty? lists:lists.where((element) => element.startsWith(query)).toList();

   return
     data.isNotEmpty?

     ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color:  Colors.black,
            child: Center(child: Text(data[index],style: TextStyle(color: Colors.white),))),
      );
    },

    ):Center(child: Container(child: Center(child: Text("not show")),));
  }
  
}