import 'package:flutter_test/flutter_test.dart';
import 'package:pixabay_list/data/data_sources/local/storage/storage.dart';

class FakeStorage extends Fake implements Storage {}

void main() {
  test('Storage can be implemented', () {
    expect(FakeStorage.new, returnsNormally);
  });

  test('exports StorageException', () {
    expect(() => const StorageException('oops'), returnsNormally);
  });
}
