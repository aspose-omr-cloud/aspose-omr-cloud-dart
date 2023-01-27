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

class Color {
  /// The underlying value of this enum member.
  String? value;

  Color._internal(this.value);

  static Color aqua_ = Color._internal("Aqua");
  static Color aquamarine_ = Color._internal("Aquamarine");
  static Color black_ = Color._internal("Black");
  static Color blue_ = Color._internal("Blue");
  static Color blueViolet_ = Color._internal("BlueViolet");
  static Color crimson_ = Color._internal("Crimson");
  static Color darkBlue_ = Color._internal("DarkBlue");
  static Color darkGreen_ = Color._internal("DarkGreen");
  static Color darkOrange_ = Color._internal("DarkOrange");
  static Color darkSalmon_ = Color._internal("DarkSalmon");
  static Color fuchsia_ = Color._internal("Fuchsia");
  static Color indigo_ = Color._internal("Indigo");
  static Color lime_ = Color._internal("Lime");
  static Color red_ = Color._internal("Red");
  static Color teal_ = Color._internal("Teal");
  static Color white_ = Color._internal("White");
  static Color gray_ = Color._internal("Gray");
  static Color lightGray_ = Color._internal("LightGray");

  Color.fromJson(dynamic data) {
    switch (data) {
      case "Aqua":
        value = data;
        break;
      case "Aquamarine":
        value = data;
        break;
      case "Black":
        value = data;
        break;
      case "Blue":
        value = data;
        break;
      case "BlueViolet":
        value = data;
        break;
      case "Crimson":
        value = data;
        break;
      case "DarkBlue":
        value = data;
        break;
      case "DarkGreen":
        value = data;
        break;
      case "DarkOrange":
        value = data;
        break;
      case "DarkSalmon":
        value = data;
        break;
      case "Fuchsia":
        value = data;
        break;
      case "Indigo":
        value = data;
        break;
      case "Lime":
        value = data;
        break;
      case "Red":
        value = data;
        break;
      case "Teal":
        value = data;
        break;
      case "White":
        value = data;
        break;
      case "Gray":
        value = data;
        break;
      case "LightGray":
        value = data;
        break;
      default:
        throw ('Unknown enum value to decode: $data');
    }
  }

  static dynamic encode(Color data) {
    return data.value;
  }
}
