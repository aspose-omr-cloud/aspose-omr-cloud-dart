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

class OmrRecognizeTask {
  List<String> images = [];

  String? omrFile = null;

  int? recognitionThreshold = null;

  OmrRecognizeTask();

  @override
  String toString() {
    return 'OmrRecognizeTask[images=$images, omrFile=$omrFile, recognitionThreshold=$recognitionThreshold, ]';
  }

  OmrRecognizeTask.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    images = (json['images'] as List).map((item) => item as String).toList();
    omrFile = json['omrFile'];
    recognitionThreshold = json['recognitionThreshold'];
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'omrFile': omrFile,
      'recognitionThreshold': recognitionThreshold
    };
  }

  static List<OmrRecognizeTask> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new OmrRecognizeTask.fromJson(value)).toList();
  }

  static Map<String, OmrRecognizeTask> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, OmrRecognizeTask>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new OmrRecognizeTask.fromJson(value));
    }
    return map;
  }
}
