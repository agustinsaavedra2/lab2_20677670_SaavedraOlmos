:- use_module(tda_chatbot, [chatbot/6, remove_duplicate_chatbots/3]).
:- use_module(tda_user, [user/3, remove_duplicate_users/3]). 

system(Name, InitialChatbotCodeLink, Chatbots,
[Name, InitialChatbotCodeLink, ListChatbots, ListUsers, RegisterUsers, ChatHistory]):-
     remove_duplicate_chatbots(Chatbots, [], ListChatbots), 
     !,
     ListUsers = [],
     RegisterUsers = [],
     ChatHistory = [].

system(Name, InitialChatbotCodeLink, Chatbots,ListUsers, RegisterUser, ChatHistory,
[Name, InitialChatbotCodeLink, ListChatbots, ListUsers, RegisterUser, ChatHistory]):-
     remove_duplicate_chatbots(Chatbots, [], ListChatbots), 
     !.
    
chatbots_system(Chatbots, System):-
    system(_,_,Chatbots,System).

users_system(ListUsers, System):-
    system(_,_,_,ListUsers,_,_,System).

registerUser_system(RegisterUser, System):-
    system(_,_,_,_,RegisterUser,_,System).

systemAddChatbot(System, Chatbot, NewSystem):-
     system(Name, InitialChatbotCodeLink, _, System),
     chatbots_system(Chatbots, System),
     remove_duplicate_chatbots([Chatbot | Chatbots], [], ListChatbots),
     sort(ListChatbots, SystemChatbots),
     system(Name, InitialChatbotCodeLink, SystemChatbots, NewSystem).	
	
systemAddUser(System, UserName, NewSystem):-
    system(Name,ChatbotCodeLink,Chatbots,_,RegisterUser,ChatHistory,System),
    user(UserName, [], User),
    users_system(ListUsers, System),
    remove_duplicate_users([User | ListUsers], [], Users),
    sort(Users, SystemUsers),
    system(Name,ChatbotCodeLink,Chatbots,SystemUsers,RegisterUser,ChatHistory,NewSystem).

systemLogin(System, UserName, NewSystem):-
    system(Name,ChatbotCodeLink,Chatbots,ListUsers,_,ChatHistory,System),
    registerUser_system(RegisterUser, System),
    user(UserName, [], UserLogin),
    member(UserLogin, ListUsers),
    length(RegisterUser, L),
    L < 1,
    append(UserLogin, RegisterUser, LoggedUser),
    system(Name,ChatbotCodeLink,Chatbots,ListUsers,LoggedUser,ChatHistory,NewSystem).

systemLogout(System, NewSystem):-
     system(Name,ChatbotCodeLink,Chatbots,ListUsers,_,ChatHistory,System),
     system(Name,ChatbotCodeLink,Chatbots,ListUsers,[],ChatHistory,NewSystem).