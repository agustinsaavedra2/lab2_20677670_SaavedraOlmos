system(Name, InitialChatbotCodeLink, Chatbots,
[Name, InitialChatbotCodeLink, ListChatbots]):-
     combine3(Chatbots, [], ListChatbots).

chatbots_system(Chatbots, System):-
    system(_,_,Chatbots,System).

systemAddChatbot(System, Chatbot, NewSystem):-
     system(Name, InitialChatbotCodeLink, _, System),
     chatbots_system(Chatbots, System),
     combine3([Chatbot | Chatbots], [], ListChatbots),
     system(Name, InitialChatbotCodeLink, ListChatbots, NewSystem).