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

class OmrGenerateTask {
  String? markupFile = null;

  PageSettings? settings = null;

  Map<String, String>? images = null;

  OmrGenerateTask();

  @override
  String toString() {
    return 'OmrGenerateTask[markupFile=$markupFile, settings=$settings, images=$images, ]';
  }

  OmrGenerateTask.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    markupFile = json['markupFile'];
    settings = new PageSettings.fromJson(json['settings']);
    //images = (json['images'] as List).map((item) => item as String).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'markupFile': markupFile,
      'settings': settings?.toJson(),
      'images': images
    };
  }

  static List<OmrGenerateTask> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new OmrGenerateTask.fromJson(value)).toList();
  }

  static Map<String, OmrGenerateTask> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, OmrGenerateTask>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new OmrGenerateTask.fromJson(value));
    }
    return map;
  }
}
