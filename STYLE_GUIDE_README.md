# 패션 스타일 가이드 앱

## 📋 프로젝트 개요
7단계 스타일 진단을 통해 사용자의 패션 스타일을 분석하고, 맞춤형 코디 추천 및 쇼핑 팁을 제공하는 Flutter 앱

## 🎯 주요 기능
1. **7단계 스타일 진단** - 이미지 선택 기반 진단
2. **결과 분석** - 4개 축(색상/실루엣/분위기/무드) 점수 시각화
3. **코디 갤러리** - 3가지 상황별 코디 예시
4. **필수 아이템** - 4개 카테고리별 추천 아이템
5. **쇼핑 팁** - 상황별 쇼핑 가이드 + 브랜드 추천
6. **계절별 팁** - 4계절 스타일링 가이드

## 🏗️ 프로젝트 구조

```
lib/
├── main.dart                    # 앱 진입점
├── router.dart                  # 라우팅 설정
│
├── screens/                     # 화면
│   ├── diagnosis_screen.dart           # 진단 화면 (7문제)
│   ├── result_screen.dart              # 결과 화면
│   ├── outfit_gallery_screen.dart      # 코디 갤러리
│   ├── essential_items_screen.dart     # 필수 아이템
│   ├── shopping_tips_screen.dart       # 쇼핑 팁
│   └── seasonal_tips_screen.dart       # 계절별 팁
│
├── models/                      # 데이터 모델
│   ├── style_result.dart               # 스타일 결과 모델
│   ├── outfit.dart                     # 코디 모델
│   ├── shopping_tip.dart               # 쇼핑 팁 모델
│   └── brand_recommend.dart            # 브랜드 추천 모델
│
├── services/                    # 비즈니스 로직
│   ├── style_calculator.dart           # 스타일 계산 로직
│   ├── groq_service.dart               # Groq API (선택)
│   └── unsplash_service.dart           # Unsplash API
│
├── widgets/                     # 재사용 위젯
│   ├── question_card.dart              # 진단 질문 카드
│   ├── outfit_card.dart                # 코디 카드
│   ├── brand_card.dart                 # 브랜드 추천 카드
│   └── score_chart.dart                # 점수 시각화 차트
│
├── constants/                   # 상수 데이터
│   ├── questions.dart                  # 7개 진단 질문
│   ├── style_data.dart                 # 16가지 스타일 데이터
│   └── brands.dart                     # 브랜드 추천 데이터
│
└── theme/                       # 테마
    ├── light_theme.dart
    └── dark_theme.dart
```

## 🔧 기술 스택

| 카테고리 | 기술 |
|---------|------|
| **프레임워크** | Flutter 3.0+ |
| **상태관리** | GetX |
| **HTTP** | Dio |
| **UI** | Material3, Google Fonts |
| **로컬저장** | SharedPreferences |
| **API** | Groq API (선택), Unsplash API |

## 📊 16가지 스타일 타입

### 4개 축 기준
- **색상**: 웜톤(0) ↔ 쿨톤(10)
- **실루엣**: 타이트(0) ↔ 루즈(10)
- **분위기**: 캐주얼(0) ↔ 포멀(10)
- **무드**: 트렌디(0) ↔ 미니멀(10)

### 스타일 타입 예시
- `city_trendy`: 시티 트렌디 (웜톤 + 타이트 + 캐주얼 + 트렌디)
- `urban_cool`: 어반 쿨 (쿨톤 + 타이트 + 캐주얼 + 트렌디)
- `classic_warm`: 클래식 웜 (웜톤 + 타이트 + 포멀 + 미니멀)
- ... (총 16가지)

## 🚀 개발 단계 (10단계)

- [x] **1단계**: 프로젝트 초기 설정 및 폴더 구조
- [ ] **2단계**: 데이터 모델 정의
- [ ] **3단계**: 상수 데이터 정의
- [ ] **4단계**: 진단 화면 UI
- [ ] **5단계**: 스타일 계산 로직
- [ ] **6단계**: 결과 화면 UI
- [ ] **7단계**: 코디 갤러리 화면
- [ ] **8단계**: 필수 아이템 화면
- [ ] **9단계**: 쇼핑 팁 & 계절 팁 화면
- [ ] **10단계**: 네비게이션 연결 및 테스트

## 🔑 환경 설정

1. `.env` 파일 생성:
```env
GROQ_API_KEY=your_groq_api_key_here
UNSPLASH_API_KEY=your_unsplash_api_key_here
```

2. 패키지 설치:
```bash
flutter pub get
```

3. 앱 실행:
```bash
flutter run
```

## 📝 참고사항
- 개인정보는 저장하지 않음 (선택적으로 진단 결과만 로컬 저장)
- Groq API는 선택사항 (하드코딩 로직으로 대체 가능)
- Unsplash API는 코디 이미지용 (테스트 시 로컬 이미지 사용 가능)
