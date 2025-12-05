# Mood Dive Shopping Assistant Backend

로컬 Llama (Ollama)를 사용한 쇼핑 어시스턴트 백엔드 서버

## 필수 요구사항

### 1. Ollama 설치

```bash
# macOS
brew install ollama

# 또는 공식 사이트에서 다운로드
# https://ollama.ai/download
```

### 2. Llama 모델 다운로드

```bash
# Llama 3.2 모델 다운로드 (권장)
ollama pull llama3.2

# 또는 다른 모델
# ollama pull llama2
# ollama pull llama3.1
```

### 3. Python 환경 설정

```bash
# 가상환경 생성 (선택사항)
python3 -m venv venv
source venv/bin/activate  # macOS/Linux
# venv\Scripts\activate  # Windows

# 의존성 설치
pip install -r requirements.txt
```

## 실행 방법

### 1. Ollama 서버 시작

```bash
# 백그라운드에서 Ollama 실행
ollama serve
```

### 2. FastAPI 서버 시작

```bash
# 백엔드 디렉토리에서
python main.py
```

서버가 `http://localhost:8000`에서 실행됩니다.

### 3. 서버 상태 확인

```bash
# 브라우저에서 열기
open http://localhost:8000

# 또는 curl로 확인
curl http://localhost:8000/health
```

## API 엔드포인트

### GET /
서버 정보 확인

### GET /health
Ollama 연결 상태 확인

### POST /chat
채팅 메시지 전송

**Request Body:**
```json
{
  "message": "캐주얼한 청바지 추천해줘",
  "style_context": "데일리",
  "age_group": "20s"
}
```

**Response:**
```json
{
  "response": "완전 좋은 선택이에요! 😊 데일리룩으로 청바지는 필수죠..."
}
```

### POST /greeting
초기 인사말 생성

**Request Body:**
```json
{
  "style_context": "모던",
  "age_group": "30s"
}
```

## 연령대별 특징

- **20s**: 트렌디하고 캐주얼, 이모지 사용, 최신 트렌드
- **30s**: 실용적이고 전문적, 가성비와 품질 균형
- **40s**: 신뢰감 있고 정중, 품질과 브랜드 중시
- **50s**: 친절하고 자세한 설명, 클래식하고 검증된 제품

## 트러블슈팅

### Ollama 연결 실패
```bash
# Ollama가 실행 중인지 확인
ps aux | grep ollama

# Ollama 재시작
killall ollama
ollama serve
```

### 모델이 없다는 에러
```bash
# 사용 가능한 모델 확인
ollama list

# 모델 다운로드
ollama pull llama3.2
```

### 포트 충돌
`main.py`에서 포트 번호 변경:
```python
uvicorn.run(app, host="0.0.0.0", port=8001)  # 8000 -> 8001
```

## 개발 모드

```bash
# 자동 재시작 모드로 실행
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```
