import 'package:dfg/0_data/datasources/advice_remote_data_source.dart';
import 'package:dfg/0_data/models/advice_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'advice_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
//the above annotation is used to generate mocks(so its mandatory)
//the above annotation is indication to mockito package to generate mocks for http client
//to generate mocks type following command
//flutter pub run build_runner build
//then it will generate mocks
//it will generate another file with test.mocks suffix in test folder
//now start writing test cases with mock http client
void main() {
  late MockClient mockclient;
  setUp(() {
    mockclient = MockClient();
  });
  tearDown(() {
    mockclient.close();
  });
  //here iam testing advice remote datasource thats why group  name is like that
  group('adviceremotedatasource', () {
    group('should return advicemodel', () {
      test(
          //this is for success api call
          'should return sucess response when api response was 200 and get valid data',
          () async {
        //this is for success api call
        //now we have to mock api call with mockito package
        //arrange
        //build runner package will be used to generate our mocks
        //so add build runner dependency
        //add both packages in dev dependencies

        //this mockclient will try to hit mocked api call not actual api call
        //the below code infers that we are calling mockclients to fetch response from the data passed
        //we will return mock response
        //the status code is 200
        //the response is in form of list of maps
        //arrange
        final responsebody = {
          "advice_id": 21,
          "advice":
              "Erledigen Sie die wichtige Aufgabe zuerst - Sie brauchen mich nicht, um Ihnen das zu sagen, wenn es nicht getan werden muss, dann war es auch nicht wichtig, um damit zu beginnen."
        };
        when(mockclient.get(Uri.parse(adviceapiurl))).thenAnswer(
            (realInvocation) async => http.Response('$responsebody', 200));
        //act and assert
        //fetchbooks is url which takes mock http client
        //that should reurn response
        //the left side is actual response and right side is expected
        expect(
            await AdviceRemoteDatasourceimpl(client: mockclient)
                .getrandomadvicefromapi(),
            isA<AdviceModel>());
      });
    });
  });
}
