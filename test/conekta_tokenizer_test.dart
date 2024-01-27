import 'package:conekta_tokenizer/conekta_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:conekta_tokenizer/conekta_tokenizer.dart';
import 'package:conekta_tokenizer/conekta_tokenizer_platform_interface.dart';
import 'package:conekta_tokenizer/conekta_tokenizer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockConektaTokenizerPlatform
    with MockPlatformInterfaceMixin
    implements ConektaTokenizerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> createCardToken(ConektaCard card) {
    // TODO: implement createCardToken
    throw UnimplementedError();
  }

  @override
  Future<bool?> setApiKey(String apiKey) {
    // TODO: implement setApiKey
    throw UnimplementedError();
  }
}

void main() {
  final ConektaTokenizerPlatform initialPlatform = ConektaTokenizerPlatform.instance;

  test('$MethodChannelConektaTokenizer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelConektaTokenizer>());
  });

  test('getPlatformVersion', () async {
    ConektaTokenizer conektaTokenizerPlugin = ConektaTokenizer();
    MockConektaTokenizerPlatform fakePlatform = MockConektaTokenizerPlatform();
    ConektaTokenizerPlatform.instance = fakePlatform;

    expect(await conektaTokenizerPlugin.getPlatformVersion(), '42');
  });
}
