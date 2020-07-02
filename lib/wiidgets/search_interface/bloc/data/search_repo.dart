class SearchRepo {
  List<String> datas = [
    "Ali",
    "Akbar",
    "Andrue",
    "Balu",
    "Bashu",
    "Joshu",
    "Jose",
    "Joshuava",
    "Moidheen",
    "Yak",
    "Zebra"
  ];

  Future<List> getSearchResults(String query) async {
    await Future.delayed(Duration(seconds: 2));

    final returnResult =
        datas.where((element) => element.startsWith(query)).toList();

    if (returnResult.length == 0) {
      throw "Empty";
    }

    return returnResult;
  }
}
