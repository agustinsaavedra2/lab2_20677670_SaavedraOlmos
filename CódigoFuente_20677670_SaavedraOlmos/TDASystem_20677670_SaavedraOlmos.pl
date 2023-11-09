:- use_module(tda_chatbot, [chatbot/6, combine3/3]).
:- use_module(tda_user, [user/3]). 

system(Name, InitialChatbotCodeLink, Chatbots,
[Name, InitialChatbotCodeLink, ListChatbots]):-
     combine3(Chatbots, [], ListChatbots).

users_system(System, Users):-
     system(_,_,_,Users,_,_,System).

userLogin_system(System, UserLogin):-
     system(_,_,_,_,UserLogin,_,System).

chatbots_system(Chatbots, System):-
    system(_,_,Chatbots,System).

systemAddChatbot(System, Chatbot, NewSystem):-
     system(Name, InitialChatbotCodeLink, _, System),
     chatbots_system(Chatbots, System),
     combine3([Chatbot | Chatbots], [], ListChatbots),
     system(Name, InitialChatbotCodeLink, ListChatbots, NewSystem).

systemAddUser(System, UserName, NewSystem):-
     system(Name,InitialChatbotCodeLink,Chatbots,_,UserLogin,ChatbotHistory,System),
     users_system(System, SystemUsers),
     user(UserName, User),
     \+ member(UserName, SystemUsers),
     append(SystemUsers, User, ListUsers),
     system(Name,InitialChatbotCodeLink,Chatbots,ListUsers,UserLogin,ChatbotHistory,NewSystem).

systemAddUser(System, UserName, NewSystem):-
     system(Name,InitialChatbotCodeLink,Chatbots,_,UserLogin,ChatbotHistory,System),
     users_system(System, SystemUsers),
     user(UserName, User),
     member(UserName, SystemUsers),
     system(Name,InitialChatbotCodeLink,Chatbots,SystemUsers,UserLogin,ChatbotHistory,NewSystem).