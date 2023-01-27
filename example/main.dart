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

import 'package:aspose_omr_cloud_sdk/api.dart';
import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  Demo demo = new Demo();
  demo.runDemo().catchError((err) => {print("Exception: " + err.toString())});
}

class Demo {
  /// <summary>
  /// The configuration file in JSON format:
  /// {
  ///     "base_path"  : "Aspose.OMR Cloud URL",
  ///     "data_folder"   : "Data",
  ///     "result_folder" : "Temp",
  /// }
  /// </summary>
  String configFileName = "test_config.json";

  /// <summary>
  /// Name of the sub-module with demo data and the configuration file
  /// </summary>
  String demoDataSubmoduleName = "aspose-omr-cloud-demo-data";

  /// <summary>
  /// File names for template sources, printable form, recognition pattern and results
  /// </summary>
  String templateGenerationFileName = "Aspose_test.txt";
  String templateImageName = "Aspose_test.jpg";
  String omrFileName = "Aspose_test.omr";
  String resultFileName = "Aspose_test.csv";
  List<String> templateLogosImagesNames = ["logo1.jpg", "logo2.png"];

  // todo???
  ApiClient apiClient = ApiClient.empty();

  /// <summary>
  /// Declare an object to hold an instance of GenerateTemplateApi class
  /// </summary>
  GenerateTemplateApi generateApi = new GenerateTemplateApi();

  /// <summary>
  /// Declare an object to hold an instance of RecognizeTemplateApi class
  /// </summary>
  RecognizeTemplateApi recognizeApi = new RecognizeTemplateApi();

  /// <summary>
  /// Declare an object to hold the parsed configuration data
  /// </summary>
  Config config = new Config();

  Future<void> init() async {
    /// <summary>
    /// Get the parent of working directory of the application   ??? так норм?
    /// </summary>
    Directory currentDirParent = Directory.current.parent;

    /// <summary>
    /// Get the absolute path to the configuration file
    /// </summary>
    String configFilePath = currentDirParent.path.toString() +
        "\\" +
        demoDataSubmoduleName +
        "\\" +
        configFileName;

    /// <summary>
    /// Parse the configuration file
    /// </summary>
    config = Config.fromJson(
        json.decode(await new File(configFilePath).readAsString()));
    if (config.basePath.isEmpty) {
      throw new FileSystemException("Unable to find file", configFilePath);
    }
    config.dataFolder = currentDirParent.path.toString() +
        "\\" +
        demoDataSubmoduleName +
        "\\" +
        config.dataFolder;
    config.resultFolder = currentDirParent.path.toString() +
        "\\" +
        demoDataSubmoduleName +
        "\\" +
        config.resultFolder;

    /// <summary>
    /// TODO ??? (Base)
    /// </summary>
    apiClient = ApiClient(config.basePath, config);

    /// <summary>
    /// Create an instance of GenerateTemplateApi class
    /// </summary>
    generateApi = GenerateTemplateApi(apiClient);

    /// <summary>
    /// Create an instance of RecognizeTemplateApi class
    /// </summary>
    recognizeApi = RecognizeTemplateApi(apiClient);
  }

  /// <summary>
  /// Process sample data
  /// </summary>
  Future<void> runDemo() async {
    await init();

    /// <summary>
    /// STEP 1: Queue the template source file for generation
    /// </summary>
    print("\t\tGenerate template...");
    String templateId = await generateTemplate();

    /// <summary>
    /// STEP 2: Fetch generated printable form and recognition pattern
    /// </summary>
    print("\t\tGet generation result by ID...");
    OMRResponse generationResult = await getGenerationResultById(templateId);

    /// <summary>
    /// STEP 3: Save the printable form and recognition pattern into result_folder
    /// </summary>
    print("\t\tSave generation result...");
    await saveGenerationResult(generationResult);

    /// <summary>
    /// STEP 4: Queue the scan / photo of the filled form for recognition
    /// </summary>
    print("\t\tRecognize image...");
    String recognizeTemplateId = await recognizeImage(
        config.dataFolder + "\\" + templateImageName,
        config.resultFolder + "\\" + omrFileName);

    /// <summary>
    /// STEP 5: Fetch recognition results
    /// </summary>
    print("\t\tGet recognition result by ID...");
    OMRResponse recognitionResponse =
        await getRecognitionResultById(recognizeTemplateId);

    /// <summary>
    /// STEP 6: Save the recognition results into result_folder
    /// </summary>
    print("\t\tSave recognition result...");
    await saveRecognitionResult(recognitionResponse);
  }

