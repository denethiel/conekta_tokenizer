import 'package:conekta_tokenizer/conekta_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'conekta_tokenizer_platform_interface.dart';

const String _SET_API_KEY_METHOD_NAME = 'setApiKey';
const String _ON_CREATE_CARD_TOKEN_NAME = 'onCreateCardToken';

/// An implementation of [ConektaTokenizerPlatform] that uses method channels.
class MethodChannelConektaTokenizer extends ConektaTokenizerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('conekta_tokenizer');

  @override
  Future<bool?> setApiKey(String apiKey) => methodChannel.invokeMethod(_SET_API_KEY_METHOD_NAME,{'apiKey': apiKey});

  @override
  Future<String> createCardToken(ConektaCard card) async {
    final String token = await methodChannel.invokeMethod(_ON_CREATE_CARD_TOKEN_NAME, card.toMap);
    return token;
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
