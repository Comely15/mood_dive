from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional
import random

app = FastAPI(title="Alter Ego Chatbot API")

# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins for development
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ChatRequest(BaseModel):
    message: str
    style_context: Optional[str] = None

class ChatResponse(BaseModel):
    response: str

@app.get("/")
async def root():
    return {"message": "Alter Ego Chatbot API is running"}

from prompts import get_response

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    """
    Simple mock chatbot that responds based on style context.
    In a real app, this would call OpenAI/Gemini.
    """
    msg = request.message
    style = request.style_context or "general"
    
    response_text = get_response(style, msg)
    return {"response": response_text}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
