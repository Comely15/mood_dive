# 🌊 Mood Dive

> **AI 기반 패션 무드보드 큐레이션 플랫폼**  
> 당신의 감성을 이해하고, 완벽한 스타일을 찾아주는 차세대 패션 디스커버리 서비스

[![Flutter](https://img.shields.io/badge/Flutter-3.8.1-02569B?logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Enabled-FFCA28?logo=firebase)](https://firebase.google.com)
[![FastAPI](https://img.shields.io/badge/FastAPI-Backend-009688?logo=fastapi)](https://fastapi.tiangolo.com)
[![License](https://img.shields.io/badge/License-Proprietary-red)]()

---

## 🎯 프로젝트 개요

**Mood Dive**는 사용자의 감성과 취향을 AI가 분석하여 개인화된 패션 스타일을 제안하는 혁신적인 모바일 애플리케이션입니다. 기존의 단순한 이미지 검색을 넘어, **대화형 AI**와 **인터랙티브 무드보드**를 통해 사용자가 원하는 스타일을 직관적으로 탐색할 수 있습니다.

### 💡 핵심 가치 제안

- **🎨 AI 기반 스타일 큐레이션**: 사용자의 취향을 학습하여 맞춤형 패션 제안
- **💬 대화형 인터페이스**: 자연어로 원하는 스타일을 설명하면 AI가 즉시 이해하고 추천
- **🔍 무한 탐색 경험**: "Dive" 기능으로 스타일을 점진적으로 세밀화
- **📱 크로스 플랫폼**: iOS/Android 동시 지원으로 넓은 사용자층 확보

---

## 🚀 주요 기능

### 1. **인터랙티브 무드보드**
- Pinterest 스타일의 Masonry 그리드 레이아웃
- 실시간 이미지 로딩 및 캐싱으로 부드러운 UX
- 이미지 선택 시 즉각적인 시각적 피드백

### 2. **AI 챗봇 스타일 어시스턴트**
- 사용자의 자연어 입력을 분석하여 스타일 제안
- 컨텍스트 기반 대화로 정확한 취향 파악
- 실시간 채팅 인터페이스로 자연스러운 상호작용

### 3. **Mood Diving (스타일 탐색)**
- 선택한 이미지를 기반으로 유사한 스타일 탐색
- 줌 애니메이션과 함께 몰입감 있는 "다이빙" 경험
- "TWIST" 기능으로 예상치 못한 스타일 발견

### 4. **개인화된 경험**
- Firebase 기반 사용자 데이터 관리
- 취향 학습을 통한 점진적 추천 정확도 향상
- 다크/라이트 모드 자동 전환

---

## 🏗️ 기술 스택

### **Frontend (Mobile)**
```yaml
Framework: Flutter 3.8.1 (Dart)
State Management: Provider
Routing: GoRouter 13.2.0
UI Components:
  - Google Fonts (프리미엄 타이포그래피)
  - Flutter Chat UI (대화형 인터페이스)
  - Staggered Grid View (무드보드 레이아웃)
  - Cached Network Image (이미지 최적화)
```

### **Backend**
```python
Framework: FastAPI (Python)
AI/ML: 준비 중 (OpenAI/Gemini API 통합 예정)
Database: Cloud Firestore
Authentication: Firebase Auth
```

### **Infrastructure**
- **Firebase**: 실시간 데이터베이스, 인증, 호스팅
- **Cloud Storage**: 이미지 및 미디어 자산 관리
- **REST API**: FastAPI 기반 마이크로서비스 아키텍처

---

## 📊 비즈니스 모델

### 수익화 전략

1. **프리미엄 구독 모델**
   - 무제한 AI 스타일 컨설팅
   - 고급 필터 및 탐색 기능
   - 우선 신상품 정보 제공

2. **커머스 연동**
   - 추천 스타일의 실제 상품 구매 링크 (제휴 수수료)
   - 브랜드 파트너십을 통한 큐레이션 수익

3. **B2B 솔루션**
   - 패션 브랜드를 위한 트렌드 분석 대시보드
   - 소비자 취향 데이터 인사이트 제공

### 타겟 시장

- **1차 타겟**: 20-35세 패션에 관심 있는 밀레니얼/Z세대
- **시장 규모**: 국내 패션 이커머스 시장 약 30조원 (2024년 기준)
- **글로벌 확장**: 영어권 시장 진출 준비 중

---

## 🎨 디자인 철학

- **미니멀리즘**: 깔끔하고 직관적인 인터페이스
- **반응형 디자인**: 다양한 화면 크기에 최적화
- **접근성**: 다크 모드, 시스템 설정 자동 감지
- **애니메이션**: 부드러운 전환 효과로 프리미엄 경험 제공

---

## 🛠️ 개발 환경 설정

### 필수 요구사항
- Flutter SDK 3.8.1 이상
- Dart SDK 3.0 이상
- Firebase CLI
- Python 3.9+ (백엔드)

### 설치 및 실행

```bash
# 1. 저장소 클론
git clone https://github.com/Comely15/mood_dive.git
cd mood_dive

# 2. 의존성 설치
flutter pub get

# 3. Firebase 설정
flutterfire configure

# 4. 앱 실행
flutter run

# 5. 백엔드 서버 실행 (별도 터미널)
cd backend
pip install -r requirements.txt
python main.py
```

---

## 📱 스크린샷

> 추후 업데이트 예정

---

## 🗺️ 로드맵

### Phase 1: MVP (현재)
- ✅ 기본 무드보드 UI
- ✅ AI 챗봇 통합
- ✅ Firebase 연동
- ✅ Mood Diving 기능

### Phase 2: 베타 출시 (2025 Q1)
- 🔄 OpenAI/Gemini API 통합
- 🔄 사용자 프로필 및 취향 저장
- 🔄 소셜 공유 기능
- 🔄 상품 추천 엔진

### Phase 3: 정식 출시 (2025 Q2)
- 📅 커머스 파트너십 구축
- 📅 프리미엄 구독 모델 런칭
- 📅 iOS/Android 앱스토어 출시
- 📅 마케팅 캠페인 시작

### Phase 4: 확장 (2025 Q3-Q4)
- 📅 글로벌 시장 진출
- 📅 B2B 솔루션 개발
- 📅 AR 가상 피팅 기능
- 📅 커뮤니티 기능 추가

---

## 👥 팀

현재 **1인 개발**로 진행 중이며, 투자 유치 후 다음 포지션 채용 예정:
- **AI/ML 엔지니어**: 추천 알고리즘 고도화
- **백엔드 개발자**: 확장 가능한 인프라 구축
- **UI/UX 디자이너**: 프리미엄 사용자 경험 설계
- **비즈니스 개발**: 파트너십 및 수익화 전략

---

## 📞 연락처

**투자 및 파트너십 문의**  
- GitHub: [@Comely15](https://github.com/Comely15)
- Email: [문의 이메일 추가 필요]

---

## 📄 라이선스

이 프로젝트는 비공개 소프트웨어입니다. 모든 권리는 저작권자에게 있습니다.

---

<div align="center">

**Mood Dive** - *당신의 스타일, AI가 찾아드립니다* 🌊

Made with ❤️ in Seoul, Korea

</div>
