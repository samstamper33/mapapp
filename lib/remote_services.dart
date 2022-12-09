import 'package:passmate/poi.dart';
import 'package:http/http.dart' as http;

class RemoteService 
{
  Future<List<PointOfInterest>?> getPoi () async {
    var client = http.Client();

    var uri = Uri.parse('https://b2b-passmate-dashboard.bubbleapps.io/version-test/api/1.1/obj/pointofinterest');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return pointOfInterestFromJson(json);
    }
  }
}