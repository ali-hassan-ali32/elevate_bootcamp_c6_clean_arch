import 'dart:convert';

import 'package:injectable/injectable.dart';

@injectable
class Decoder {
  Map<String, dynamic> decode(String source) {
    return jsonDecode(source);
  }
}
