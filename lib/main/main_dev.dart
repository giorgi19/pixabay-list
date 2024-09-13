import 'package:pixabay_list/app/view/app.dart';
import 'package:pixabay_list/main/bootstrap/bootstrap.dart';

void main() {
  bootstrap(
    (
      sharedPreferences,
    ) async {
      return const App();
    },
  );
}
