import 'package:dfg/0_data/exception/exceptions.dart';
import 'package:dfg/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

const adviceapiurl = 'https://api.flutter-community.de/api/v1/advice';

abstract class AdviceRemoteDatasource {
  //this is abstract class
  ///requests random advice from api return 'advicemodel' if successful
  ///throws server exception if status code is not 200
  Future<AdviceModel> getrandomadvicefromapi();
}

class AdviceRemoteDatasourceimpl implements AdviceRemoteDatasource {
  //this is implementation of abstract class
  AdviceRemoteDatasourceimpl({required this.client});
  final http.Client client;
  @override
  Future<AdviceModel> getrandomadvicefromapi() async {
    //please make a note that we are returning advicemodel not adviseentity
    //advice model extends adviceentity
    //the remote data source will convert raw json data to advicemodel object
    //here we can either get data from api or push data to api
    //this will return entity to repositry in data layer
    //here it will try to return advice model only
    //if something is wrong it will throw exception
    //please make a note that it will not return exception it will throw exception
    var response = await client.get(Uri.parse(adviceapiurl));
    if (response.statusCode == 200) {
      var jsonstring = response.body;
      return adviceModelFromJson(jsonstring);
    } else if (response.statusCode != 200) {
      //if status code is not 200 we will throw server exception
      throw ServerException();
    } else {
      throw Exception();
    }
  }
}
