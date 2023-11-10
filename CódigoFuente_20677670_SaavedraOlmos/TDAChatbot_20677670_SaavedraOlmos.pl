:- module(tda_chatbot, [chatbot/6, remove_duplicate_chatbots/3]).
:- use_module(tda_flow, [flow/4, remove_duplicate_flows/3]).

chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows,
[ChatbotID, Name, WelcomeMessage, StartFlowID, ListFlows]):-
    remove_duplicate_flows(Flows, [], ListFlows), !.

id_chatbot(ID, Chatbot):-
    chatbot(ID,_,_,_,_,Chatbot).

flows_chatbot(Flows, Chatbot):-
    chatbot(_,_,_,_,Flows,Chatbot).

chatbotAddFlow(Chatbot, Flow, NewChatbot):-
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, _, Chatbot),
    flows_chatbot(Flows, Chatbot),
    append(Flows, [Flow], ListFlows),
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, ListFlows, NewChatbot).

remove_duplicate_chatbots([],_,[]).

remove_duplicate_chatbots([Chatbot | RestChatbots],IDChatbots,[Chatbot|ListChatbots]):-
    id_chatbot(ChatbotID, Chatbot),
    \+ member(ChatbotID, IDChatbots),
    remove_duplicate_chatbots(RestChatbots, [ChatbotID | IDChatbots], ListChatbots).