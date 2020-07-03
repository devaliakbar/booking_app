import 'package:bookingapp/widgets/normal_text.dart';
import 'package:bookingapp/widgets/search_interface/db/search_db_helper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SearchInterface extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchInterfaceState();
  }
}

class _SearchInterfaceState extends State<SearchInterface> {
  @override
  void initState() {
    super.initState();
    _getPreviousResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
        child: _buldBody(),
      ),
    );
  }

//DRAWER
  _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: TextField(
        cursorColor: Colors.grey,
        autofocus: true,
        controller: _searchController,
        onChanged: (_) => _searchTriggered(),
        decoration: InputDecoration.collapsed(
          hintText: "Search",
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            _searchController.text = "";
            _errorMsg = null;
            _loadFromHistory = true;
            setState(() {});
          },
        ),
      ],
    );
  }

//BODY
  _buldBody() {
    return _loadFromHistory
        ? _buildPreviousResults()
        : _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _errorMsg != null
                ? Center(
                    child: createNormalText(_errorMsg),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.search),
                        title: Text(results[index]),
                        onTap: () {
                          _addResult(results[index]);
                          Navigator.pop(context, results[index].trim());
                        },
                      );
                    },
                    itemCount: results.length,
                  );
  }

//FOR SEARCHING TEXTFIELD
  Timer _searchTimer = new Timer(Duration(milliseconds: 1), () {
    print("Initialised Timer");
  });
  TextEditingController _searchController = TextEditingController();
  _searchTriggered() {
    _searchTimer.cancel();
    _searchTimer = new Timer(
      Duration(seconds: 1),
      () {
        if (_searchController.text.trim() == "") {
          _errorMsg = null;
          _loadFromHistory = true;
          setState(() {});
        } else {
          _getSearchResult(_searchController.text.trim());
        }
      },
    );
  }

//VARIABLES FOR STATE MANAGEMENT
  bool _isLoading = false;
  String _errorMsg;
  List<String> results = [];

//PERFORMING SEARCH OPERATIONS
  _getSearchResult(String query) async {
    List<String> datas = [
      "Ali",
      "Akbar",
      "Andrue",
      "Balu",
      "Bashu",
      "Bob",
      "Joshu",
      "Jose",
      "Joshuava",
      "Moidheen",
      "Yak",
      "Zebra"
    ];

    if (mounted) {
      setState(() {
        _loadFromHistory = false;
        _isLoading = true;
      });
    }

    await Future.delayed(Duration(milliseconds: 500));

    results = datas
        .where(
            (element) => element.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    if (results.length == 0) {
      _errorMsg = "No Search Results";
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///                                     SQLITE SETUP FOR SEARCH HISTORY
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  List previousResults = [];
  bool _loadFromHistory = true;

  final SearchDBHelper dbHelper = SearchDBHelper.instance;
  _getPreviousResults() async {
    final allRows = await dbHelper.queryAllRows();
    allRows.forEach((row) => previousResults.add(row));
    setState(() {});
  }

  _addResult(String name) async {
    Map<String, dynamic> row = {SearchDBHelper.columnName: name};
    await dbHelper.insert(row);
    dbHelper.clearDb();
  }

  _buildPreviousResults() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.query_builder),
          title: Text(previousResults[index][SearchDBHelper.columnName]),
          trailing: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.grey,
              ),
              onPressed: () async {
                var id = previousResults[index][SearchDBHelper.columnId];
                previousResults.removeAt(index);
                dbHelper.delete(id);

                setState(() {});
              }),
          onTap: () {
            Navigator.pop(context,
                previousResults[index][SearchDBHelper.columnName].trim());
          },
        );
      },
      itemCount: previousResults.length,
    );
  }
}
