import 'package:http/http.dart' as http;

const String baseUrl = 'https://b2b-passmate-dashboard.bubbleapps.io/version-test/api/1.1/obj/';

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url);
    if(response.statusCode == 200) {
      return response.body;
    }
    else {
      //throw exception
    }
  }
}