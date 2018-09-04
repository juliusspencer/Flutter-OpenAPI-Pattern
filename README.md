# Flutter-OpenAPI-Pattern

This Flutter application shows an example of Flutter working with OpenAPIv2 generated code for the petstore example API.

## Getting Started

The project should work without any required configuration. Press the floating action button to make requests to the API and observe results in the console.

## Building Your Own
To build your own code:

1. Navigate to the root of your project.
2. Make sure you have a config file, like `flutter.config.json`, set up, so you are building code for the flutter environment.
3. Use [openapi-generator-cli](https://github.com/OpenAPITools/openapi-generator) (see ‘DownloadJAR’ section) to run the following command.
Switch out the path to the jar, input swagger.json and output folder to suit your environment and needs.
```
java -jar /path/to/openapi-generator-cli.jar generate -i http://petstore.swagger.io/v2/swagger.json -l dart -c flutter.config.json -o your-api
```
4. Update your main project’s `pubspec.yaml` to include the library
```yaml
swagger:
    path: ./petstore-api
```


5. Access the API using the import:
```dart2
import 'package:swagger/api.dart';
```
