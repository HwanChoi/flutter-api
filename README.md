# Flutter API 예제

이 저장소, `flutter_api_samples`는 공식 Flutter 프레임워크 문서에서 직접 참조하는 API 코드 예제들의 포괄적인 모음입니다. 주요 목표는 다양한 Flutter API에 대해 명확하고 설명적인 시연을 제공하여 개발자들이 프레임워크 기능을 이해하고 효과적으로 활용하도록 돕는 것입니다.

## 프로젝트 구조 및 구성

예제들은 Flutter 프레임워크의 API 구조를 반영하도록 세심하게 구성되어 있습니다.

-   **`lib/`**: `animation`, `cupertino`, `material`, `widgets` 등과 같은 API 도메인별 하위 디렉토리에 핵심 예제들을 포함합니다.
-   **개별 예제 파일**: 각 예제는 자체 포함된 Dart 파일이며, 일반적으로 예제 UI의 루트 역할을 하는 `StatelessWidget` 또는 `StatefulWidget`을 정의합니다. 이러한 파일의 명명 규칙은 `lib/library/file/class_name.n.dart` 또는 `lib/library/file/class_name.member_name.n.dart`와 같이 매우 구조화되어 있으며, `n`은 동일한 심볼과 관련된 여러 예제에 대한 인덱스이고, 심볼 이름은 `snake_case`로 변환됩니다.
-   **`lib/examples.dart`**: 모든 개별 예제 파일을 `exampleWidgets`라는 `Map<String, Widget>`에 가져와 등록하는 중앙 매니페스트 역할을 합니다.
-   **`lib/main.dart`**: 애플리케이션의 진입점입니다. 실행 시, 등록된 모든 예제의 찾아보기 가능한 목록을 제공하는 `ExampleListApp`을 시작하여 사용자가 라이브 데모를 탐색하고 볼 수 있도록 합니다.
-   **`lib/sample_templates`**: 다양한 위젯 스타일에 대한 모범 사례를 따라 새로운 API 예제를 생성하는 개발자를 안내하는 보일러플레이트 코드(`cupertino.0.dart`, `material.0.dart`, `widgets.0.dart`)를 제공합니다.
-   **`test/`**: 예제의 정확성과 기능을 보장하는 단위 및 통합 테스트를 포함합니다.

## 사용법

### 개별 예제 실행

이 디렉토리에서 다음 명령줄을 사용하여 특정 예제를 직접 실행할 수 있습니다.

```bash
flutter run -d <device> lib/<path_to_example_file>.dart
# 예시:
# flutter run -d chrome lib/animation/curves/curve2_d.0.dart
# flutter run -d MyAndroidDevice lib/services/system_chrome/system_chrome.set_system_u_i_overlay_style.1.dart
```

### 전체 예제 애플리케이션 실행

단일 애플리케이션 내에서 모든 예제를 탐색하려면 다음을 실행합니다.

```bash
flutter run
```
이것은 `ExampleListApp`을 시작하여 모든 샘플을 탐색할 수 있는 탐색 가능한 인터페이스를 제공합니다.

### API 문서 통합

이 예제들은 공식 Flutter API 문서에 직접 삽입되거나 링크되어 프레임워크에 대한 이해를 돕기 위해 라이브로 실행 가능한 코드 스니펫을 제공합니다.

### Dartpad 및 독립형 예제

많은 예제들이 [Dartpad](https://dartpad.dev)에서 대화형으로 작동하며, 다른 예제들(프레임워크 소스 코드에서 `{@tool sample}`로 표시된)은 (예: 시스템 UI 상호작용과 같은) 특성상 특정 플랫폼에서 독립적으로 실행되도록 의도되었습니다.

## 예제 작성

예제 작성에 대한 자세한 지침은 [snippets package documentation](https://pub.dev/packages/snippets)를 참조하십시오.

작성을 위한 주요 사항:

-   **Dartdoc 블록**: 예제는 프레임워크 소스 코드의 특정 Dartdoc 주석 블록을 통해 연결됩니다. `dartpad` 예제의 경우 `{@tool dartpad}`를 사용하고, 독립형 예제의 경우 `{@tool sample}`을 사용합니다.
    ```dart
    /// {@tool dartpad}
    /// Write a description of the example here.
    ///
    /// ** See code in examples/api/lib/animation/curves/curve2_d.0.dart **
    /// {@end-tool}
    ```
    "See code in" 줄은 정확하게 형식이 지정되어야 합니다.
-   **파일 이름 규칙**: 예제 파일 이름은 소스 파일 위치와 연결된 심볼(snake_case로 변환됨)에 따라 지정되며, Dartdoc 주석 내에서의 순서에 따라 인덱스가 붙습니다.
    *예시*: `lib/animation/curves/curve2_d.0.dart`
-   **단일 파일**: Dartpad 호환성을 위해 전체 예제는 단일 파일에 있어야 합니다.
-   **패키지 가져오기**: Dartpad에서 로드할 수 있는 패키지만 가져올 수 있습니다. 새로운 패키지는 `pubspec.yaml`에 추가해야 할 수 있습니다.
-   **스니펫 예제**: 표시용으로만 의도된 불완전한 코드 스니펫의 경우, Dartdoc에 `{@tool snippet}`을 직접 사용합니다.

## 테스트

모든 예제에는 테스트가 필요합니다.

-   **스모크 테스트**: 모든 API 예제가 충돌 없이 빌드 및 실행되는지 확인하는 스모크 테스트가 있습니다.
-   **기능 테스트**: 이는 예제의 기능에 대한 일반적인 단위/위젯 테스트입니다. 테스트는 예제 자체에 초점을 맞춰야 하며, 기본 Flutter 위젯 기능을 다시 테스트해서는 안 됩니다.
-   **테스트 위치**: 테스트는 `test/` 디렉토리 아래에 `lib/` 구조를 미러링하며, `*_test.dart`로 명명됩니다(예: `test/widgets/layout_builder/layout_builder.0_test.dart`).

이 `README.md`는 Flutter API 예제 프로젝트에 대한 명확하고 간결한 개요를 제공하는 것을 목표로 합니다.
