import 'package:faker/faker.dart';
import 'package:flutter_nakama/nakama.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../config.dart';

void main() {
  group('[gRPC] Test Authentication', () {
    late final NakamaBaseClient client;

    setUpAll(() {
      client = getNakamaClient(
        host: kTestHost,
        ssl: false,
        serverKey: kTestServerKey,
      );
    });

    test('login with email', () async {
      final session = await client.authenticateEmail(
        email: faker.internet.email(),
        password: faker.internet.password(),
      );

      expect(session, isNotNull);
    });

    test('login with device ID', () async {
      final session = await client.authenticateDevice(
        deviceId: faker.guid.guid(),
      );

      expect(session, isNotNull);
    });

    test('get personal account details', () async {
      final session = await client.authenticateEmail(
        email: faker.internet.email(),
        password: faker.internet.password(),
      );

      final account = await client.getAccount(session);

      expect(account, isNotNull);
    });
  });
}
