/*
 * Copyright (c) 2022 Aspose Pty Ltd. All Rights Reserved.
 *
 * Licensed under the MIT (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://github.com/aspose-omr-cloud/aspose-omr-cloud-dotnet/blob/master/LICENSE
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

part of omr.api;

class OMRError {
  List<String> messages = [];

  List<String> warnings = [];

  OMRError();

  @override
  String toString() {
    return 'OMRError[messages=$messages, warnings=$warnings, ]';
  }

  OMRError.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    messages =
        (json['messages'] as List).map((item) => item as String).toList();
    warnings =
        (json['warnings'] as List).map((item) => item as String).toList();
  }

  Map<String, dynamic> toJson() {
    return {'messages': messages, 'warnings': warnings};
  }

  static List<OMRError> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new OMRError.fromJson(value)).toList();
  }

  static Map<String, OMRError> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, OMRError>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new OMRError.fromJson(value));
    }
    return map;
  }
}
