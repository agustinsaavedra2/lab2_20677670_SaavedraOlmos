option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords, 
        [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords]).

code_option(Code, Option):-
    option(Code,_,_,_,_,Option).