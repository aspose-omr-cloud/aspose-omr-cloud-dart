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

class BubbleSize {
  /// The underlying value of this enum member.
  String? value;

  BubbleSize._internal(this.value);

  static BubbleSize extrasmall_ = BubbleSize._internal("Extrasmall");
  static BubbleSize small_ = BubbleSize._internal("Small");
  static BubbleSize normal_ = BubbleSize._internal("Normal");
  static BubbleSize large_ = BubbleSize._internal("Large");
  static BubbleSize extralarge_ = BubbleSize._internal("Extralarge");

  BubbleSize.fromJson(dynamic data) {
    switch (data) {
      case "Extrasmall":
        value = data;
        break;
      case "Small":
        value = data;
        break;
      case "Normal":
        value = data;
        break;
      case "Large":
        value = data;
        break;
      case "Extralarge":
        value = data;
        break;
      default:
        throw ('Unknown enum value to decode: $data');
    }
  }

  static dynamic encode(BubbleSize data) {
    return data.value;
  }
}
