import 'package:conekta_tokenizer/conekta_card.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'conekta_tokenizer_method_channel.dart';

abstract class ConektaTokenizerPlatform extends PlatformInterface {
  /// Constructs a ConektaTokenizerPlatform.
  ConektaTokenizerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ConektaTokenizerPlatform _instance = MethodChannelConektaTokenizer();

  /// The default instance of [ConektaTokenizerPlatform] to use.
  ///
  /// Defaults to [MethodChannelConektaTokenizer].
  static ConektaTokenizerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ConektaTokenizerPlatform] when
  /// they register themselves.
  static set instance(ConektaTokenizerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> setApiKey(String apiKey){
    throw UnimplementedError('setApi() has not been implemented');
  }

  Future<String> createCardToken(ConektaCard card){
    throw UnimplementedError('createCardToken has not beeen implemented');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
