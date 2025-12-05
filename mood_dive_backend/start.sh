#!/bin/bash

echo "🚀 Mood Dive 쇼핑 어시스턴트 백엔드 시작"
echo "=" | tr '=' '=' | head -c 50; echo

# Ollama 설치 확인
if ! command -v ollama &> /dev/null; then
    echo "❌ Ollama가 설치되어 있지 않습니다."
    echo ""
    echo "Ollama 설치 방법:"
    echo "  brew install ollama"
    echo "  또는 https://ollama.ai/download 에서 다운로드"
    echo ""
    exit 1
fi

echo "✅ Ollama 설치 확인됨"

# Llama 모델 확인
if ! ollama list | grep -q "llama3.2"; then
    echo "⚠️  Llama 3.2 모델이 설치되어 있지 않습니다."
    echo "📥 Llama 3.2 모델 다운로드 중..."
    ollama pull llama3.2
fi

echo "✅ Llama 모델 준비 완료"

# Ollama 서버 시작 (백그라운드)
echo "🔄 Ollama 서버 시작 중..."
ollama serve > /dev/null 2>&1 &
OLLAMA_PID=$!
sleep 2

echo "✅ Ollama 서버 실행 중 (PID: $OLLAMA_PID)"

# Python 가상환경 확인 및 생성
if [ ! -d "venv" ]; then
    echo "📦 Python 가상환경 생성 중..."
    python3 -m venv venv
fi

# 가상환경 활성화
source venv/bin/activate

# 의존성 설치
echo "📦 Python 패키지 설치 중..."
pip install -q -r requirements.txt

# FastAPI 서버 시작
echo "🚀 FastAPI 서버 시작..."
echo ""
echo "✨ 서버가 http://localhost:8000 에서 실행됩니다"
echo "📊 Health check: http://localhost:8000/health"
echo ""
echo "종료하려면 Ctrl+C를 누르세요"
echo ""

python main.py
