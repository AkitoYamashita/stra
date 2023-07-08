import "package:flutter_test/flutter_test.dart";
import "package:stra/utils/io.dart";
import "package:stra/utils/io_interface.dart";

class MockIo with Io implements IoInterface {}

void main() {
  final mock = MockIo();
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized(); // for rootBundle
  });
  group("file", () {
    test("loadText", () async {
      await mock.loadText("assets/tmp/.gitkeep");
    });
  });
}
