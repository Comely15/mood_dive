# 패션 스타일 가이드 앱 - 빠른 시작

## 🚀 앱 실행 방법

### 1. 의존성 설치
```bash
flutter pub get
```

### 2. 앱 실행 (두 가지 방법)

#### 방법 1: 새로운 패션 스타일 가이드 앱 실행
```bash
flutter run -t lib/main_style_guide.dart
```

#### 방법 2: 기존 Mood Dive 앱 실행 (원래 프로젝트)
```bash
flutter run
# 또는
flutter run -t lib/main.dart
```

### 3. 환경 변수 설정 (선택사항)

`.env` 파일에 API 키 설정:
```env
GROQ_API_KEY=your_groq_api_key_here
UNSPLASH_API_KEY=your_unsplash_api_key_here
```

> **참고**: API 키 없이도 앱은 정상 작동합니다. 하드코딩된 데이터를 사용합니다.

---

## 📱 앱 플로우

1. **홈 화면** → 스타일 진단 시작
2. **진단 화면** → 7개 질문 응답 (이미지 선택)
3. **결과 화면** → 16가지 스타일 중 매칭된 결과 + 4개 축 점수
4. **코디 갤러리** → 데일리/미팅/주말 코디 3가지
5. **필수 아이템** → 팬츠/상의/신발/악세서리 (4개 탭)
6. **쇼핑 팁** → 상황별 체크리스트 + 브랜드 추천
7. **계절별 팁** → 봄/여름/가을/겨울 가이드

---

## 🎨 주요 기능

### ✅ 구현 완료
- [x] 7단계 스타일 진단
- [x] 16가지 스타일 타입 분석
- [x] 4개 축 점수 시각화 (색상/실루엣/분위기/무드)
- [x] 상황별 코디 추천
- [x] 카테고리별 필수 아이템 가이드
- [x] 쇼핑 팁 & 브랜드 추천
- [x] 계절별 스타일링 팁

### 📊 데이터
- 7개 진단 질문 (이미지 기반)
- 16가지 스타일 결과 데이터
- 필수 아이템 16개 (카테고리별 4개)
- 쇼핑 팁 4가지 (상황별)
- 브랜드 추천 (가격대별)
- 계절별 팁 4가지

---

## 🛠️ 테스트

### 진단 플로우 테스트
```bash
# 1. 앱 실행
flutter run -t lib/main_style_guide.dart

# 2. 홈 화면에서 "스타일 진단 시작하기" 클릭

# 3. 7개 질문에 답변 (이미지 선택)

# 4. 결과 확인 → 코디 갤러리 → 필수 아이템 → 쇼핑 팁 → 계절별 팁
```

### 코드 분석
```bash
flutter analyze lib/screens/ lib/services/ lib/constants/
```

---

## 📂 주요 파일

### 실행 파일
- `lib/main_style_guide.dart` - 새로운 패션 스타일 가이드 앱 진입점
- `lib/style_guide_app.dart` - GetX 라우팅 설정
- `lib/main.dart` - 기존 Mood Dive 앱 진입점

### 화면
- `lib/screens/home_screen.dart` - 홈 화면
- `lib/screens/style_diagnosis_screen.dart` - 진단 화면
- `lib/screens/style_result_screen.dart` - 결과 화면
- `lib/screens/outfit_gallery_screen.dart` - 코디 갤러리
- `lib/screens/essential_items_screen.dart` - 필수 아이템
- `lib/screens/shopping_tips_screen.dart` - 쇼핑 팁
- `lib/screens/seasonal_tips_screen.dart` - 계절별 팁

### 비즈니스 로직
- `lib/services/style_calculator.dart` - 스타일 계산 로직

### 데이터
- `lib/constants/questions.dart` - 7개 진단 질문
- `lib/constants/style_data.dart` - 16가지 스타일 데이터
- `lib/constants/brands.dart` - 브랜드 추천 데이터
- `lib/constants/outfit_data.dart` - 코디 데이터
- `lib/constants/essential_items_data.dart` - 필수 아이템 데이터
- `lib/constants/shopping_tips_data.dart` - 쇼핑 팁 데이터
- `lib/constants/seasonal_tips_data.dart` - 계절별 팁 데이터

---

## 🎯 다음 단계 (선택사항)

### 기능 추가
- [ ] Unsplash API 연동 (실제 코디 이미지)
- [ ] Groq API 연동 (AI 기반 스타일 분석)
- [ ] 결과 저장 (SharedPreferences)
- [ ] 공유 기능 (카카오톡, 인스타그램)
- [ ] 다크 모드 지원
- [ ] 애니메이션 개선

### 배포
- [ ] Android APK 빌드
- [ ] iOS IPA 빌드
- [ ] 스토어 등록

---

## 📞 문의

문제가 발생하거나 개선 사항이 있다면 이슈를 등록해주세요!
