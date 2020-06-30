import 'dart:convert';

import 'package:http/http.dart' as http;

fetchData(String path,
    {String method = "get",
    Map<String, dynamic> body,
    Map<String, dynamic> header}) async {
  Map<String, dynamic> returnResponce = new Map();

  Map<String, String> finalHeaders = {'Accept': 'application/json'};
  if (header != null) {
    finalHeaders.addAll(header);
  }

  http.Response response;
  try {
    if (method == "get") {
      response = await http.get(Uri.encodeFull(path), headers: finalHeaders);
    } else {
      response = await http.post(Uri.encodeFull(path),
          headers: finalHeaders, body: body);
    }

    var jsonResponce = json.decode(response.body);
    if (!jsonResponce.containsKey('success')) {
      returnResponce['errorMsg'] = jsonResponce['message'];
    } else {
      returnResponce['data'] = jsonResponce;
    }
  } catch (e) {
    print(e.toString());
    returnResponce['errorMsg'] = "Failed To Fetch";
  }

  return returnResponce;
}
