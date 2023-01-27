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

library omr.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/oauth.dart';

part 'api/generate_template_api.dart';
part 'api/recognize_template_api.dart';

part 'model/bubble_size.dart';
part 'model/color.dart';
part 'model/font_style.dart';
part 'model/omr_error.dart';
part 'model/omr_response.dart';
part 'model/omr_result.dart';
part 'model/omr_generate_task.dart';
part 'model/omr_recognize_task.dart';
part 'model/orientation.dart';
part 'model/page_settings.dart';
part 'model/paper_size.dart';
part 'model/response_status_code.dart';
part 'model/s3_data_type.dart';
part 'model/config.dart';
part 'model/auth_response.dart';

ApiClient defaultApiClient = new ApiClient.empty();