  /// <summary>
  /// Generate the template from the provided sources
  /// </summary>
  /// <returns>Response from generation queue</returns>
  Future<String> generateTemplate() async {
    var markupFile =
        await new File(config.dataFolder + "\\" + templateGenerationFileName)
            .readAsBytes();

    Map<String, String> images = {};
    for (int i = 0; i < templateLogosImagesNames.length; i++) {
      String logo = base64.encode(
          await new File(config.dataFolder + "\\" + templateLogosImagesNames[i])
              .readAsBytes());
      images[templateLogosImagesNames[i]] = logo;
    }

    PageSettings settings = new PageSettings();
    OmrGenerateTask task = new OmrGenerateTask();
    task.markupFile = base64.encode(markupFile);
    task.settings = settings;
    task.images = images;
    return await generateApi.postGenerateTemplate(task);
  }

  /// <summary>
  /// Fetch generated printable form and recognition pattern by ID
  /// If the request is still being processed, wait for 5 seconds and try again
  /// </summary>
  /// <param name="templateId">Generated template ID</param>
  /// <returns>OMRResponse</returns>
  Future<OMRResponse> getGenerationResultById(String templateId) async {
    OMRResponse generationResult = new OMRResponse();
    while (true) {
      generationResult = await generateApi.getGenerateTemplate(templateId) ??
          new OMRResponse();

      if (generationResult.responseStatusCode!.value == "Ok") {
        break;
      }

      print("Wait, please! Your request is still being processed");
      await Future.delayed(Duration(seconds: 5));
    }
    return generationResult;
  }

  /// <summary>
  /// Save the printable form and recognition pattern
  /// </summary>
  /// <param name="generationResult">Response from GetGenerationResultById method</param>
  Future<void> saveGenerationResult(OMRResponse generationResult) async {
    if (generationResult.error == null) {
      for (int i = 0; i < generationResult.results.length; i++) {
        String type = generationResult.results[i].type ?? "";
        String name = "Aspose_test" + "." + type.toLowerCase();
        String path = config.resultFolder + "\\" + name;
        await new File(path).writeAsBytes(
            base64.decode(generationResult.results[i].data ?? ""));
      }
    } else {
      print("Error :" + generationResult.error.toString());
    }
  }

  /// <summary>
  /// Recognize the image of the filled form
  /// </summary>
  /// <param name="imagePath">Path to the scanned or photographed image of the filled form</param>
  /// <param name="omrFilePath">Path to the recognition pattern file (.OMR)</param>
  /// <returns>Response from recognition queue</returns>
  Future<String> recognizeImage(String imagePath, String omrFilePath) async {
    // get the omr file
    var omrFile = await new File(omrFilePath).readAsBytes();
    // set up recognition threshold
    int recognitionThreshold = 30;

    // get the filled template
    var image = await new File(imagePath).readAsBytes();
    List<String> images = [base64.encode(image)];

    // Set up request
    OmrRecognizeTask task = new OmrRecognizeTask();
    task.omrFile = base64.encode(omrFile);
    task.recognitionThreshold = recognitionThreshold;
    task.images = images;

    // call image recognition
    return await recognizeApi.postRecognizeTemplate(body: task) ?? "";
  }

  /// <summary>
  /// Fetch recognition result by ID
  /// If the request is still being processed, wait for 5 seconds and try again
  /// </summary>
  /// <param name="templateId">Template ID</param>
  /// <returns>OMRResponse</returns>
  Future<OMRResponse> getRecognitionResultById(String templateId) async {
    OMRResponse recognitionResult = new OMRResponse();
    while (true) {
      recognitionResult =
          await recognizeApi.getRecognizeTemplate(id: templateId) ??
              new OMRResponse();

      if (recognitionResult.responseStatusCode!.value == "Ok") {
        break;
      }

      print("Wait, please! Your request is still being processed");
      await Future.delayed(Duration(seconds: 5));
    }
    return recognitionResult;
  }

  /// <summary>
  /// Save the recognition results
  /// </summary>
  /// <param name="recognitionResult">Response from GetRecognitionResultById method</param>
  Future<void> saveRecognitionResult(OMRResponse recognitionResult) async {
    if (recognitionResult.error == null) {
      String path = config.resultFolder + "\\" + resultFileName;
      await new File(path)
          .writeAsBytes(base64.decode(recognitionResult.results[0].data ?? ""));
    } else {
      print("Error :" + recognitionResult.error.toString());
    }
  }
}
