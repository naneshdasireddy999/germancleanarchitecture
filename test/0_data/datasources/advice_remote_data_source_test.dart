import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/scaffolding.dart';

void main() {
  late MockClient mockclinet;
  setUp(() {
    mockclinet = MockClient((request) async => Response('succeded', 200));
  });
  tearDown(() {
    mockclinet.close();
  });
  group('adviceremotedatasource', () {
    group('should return advice model', () {
      test('when client response was 200  and has valid data', () {});
    });
  });
}
