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

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {
  String basePath = "";
  var client = new Client();
  var config = new Config();

  Map<String, String> _defaultHeaderMap = {};

  final _RegList = new RegExp(r'^List<(.*)>$');
  final _RegMap = new RegExp(r'^Map<String,(.*)>$');

  //ApiClient({this.basePath}); //This you already had before
  ApiClient.empty();
  ApiClient(String path, Config config) {
    this.basePath = path;
    this.config = config;
  }

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'BubbleSize':
          return new BubbleSize.fromJson(value);
        case 'Color':
          return new Color.fromJson(value);
        case 'FontStyle':
          return new FontStyle.fromJson(value);
        case 'OMRError':
          return new OMRError.fromJson(value);
        case 'OMRResponse':
          return new OMRResponse.fromJson(value);
        case 'OMRResult':
          return new OMRResult.fromJson(value);
        case 'OmrGenerateTask':
          return new OmrGenerateTask.fromJson(value);
        case 'OmrRecognizeTask':
          return new OmrRecognizeTask.fromJson(value);
        case 'Orientation':
          return new Orientation.fromJson(value);
        case 'PageSettings':
          return new PageSettings.fromJson(value);
        case 'PaperSize':
          return new PaperSize.fromJson(value);
        case 'ResponseStatusCode':
          return new ResponseStatusCode.fromJson(value);
        case 'S3DataType':
          return new S3DataType.fromJson(value);
        default:
          {
            RegExpMatch? match;
            if (value is List &&
                (match = _RegList.firstMatch(targetType)) != null) {
              var newTargetType = match![1];
              return value.map((v) => _deserialize(v, newTargetType!)).toList();
            } else if (value is Map &&
                (match = _RegMap.firstMatch(targetType)) != null) {
              var newTargetType = match![1];
              return new Map.fromIterables(value.keys,
                  value.values.map((v) => _deserialize(v, newTargetType!)));
            }
          }
      }
    } on Exception catch (e, stack) {
      throw new ApiException.withInner(
          0, 'Exception during deserialization.', e, stack);
    }
    throw new ApiException(
        0, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String jsonVal, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return jsonVal;

    var decodedJson = json.decode(jsonVal);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object? obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  Future<String> getToken() async {
    String url = config.authUrl;
    var map = new Map<String, dynamic>();
    map['grant_type'] = 'client_credentials';
    map['client_id'] = config.clientId;
    map['client_secret'] = config.clientSecret;
    Response resp = await client.post(Uri.parse(url), body: map);
    AuthResponse r = AuthResponse.fromJson(jsonDecode(resp.body));
    return r.tokenType! + " " + r.token!;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(
      String path,
      String method,
      List<QueryParam> queryParams,
      Object? body,
      Map<String, String> headerParams,
      Map<String, String> formParams,
      String contentType,
      List<String> authNames) async {
    var ps = queryParams
        .where((p) => p.value != null)
        .map((p) => '${p.name}=${p.value}');
    String queryString = ps.isNotEmpty ? '?' + ps.join('&') : '';

    String url = basePath + path + queryString;

    if (headerParams.isEmpty) {
      headerParams['Content-Type'] = contentType;
    }
    headerParams['Authorization'] = await getToken();
    headerParams.addAll(_defaultHeaderMap);

    if (body is MultipartRequest) {
      var request = new MultipartRequest(method, Uri.parse(url));
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return Response.fromStream(response);
    } else {
      var msgBody = contentType == "application/x-www-form-urlencoded"
          ? formParams
          : serialize(body);
      switch (method) {
        case "POST":
          return client.post(Uri.parse(url),
              headers: headerParams, body: msgBody);
        case "PUT":
          return client.put(Uri.parse(url),
              headers: headerParams, body: msgBody);
        case "DELETE":
          return client.delete(Uri.parse(url), headers: headerParams);
        case "PATCH":
          return client.patch(Uri.parse(url),
              headers: headerParams, body: msgBody);
        default:
          return client.get(Uri.parse(url), headers: headerParams);
      }
    }
  }
}
