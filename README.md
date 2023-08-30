# localhost-client

지역 기반 공동구매 플랫폼 Localhost의 모바일 클라이언트

## Document

[Figma](https://www.figma.com/file/zsfqblyf7FZcyx9t5cNROe/localhost-%EC%96%B4%ED%94%8C%EB%A6%AC%EC%BC%80%EC%9D%B4%EC%85%98-%ED%99%94%EB%A9%B4-%EA%B8%B0%ED%9A%8D%EC%84%9C?type=design&node-id=115%3A31711&mode=design&t=N7bmfqasF9UAcfFv-1)

## 주목한 점

### 1. 접근성

* `l10n`(localization)을 지원합니다.

`flutter_localizations` 패키지를 사용하여 다국어 텍스트를 지원하였습니다.

시간 변환을 위해, `Jiffy` 패키지를 사용하였습니다.

레이아웃에서는 `EdgeInsetsDirectional`을 이용하여 `LTR`과 `RTL` 언어를 모두 지원할 수 있도록 하였습니다.

* `textScaleFactor`를 이용하여 디바이스의 글씨 크기 설정에 따라 텍스트의 크기가 조정되도록 하였습니다.

얼핏 보면 당연한 문장이지만, 설정에서 글씨의 크기를 최대로 키우고 여러 어플리케이션에 접속해 보면 요소가 확대되지 않거나, 혹은 레이아웃이 깨져 글씨를 볼 수 없는 경우가 많습니다.

최대한 이러한 문제를 방지하기 위해, `textScaleFactor`를 이용하여 텍스트가 아닌 요소의 크기도 조정할 수 있도록 하고, 확대되지 않거나 가려지는 요소가 없도록 충분한 테스트를 진행하고자 합니다.

* `Semantics` 위젯을 이용하여, 스크린 리더 사용자를 위한 접근성을 지원합니다.

추후 스크린 리더를 실제로 사용하여 테스트하고자 합니다.

