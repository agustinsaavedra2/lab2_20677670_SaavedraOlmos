:- module(TDAChatHistory_20677670_SaavedraOlmos, [chatHistory/4]).

% Dominio: UserName (string) X Message (string) X FlowChatbot (list) X ChatHistory (list).
% Metas Primarias: chatHistory.
% Metas Secundarias: No posee metas secundarias.
% Descripción: Predicado constructor de un chatHistory en un sistema de chatbots.

chatHistory(UserName, Message, FlowChatbot, [[UserName, Message], FlowChatbot]).
