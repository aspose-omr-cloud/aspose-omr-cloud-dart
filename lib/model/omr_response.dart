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

class OMRResponse {
  String? id = null;

  ResponseStatusCode? responseStatusCode = null;

  List<OMRResult> results = [];

  OMRError? error = null;

  OMRResponse();

  @override
  String toString() {
    return 'OMRResponse[id=$id, responseStatusCode=$responseStatusCode, results=$results, error=$error, ]';
  }

  OMRResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    responseStatusCode =
        new ResponseStatusCode.fromJson(json['responseStatusCode']);
    if (json['results'] != null) {
      results = OMRResult.listFromJson(json['results']);
    } else {
      results = [];
    }

    if (json['error'] != null) {
      error = new OMRError.fromJson(json['error']);
    } else {
      error = null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'responseStatusCode': responseStatusCode,
      'results': results,
      'error': error
    };
  }

  static List<OMRResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new OMRResponse.fromJson(value)).toList();
  }

  static Map<String, OMRResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, OMRResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new OMRResponse.fromJson(value));
    }
    return map;
  }
}
