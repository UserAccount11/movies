import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  
  @override
  String get searchFieldLabel => 'Buscar películas';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Text('buildActions')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, query),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('buildSuggestions: $query');
  }

  
}