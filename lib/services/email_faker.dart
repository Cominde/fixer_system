

import 'package:faker/faker.dart';

class EmailFaker {
  static final Faker faker = Faker();

  static String generateUniqueEmail(String userName) {
    final DateTime now = DateTime.now();
    final String timestamp = now.microsecondsSinceEpoch.toString();
    final String domain = faker.internet.domainName();

    return '${userName.replaceAll(' ', '_')}$timestamp@$domain';
  }
}
