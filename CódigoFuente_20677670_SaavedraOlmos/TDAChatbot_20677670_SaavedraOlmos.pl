chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows,
[ChatbotID, Name, WelcomeMessage, StartFlowID, ListFlows]):-
    combine2(Flows, [], ListFlows).

id_chatbot(ID, Chatbot):-
    chatbot(ID,_,_,_,_,Chatbot).

flows_chatbot(Flows, Chatbot):-
    chatbot(_,_,_,_,Flows,Chatbot).