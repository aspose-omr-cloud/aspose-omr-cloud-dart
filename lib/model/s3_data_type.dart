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

class S3DataType {
  /// The underlying value of this enum member.
  String? value;

  S3DataType._internal(this.value);

  static S3DataType png_ = S3DataType._internal("Png");
  static S3DataType pdf_ = S3DataType._internal("Pdf");
  static S3DataType csv_ = S3DataType._internal("Csv");
  static S3DataType json_ = S3DataType._internal("Json");
  static S3DataType txt_ = S3DataType._internal("Txt");
  static S3DataType internal_ = S3DataType._internal("Internal");

  S3DataType.fromJson(dynamic data) {
    switch (data) {
      case "Png":
        value = data;
        break;
      case "Pdf":
        value = data;
        break;
      case "Csv":
        value = data;
        break;
      case "Json":
        value = data;
        break;
      case "Txt":
        value = data;
        break;
      case "Internal":
        value = data;
        break;
      default:
        throw ('Unknown enum value to decode: $data');
    }
  }

  static dynamic encode(S3DataType data) {
    return data.value;
  }
}
