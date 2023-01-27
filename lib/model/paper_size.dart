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

class PaperSize {
  /// The underlying value of this enum member.
  String? value;

  PaperSize._internal(this.value);

  static PaperSize letter_ = PaperSize._internal("Letter");
  static PaperSize a4_ = PaperSize._internal("A4");
  static PaperSize legal_ = PaperSize._internal("Legal");

  PaperSize.fromJson(dynamic data) {
    switch (data) {
      case "Letter":
        value = data;
        break;
      case "A4":
        value = data;
        break;
      case "Legal":
        value = data;
        break;
      default:
        throw ('Unknown enum value to decode: $data');
    }
  }

  static dynamic encode(PaperSize data) {
    return data.value;
  }
}
