chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows,
[ChatbotID, Name, WelcomeMessage, StartFlowID, ListFlows]):-
    combine2(Flows, [], ListFlows).

id_chatbot(ID, Chatbot):-
    chatbot(ID,_,_,_,_,Chatbot).

flows_chatbot(Flows, Chatbot):-
    chatbot(_,_,_,_,Flows,Chatbot).

chatbotAddFlow(Chatbot, Flow, NewChatbot):-
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, _, Chatbot),
    flows_chatbot(Flows, Chatbot),
    append(Flows, [Flow], ListFlows),
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, ListFlows, NewChatbot).

combine3([],_,[]).

combine3([H|T],List2,[H|L]):-
    \+ member(H,List2),
    combine3(T,List2,L).

combine3([H|T],List2,L):-
    member(H,List2),
    combine3(T,List2,L).