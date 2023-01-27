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

class PageSettings {
  String? fontFamily = "Segoe UI";

  FontStyle? fontStyle = FontStyle.regular_;

  int? fontSize = 12;

  PaperSize? paperSize = PaperSize.a4_;

  Color? bubbleColor = Color.black_;

  int? pageMarginLeft = 210;

  Orientation? orientation = Orientation.vertical_;

  BubbleSize? bubbleSize = BubbleSize.normal_;

  S3DataType? outputFormat = S3DataType.png_;

  PageSettings();

  @override
  String toString() {
    return 'PageSettings[fontFamily=$fontFamily, fontStyle=$fontStyle, fontSize=$fontSize, paperSize=$paperSize, bubbleColor=$bubbleColor, pageMarginLeft=$pageMarginLeft, orientation=$orientation, bubbleSize=$bubbleSize, outputFormat=$outputFormat, ]';
  }

  PageSettings.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    fontFamily = json['fontFamily'];
    fontStyle = new FontStyle.fromJson(json['fontStyle']);
    fontSize = json['fontSize'];
    paperSize = new PaperSize.fromJson(json['paperSize']);
    bubbleColor = new Color.fromJson(json['bubbleColor']);
    pageMarginLeft = json['pageMarginLeft'];
    orientation = new Orientation.fromJson(json['orientation']);
    bubbleSize = new BubbleSize.fromJson(json['bubbleSize']);
    outputFormat = new S3DataType.fromJson(json['outputFormat']);
  }

  Map<String, dynamic> toJson() {
    return {
      'fontFamily': fontFamily,
      'fontStyle': fontStyle?.value,
      'fontSize': fontSize,
      'paperSize': paperSize?.value,
      'bubbleColor': bubbleColor?.value,
      'pageMarginLeft': pageMarginLeft,
      'orientation': orientation?.value,
      'bubbleSize': bubbleSize?.value,
      'outputFormat': outputFormat?.value
    };
  }

  static List<PageSettings> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new PageSettings.fromJson(value)).toList();
  }

  static Map<String, PageSettings> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PageSettings>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new PageSettings.fromJson(value));
    }
    return map;
  }
}
