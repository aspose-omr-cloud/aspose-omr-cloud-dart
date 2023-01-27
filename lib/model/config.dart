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

class Config {
  String basePath = "";
  String dataFolder = "";
  String resultFolder = "";
  String authUrl = "";
  String clientSecret = "";
  String clientId = "";

  Config();

  @override
  Config.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    basePath = json['base_path'];
    dataFolder = json['data_folder'];
    resultFolder = json['result_folder'];
    authUrl = json['auth_url'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
  }
}
