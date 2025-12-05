"""
FastAPI 백엔드 서버
로컬 Ollama와 통신하여 쇼핑 어시스턴트 기능 제공
"""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import httpx
from typing import Optional
from prompts import get_shopping_prompt, get_initial_greeting

app = FastAPI(title="Mood Dive Shopping Assistant")

# CORS 설정 (Flutter 앱에서 접근 가능하도록)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Ollama 설정
OLLAMA_BASE_URL = "http://localhost:11434"
OLLAMA_MODEL = "llama3.2"  # 또는 "llama2", "llama3.1" 등

class ChatRequest(BaseModel):
    message: str
    style_context: str
    age_group: Optional[str] = "30s"  # 기본값: 30대

class ChatResponse(BaseModel):
    response: str

class GreetingRequest(BaseModel):
    style_context: str
    age_group: Optional[str] = "30s"

@app.get("/")
async def root():
    return {
        "message": "Mood Dive Shopping Assistant API",
        "status": "running",
        "ollama_url": OLLAMA_BASE_URL,
        "model": OLLAMA_MODEL
    }

@app.get("/health")
async def health_check():
    """Ollama 연결 상태 확인"""
    try:
        async with httpx.AsyncClient() as client:
            response = await client.get(f"{OLLAMA_BASE_URL}/api/tags")
            if response.status_code == 200:
                return {"status": "healthy", "ollama": "connected"}
            else:
                return {"status": "unhealthy", "ollama": "disconnected"}
    except Exception as e:
        return {"status": "unhealthy", "error": str(e)}

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    """
    사용자 메시지를 받아 Ollama를 통해 응답 생성
    """
    try:
        # 프롬프트 생성
        prompt = get_shopping_prompt(
            user_message=request.message,
            style_context=request.style_context,
            age_group=request.age_group
        )
        
        # Ollama API 호출
        async with httpx.AsyncClient(timeout=60.0) as client:
            ollama_response = await client.post(
                f"{OLLAMA_BASE_URL}/api/generate",
                json={
                    "model": OLLAMA_MODEL,
                    "prompt": prompt,
                    "stream": False,
                    "options": {
                        "temperature": 0.7,
                        "top_p": 0.9,
                        "max_tokens": 500
                    }
                }
            )
            
            if ollama_response.status_code != 200:
                raise HTTPException(
                    status_code=500,
                    detail=f"Ollama API error: {ollama_response.text}"
                )
            
            result = ollama_response.json()
            ai_response = result.get("response", "")
            
            if not ai_response:
                raise HTTPException(
                    status_code=500,
                    detail="Empty response from Ollama"
                )
            
            return ChatResponse(response=ai_response)
            
    except httpx.ConnectError:
        raise HTTPException(
            status_code=503,
            detail="Ollama 서버에 연결할 수 없습니다. Ollama가 실행 중인지 확인해주세요."
        )
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Error: {str(e)}"
        )

@app.post("/greeting", response_model=ChatResponse)
async def get_greeting(request: GreetingRequest):
    """
    스타일과 연령대에 맞는 초기 인사말 반환
    """
    greeting = get_initial_greeting(
        style_context=request.style_context,
        age_group=request.age_group
    )
    return ChatResponse(response=greeting)

if __name__ == "__main__":
    import uvicorn
    print("🚀 Starting Mood Dive Shopping Assistant API...")
    print(f"📡 Ollama URL: {OLLAMA_BASE_URL}")
    print(f"🤖 Model: {OLLAMA_MODEL}")
    print("=" * 50)
    uvicorn.run(app, host="0.0.0.0", port=8000)
