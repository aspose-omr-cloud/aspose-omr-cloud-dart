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

class ResponseStatusCode {
  /// The underlying value of this enum member.
  String? value;

  ResponseStatusCode._internal(this.value);

  static ResponseStatusCode ok_ = ResponseStatusCode._internal("Ok");
  static ResponseStatusCode partiallyNotFound_ =
      ResponseStatusCode._internal("PartiallyNotFound");
  static ResponseStatusCode noAnyResultData_ =
      ResponseStatusCode._internal("NoAnyResultData");
  static ResponseStatusCode resultDataLost_ =
      ResponseStatusCode._internal("ResultDataLost");
  static ResponseStatusCode taskNotFound_ =
      ResponseStatusCode._internal("TaskNotFound");
  static ResponseStatusCode notReady_ =
      ResponseStatusCode._internal("NotReady");
  static ResponseStatusCode error_ = ResponseStatusCode._internal("Error");

  ResponseStatusCode.fromJson(dynamic data) {
    switch (data) {
      case "Ok":
        value = data;
        break;
      case "PartiallyNotFound":
        value = data;
        break;
      case "NoAnyResultData":
        value = data;
        break;
      case "ResultDataLost":
        value = data;
        break;
      case "TaskNotFound":
        value = data;
        break;
      case "NotReady":
        value = data;
        break;
      case "Error":
        value = data;
        break;
      default:
        throw ('Unknown enum value to decode: $data');
    }
  }

  static dynamic encode(ResponseStatusCode data) {
    return data.value;
  }
}
