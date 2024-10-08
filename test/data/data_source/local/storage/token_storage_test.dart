import 'package:flutter_test/flutter_test.dart';
import 'package:pixabay_list/data/data_sources/local/storage/token_storage.dart';

class FakeTokenStorage extends Fake implements TokenStorage {}

void main() {
  group('TokenStorage', () {
    test('TokenStorage can be implemented', () {
      expect(FakeTokenStorage.new, returnsNormally);
    });
  });

  group('InMemoryTokenStorage', () {
    test(
        'readToken returns null '
        'when no token is saved', () async {
      final storage = InMemoryTokenStorage();
      expect(await storage.readToken(), isNull);
    });

    test(
        'readToken returns token '
        'when token is saved with saveToken', () async {
      const token = 'token';
      final storage = InMemoryTokenStorage();
      await storage.saveToken(token);
      expect(await storage.readToken(), equals(token));
    });

    test(
        'readToken returns updated token '
        'when token is overridden with saveToken', () async {
      const token = 'token';
      const updatedToken = 'updatedToken';
      final storage = InMemoryTokenStorage();
      await storage.saveToken(token);
      expect(await storage.readToken(), equals(token));
      await storage.saveToken(updatedToken);
      expect(await storage.readToken(), equals(updatedToken));
    });

    test('clearToken clears token', () async {
      const token = 'token';
      final storage = InMemoryTokenStorage();
      await storage.saveToken(token);
      await storage.clearToken();
      expect(await storage.readToken(), isNull);
    });
  });
}
