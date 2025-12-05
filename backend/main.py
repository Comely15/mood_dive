from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Optional
import os
from dotenv import load_dotenv
from groq import Groq

# Load environment variables
load_dotenv()

app = FastAPI(title="Mood Dive Chatbot API")

# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins for development
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Initialize Groq client
groq_api_key = os.getenv("GROQ_API_KEY")
if not groq_api_key:
    print("WARNING: GROQ_API_KEY not found in environment variables")
    print("Please create a .env file with your API key")
    print("Get your API key from: https://console.groq.com/keys")

groq_client = Groq(api_key=groq_api_key) if groq_api_key else None

class ChatRequest(BaseModel):
    message: str
    style_context: Optional[str] = None

class ChatResponse(BaseModel):
    response: str

@app.get("/")
async def root():
    return {
        "message": "Mood Dive Chatbot API is running",
        "model": "Llama 3.1 8B via Groq",
        "status": "ready" if groq_client else "missing_api_key"
    }

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    """
    Fashion chatbot powered by Groq's Llama 3.1 8B model.
    """
    if not groq_client:
        raise HTTPException(
            status_code=500,
            detail="Groq API key not configured. Please set GROQ_API_KEY in .env file"
        )

    try:
        # Build system prompt based on style context
        style = request.style_context or "general"

        system_prompt = f"""당신은 패션 스타일링 전문가입니다. 사용자가 선택한 스타일은 '{style}'입니다.

다음 가이드라인을 따라 답변해주세요:
- 친근하고 전문적인 톤으로 대화합니다
- 구체적인 스타일링 조언과 아이템 추천을 제공합니다
- 사용자의 취향을 존중하면서도 새로운 제안을 합니다
- 답변은 2-3문장으로 간결하게 작성합니다
- 한국어로 답변합니다"""

        # Call Groq API
        chat_completion = groq_client.chat.completions.create(
            messages=[
                {
                    "role": "system",
                    "content": system_prompt
                },
                {
                    "role": "user",
                    "content": request.message
                }
            ],
            model="llama-3.1-8b-instant",  # Groq's Llama 3.1 8B model
            temperature=0.7,
            max_tokens=200,
            top_p=0.9,
        )

        response_text = chat_completion.choices[0].message.content
        return {"response": response_text}

    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Error calling Groq API: {str(e)}"
        )

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
