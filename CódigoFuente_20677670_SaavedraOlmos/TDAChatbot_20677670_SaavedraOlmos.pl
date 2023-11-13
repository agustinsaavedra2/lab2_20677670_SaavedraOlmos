:- module(tda_chatbot, [chatbot/6, remove_duplicate_chatbots/3]).
:- use_module(tda_flow, [flow/4, remove_duplicate_flows/3, id_flow/2, id_flows/2]).

% Dominio: ChatbotID (int) X Name (string) X WelcomeMessage (string) X StartFlowID (int)
% X Flows (List) X Chatbot (List).
% Metas Primarias: chatbot.
% Metas Secundarias: remove_duplicate_flows.
% Descripción: Predicado constructor de un chatbot en un sistema de chatbots.

chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows,
[ChatbotID, Name, WelcomeMessage, StartFlowID, ListFlows]):-
    remove_duplicate_flows(Flows, [], ListFlows), 
    !.

id_chatbot(ID, Chatbot):-
    chatbot(ID,_,_,_,_,Chatbot).

chatbotAddFlow([], _, []).

chatbotAddFlow([ID, Name, WelcomeMessage, StartFlowID, [Flow | RestFlows]], NewFlow, 
               [ID, Name, WelcomeMessage, StartFlowID, [Flow | [NewFlow | ListFlows]]]):-
    id_flow(IDNewFlow, NewFlow),
    id_flows([Flow | RestFlows], FlowsID),
    \+ member(IDNewFlow, FlowsID),
    chatbotAddFlow(RestFlows, [NewFlow | ListFlows], ListFlows).

% Dominio: Chatbots (List) X IDChatbots (List) X ListChatbots (List).
% Metas Primarias: remove_duplicate_chatbots.
% Metas Secundarias: id_chatbot, member, remove_duplicate_chatbots.
% Descripción: Predicado que elimina chatbots duplicados de una lista de 
% chatbots, en base a su ID.

remove_duplicate_chatbots([],_,[]).

remove_duplicate_chatbots([Chatbot | RestChatbots],IDChatbots,[Chatbot|ListChatbots]):-
    id_chatbot(ChatbotID, Chatbot),
    \+ member(ChatbotID, IDChatbots),
    remove_duplicate_chatbots(RestChatbots, [ChatbotID | IDChatbots], ListChatbots).
