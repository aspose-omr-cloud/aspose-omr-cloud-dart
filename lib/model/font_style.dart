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

class FontStyle {
  /// The underlying value of this enum member.
  String? value;

  FontStyle._internal(this.value);

  static FontStyle regular_ = FontStyle._internal("Regular");
  static FontStyle bold_ = FontStyle._internal("Bold");
  static FontStyle italic_ = FontStyle._internal("Italic");
  static FontStyle underline_ = FontStyle._internal("Underline");
  static FontStyle strikeout_ = FontStyle._internal("Strikeout");

  FontStyle.fromJson(dynamic data) {
    switch (data) {
      case "Regular":
        value = data;
        break;
      case "Bold":
        value = data;
        break;
      case "Italic":
        value = data;
        break;
      case "Underline":
        value = data;
        break;
      case "Strikeout":
        value = data;
        break;
      default:
        throw ('Unknown enum value to decode: $data');
    }
  }

  static dynamic encode(FontStyle data) {
    return data.value;
  }
}
