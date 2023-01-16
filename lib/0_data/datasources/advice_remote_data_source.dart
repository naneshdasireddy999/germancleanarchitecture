import 'package:dfg/0_data/exception/exceptions.dart';
import 'package:dfg/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  ///requests random advice from api return 'advicemodel' if successful
  ///throws server exception if status code is not 200
  Future<AdviceModel> getrandomadvicefromapi();
}

class AdviceRemoteDatasourceimpl implements AdviceRemoteDatasource {
  AdviceRemoteDatasourceimpl({required this.client});
  final http.Client client;
  @override
  Future<AdviceModel> getrandomadvicefromapi() async {
    var response = await client
        .get(Uri.parse('https://api.flutter-community.de/api/v1/advice'));
    if (response.statusCode == 200) {
      var jsonstring = response.body;
      return adviceModelFromJson(jsonstring);
    } else {
      throw ServerException();
    }
  }
}
