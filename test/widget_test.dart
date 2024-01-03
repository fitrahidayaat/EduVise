import 'package:flutter_test/flutter_test.dart';
import 'package:eduvise/src/features/core/providers/models_provider.dart';

void main() {
  group('ModelsProvider', () {
    ModelsProvider modelsProvider = ModelsProvider();

    setUp(() {
      modelsProvider = ModelsProvider();
    });
    test('getCurrentModel returns current model', () {
      expect(modelsProvider.getCurrentModel, equals("gpt-3.5-turbo"));
    });

    test('setCurrentModel updates current model', () {
      modelsProvider.setCurrentModel("text-davinci-001");
      expect(modelsProvider.getCurrentModel, equals("text-davinci-001"));
    });
  });
}
  
