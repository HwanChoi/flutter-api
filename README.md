# Flutter API Examples

This repository, `flutter_api_samples`, serves as a comprehensive collection of runnable API code examples directly referenced by the official Flutter framework documentation. Its primary goal is to provide clear, illustrative demonstrations for various Flutter APIs, aiding developers in understanding and effectively utilizing framework features.

## Project Structure and Organization

The examples are meticulously organized to mirror the Flutter framework's API structure.

-   **`lib/`**: Contains the core examples, categorized into subdirectories based on their API domain (e.g., `animation`, `cupertino`, `material`, `widgets`, etc.).
-   **Individual Example Files**: Each example is a self-contained Dart file, typically defining a `StatelessWidget` or `StatefulWidget`. Files follow a structured naming convention: `lib/library/file/class_name.n.dart` or `lib/library/file/class_name.member_name.n.dart`, where `n` is an index for multiple examples related to the same symbol, and symbol names are converted to `snake_case`.
-   **`lib/examples.dart`**: Acts as a central manifest, importing and registering all individual example files into a `Map<String, Widget>` named `exampleWidgets`.
-   **`lib/main.dart`**: The application's entry point. When run, it launches an `ExampleListApp` that presents a browsable list of all registered examples, allowing users to navigate and view live demonstrations.
-   **`lib/sample_templates`**: Provides boilerplate code (`cupertino.0.dart`, `material.0.dart`, `widgets.0.dart`) to guide developers in creating new examples following best practices for different widget styles.
-   **`test/`**: Contains unit and integration tests for the examples, ensuring their correctness and functionality.

## Usage

### Running Individual Examples

You can run any specific example directly from the command line from this directory:

```bash
flutter run -d <device> lib/<path_to_example_file>.dart
# Example:
# flutter run -d chrome lib/animation/curves/curve2_d.0.dart
# flutter run -d MyAndroidDevice lib/services/system_chrome/system_chrome.set_system_u_i_overlay_style.1.dart
```

### Running the Entire Example Application

To browse all examples within a single application, run:

```bash
flutter run
```
This will launch the `ExampleListApp`, providing a navigable interface to explore all samples.

### API Documentation Integration

These examples are directly embedded or linked from the official Flutter API documentation, offering live and runnable code snippets for better understanding of the framework.

### Dartpad and Standalone Examples

Many examples are interactive on [Dartpad](https://dartpad.dev), while others (marked `{@tool sample}` in the framework source code) are intended for standalone execution on specific platforms due to their nature (e.g., system UI interactions).

## Authoring Examples

For detailed guidelines on authoring examples, refer to [the snippets package documentation](https://pub.dev/packages/snippets).

Key points for authoring:

-   **Dartdoc Blocks**: Examples are linked via specific Dartdoc comment blocks in the framework source code. For `dartpad` examples, use `{@tool dartpad}`; for standalone examples, use `{@tool sample}`.
    ```dart
    /// {@tool dartpad}
    /// Write a description of the example here.
    ///
    /// ** See code in examples/api/lib/animation/curves/curve2_d.0.dart **
    /// {@end-tool}
    ```
    The "See code in" line must be precisely formatted.
-   **Filename Convention**: Example filenames match their source file location and the symbol they are attached to, in `lower_snake_case`, with an index.
    *Example*: `lib/animation/curves/curve2_d.0.dart`
-   **Single File**: The entire example must be in a single file for Dartpad compatibility.
-   **Package Imports**: Only packages loadable by Dartpad may be imported. New packages might need to be added to `pubspec.yaml`.
-   **Snippet Examples**: For incomplete code snippets intended only for display, use `{@tool snippet}` directly in Dartdoc.

## Testing

All examples are required to have tests.

-   **Smoke Tests**: A smoke test ensures all API examples build and run without crashing.
-   **Functionality Tests**: These are normal unit/widget tests for the example's functionality. Tests should focus on the example itself, not re-testing the underlying Flutter widget functionality.
-   **Test Location**: Tests reside under the `test/` directory, mirroring the `lib/` structure, and are named `*_test.dart` (e.g., `test/widgets/layout_builder/layout_builder.0_test.dart`).

This `README.md` aims to provide a clear and concise overview of the Flutter API examples project.