import 'package:bookingapp/wiidgets/normal_text.dart';
import 'package:bookingapp/wiidgets/search_interface/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInterface extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  Widget buildSuggestions(BuildContext context) {
    //close(context, "Eminem");
    String queryString = query.trim();
    if (queryString != "") {
      BlocProvider.of<SearchBloc>(context).add(SearchQuery(query));

      return BlocConsumer(
        bloc: BlocProvider.of<SearchBloc>(context),
        listener: (context, state) {
          print("Search State Changed");
        },
        builder: (context, state) {
          //IF SEARCH ERROR
          if (state is SearchError) {
            return Center(
              child: createNormalText(state.errorMsg),
            );
            //IF SEARCH LOADING
          } else if (state is SearchLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
            //IF SEARCH LOADED
          } else if (state is SearchLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text(state.result[index]),
                  onTap: () => close(context, state.result[index]),
                );
              },
              itemCount: state.result.length,
            );
          }
          //INITIAL STATE
          return Container();
        },
      );
    }
    //IF SEARCH QUERY IS EMPTY
    return Container();
  }
}
