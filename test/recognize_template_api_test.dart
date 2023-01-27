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

import 'common.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aspose_omr_cloud_sdk/api.dart';
import 'package:test/test.dart';

/// tests for RecognizeTemplateApi
void main() {
  test('tests for RecognizeTemplateApi', () async {
    // set up
    Common common = new Common();
    await common.init();
    String url = common.GetURL();
    ApiClient apiClient = ApiClient(url, common.config);
    var instance = new RecognizeTemplateApi(apiClient);

    var omrFile =
        await new File(common.GetResultFolderDir() + "\\" + "Aspose_test.omr")
            .readAsBytes();
    int recognitionThreshold = 30;

    var image =
        await new File(common.GetDataFolderDir() + "\\" + "Aspose_test.jpg")
            .readAsBytes();
    List<String> images = [base64.encode(image)];

    OmrRecognizeTask task = new OmrRecognizeTask();
    task.omrFile = base64.encode(omrFile);
    task.recognitionThreshold = recognitionThreshold;
    task.images = images;

    String recognitionId =
        await instance.postRecognizeTemplate(body: task) ?? "";

    expect(recognitionId, isNotNull);
    expect(recognitionId, isNotEmpty);

    OMRResponse recognitionResult = new OMRResponse();
    while (true) {
      recognitionResult =
          await instance.getRecognizeTemplate(id: recognitionId) ??
              new OMRResponse();

      if (recognitionResult.responseStatusCode!.value == "Ok") {
        break;
      }

      await Future.delayed(Duration(seconds: 5));
    }

    expect(recognitionResult.responseStatusCode!.value, equals("Ok"));
    expect(recognitionResult.error, isNull);
    expect(recognitionResult.results.length > 0, true);
  });
}
