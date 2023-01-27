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

/// tests for GenerateTemplateApi
void main() {
  test('tests for GenerateTemplateApi', () async {
    // set up
    Common common = new Common();
    await common.init();
    String url = common.GetURL();
    ApiClient apiClient = ApiClient(url, common.config);
    var instance = new GenerateTemplateApi(apiClient);
    List<String> templateLogosImagesNames = ["logo1.jpg", "logo2.png"];

    var markupFile =
        await new File(common.GetDataFolderDir() + "\\" + "Aspose_test.txt")
            .readAsBytes();

    PageSettings settings = new PageSettings();

    Map<String, String> images = {};
    for (int i = 0; i < templateLogosImagesNames.length; i++) {
      String logo = base64.encode(await new File(
              common.GetDataFolderDir() + "\\" + templateLogosImagesNames[i])
          .readAsBytes());
      images[templateLogosImagesNames[i]] = logo;
    }

    OmrGenerateTask task = new OmrGenerateTask();
    task.markupFile = base64.encode(markupFile);
    task.settings = settings;
    task.images = images;

    String templateId = await instance.postGenerateTemplate(task);

    expect(templateId, isNotNull);
    expect(templateId, isNotEmpty);

    OMRResponse generationResult = new OMRResponse();

    while (true) {
      generationResult =
          await instance.getGenerateTemplate(templateId) ?? new OMRResponse();

      if (generationResult.responseStatusCode!.value == "Ok") {
        break;
      }

      await Future.delayed(Duration(seconds: 5));
    }

    expect(generationResult.responseStatusCode!.value, equals("Ok"));
    expect(generationResult.error, isNull);
    expect(generationResult.results.length > 1, true);
  });
}
