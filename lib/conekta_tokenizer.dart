
import 'package:conekta_tokenizer/conekta_card.dart';

import 'conekta_tokenizer_platform_interface.dart';

class ConektaTokenizer {
  Future<String?> getPlatformVersion() {
    return ConektaTokenizerPlatform.instance.getPlatformVersion();
  }

  Future<bool?> setApiKey(String apiKey){
    return ConektaTokenizerPlatform.instance.setApiKey(apiKey);
  }

  Future<String> createCardToken(ConektaCard card){
    return ConektaTokenizerPlatform.instance.createCardToken(card);
  }
}
