# Shopping-related prompts and responses for the chatbot

SHOPPING_PROMPTS = {
    "default": [
        "이 스타일은 어떠신가요? 비슷한 느낌의 다른 아이템도 추천해 드릴까요?",
        "선택하신 무드에 맞는 신상품들이 많이 입고되었습니다. 구경해 보시겠어요?",
        "이런 스타일링에는 심플한 액세서리가 잘 어울립니다. 함께 보시겠어요?",
        "고객님의 취향이 정말 멋지시네요! 이 스타일을 완성할 수 있는 아이템들을 골라봤습니다."
    ],
    "minimalist": [
        "절제된 미학이 돋보이는 선택이네요. 핏이 좋은 화이트 셔츠나 슬랙스를 추천드립니다.",
        "미니멀한 룩에는 소재가 중요하죠. 고급스러운 텍스처의 아이템들을 보여드릴까요?",
        "깔끔하고 세련된 느낌을 원하신다면, 모노톤의 코디를 제안해 드립니다."
    ],
    "vintage": [
        "빈티지한 감성이 물씬 풍기네요! 레트로한 패턴의 원피스나 자켓은 어떠신가요?",
        "시간이 지날수록 멋스러운 빈티지 데님 아이템들을 추천해 드리고 싶어요.",
        "유니크한 액세서리로 포인트를 주면 더욱 멋진 빈티지 룩이 완성될 거예요."
    ],
    "street": [
        "힙한 스트릿 무드가 느껴지네요. 오버핏 후드나 조거 팬츠로 편안하면서도 멋스럽게 연출해 보세요.",
        "스트릿 패션의 완성은 스니커즈죠! 요즘 핫한 스니커즈 컬렉션을 보여드릴까요?",
        "레이어드 룩으로 개성을 표현해 보는 건 어떨까요? 다양한 레이어링 아이템을 추천해 드립니다."
    ],
    "feminine": [
        "우아하고 여성스러운 분위기가 정말 잘 어울리세요. 실루엣이 예쁜 블라우스는 어떠신가요?",
        "로맨틱한 무드를 더해줄 파스텔 톤의 아이템들을 추천해 드립니다.",
        "특별한 날을 위한 드레스업 아이템들을 모아봤습니다. 한번 보시겠어요?"
    ],
    "casual": [
        "편안하면서도 스타일리시한 데일리룩이네요. 활용도 높은 기본템들을 추천해 드릴까요?",
        "꾸안꾸(꾸민 듯 안 꾸민 듯) 스타일의 정석이죠. 매일 입기 좋은 편안한 아이템들을 보여드릴게요.",
        "활동성이 좋으면서도 멋스러운 캐주얼 아이템들이 준비되어 있습니다."
    ]
}

def get_response(style: str, message: str) -> str:
    """
    Returns a natural shopping-related response based on style and message.
    """
    import random
    
    # Normalize style to match keys
    style_key = "default"
    for key in SHOPPING_PROMPTS.keys():
        if key in style.lower():
            style_key = key
            break
            
    # Simple keyword matching for context (can be expanded)
    if "추천" in message or "보여줘" in message:
        return f"네, {style} 스타일에 딱 맞는 아이템들을 찾아보겠습니다. 가격대는 어느 정도로 생각하시나요?"
    
    if "가격" in message or "얼마" in message:
        return "다양한 가격대의 상품이 준비되어 있습니다. 원하시는 예산을 말씀해 주시면 맞춰서 추천해 드릴게요."

    # Return a random prompt for the style
    return random.choice(SHOPPING_PROMPTS[style_key])
