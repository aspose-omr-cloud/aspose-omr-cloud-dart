/*
 * Copyright (C) 2022 Aspose Pty Ltd. All Rights Reserved.
 *
 * Licensed under the MIT License (hereinafter the "License");
 * you may not use this file except in accordance with the License.
 * You can obtain a copy of the License at
 *
 *      https://github.com/aspose-omr-cloud/aspose-omr-cloud-dotnet/blob/master/LICENSE
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:io';
import 'dart:convert';

import 'package:aspose_omr_cloud_sdk/api.dart';

class Common {
  final demoDataSubmoduleName = "aspose-omr-cloud-demo-data";
  final configFileName = "test_config.json";
  var basePath = "";
  var DataFolderName = "Data";
  var ResultFolderName = "Temp";
  Config config = new Config();

  Future<void> init() async {
    Directory currentDirParent = Directory.current.parent;
    basePath = currentDirParent.path.toString() + "\\" + demoDataSubmoduleName;

    String configFilePath = basePath + "\\" + configFileName;

    config = Config.fromJson(
        json.decode(await new File(configFilePath).readAsString()));
    if (config.basePath.isEmpty) {
      throw new FileSystemException("Unable to find file", configFilePath);
    }
  }

  String GetDataFolderDir() {
    return basePath + "\\" + this.config.dataFolder;
  }

  String GetResultFolderDir() {
    return this.basePath + "\\" + config.resultFolder;
  }

  String GetURL() {
    return this.config.basePath;
  }
}
