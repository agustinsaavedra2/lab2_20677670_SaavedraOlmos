:- use_module(TDAChatbot_20677670_SaavedraOlmos, [chatbot/6, remove_duplicate_chatbots/3]).
:- use_module(TDAUser_20677670_SaavedraOlmos, [user/3, remove_duplicate_users/3]).
:- use_module(TDAChatHistory_20677670_SaavedraOlmos, [chatHistory/4]). 

% Dominio: Name (int) X InitialChatbotCodeLink (string) X Chatbots (list) X System (list).
% Metas Primarias: system/4.
% Metas Secundarias: remove_duplicate_chatbots, ListUsers, RegisterUsers, ChatHistory.
% Descripción: Predicado constructor de un sistema en un sistema de chatbots. 

system(Name, InitialChatbotCodeLink, Chatbots,
[Name, InitialChatbotCodeLink, ListChatbots, ListUsers, RegisterUsers, ChatHistory]):-
     remove_duplicate_chatbots(Chatbots, [], ListChatbots), 
     !,
     ListUsers = [],
     RegisterUsers = [],
     ChatHistory = [].

% Dominio: Name (int) X InitialChatbotCodeLink (string) X Chatbots (list) X System (list).
% Metas Primarias: system/6.
% Metas Secundarias: remove_duplicate_chatbots, ListUsers, RegisterUsers, ChatHistory.
% Descripción: Predicado constructor de un sistema en un sistema de chatbots. 

system(Name, InitialChatbotCodeLink, Chatbots,ListUsers, RegisterUser, ChatHistory,
[Name, InitialChatbotCodeLink, ListChatbots, ListUsers, RegisterUser, ChatHistory]):-
     remove_duplicate_chatbots(Chatbots, [], ListChatbots), 
     !.

% Dominio: Chatbots (list) X System (List).
% Metas Primarias: chatbots_system.
% Metas Secundarias: system.
% Descripción: Predicado selector que obtiene los chatbots de un sistema.
    
chatbots_system(Chatbots, System):-
    system(_,_,Chatbots,System).

% Dominio: ListUsers (list) X System (List).
% Metas Primarias: users_system.
% Metas Secundarias: system.
% Descripción: Predicado selector que obtiene los usuarios de un sistema.
        
users_system(ListUsers, System):-
    system(_,_,_,ListUsers,_,_,System).

% Dominio: RegisterUser (list) X System (List).
% Metas Primarias: registerUser_system.
% Metas Secundarias: system.
% Descripción: Predicado selector que obtiene el usuario registrado de un sistema.

registerUser_system(RegisterUser, System):-
    system(_,_,_,_,RegisterUser,_,System).

% Dominio: System (List) X Chatbot (List) X NewSystem (List).
% Metas Primarias: systemAddChatbot.
% Metas Secundarias: system, chatbots_system, remove_duplicate_chatbots, sort.
% Descripción: Predicado modificador que agrega un chatbot a una lista de chatbots de un
% sistema, si no se repite el código de ese chatbot en la lista de chatbots. En caso contrario,
% devuelve false.

systemAddChatbot(System, Chatbot, NewSystem):-
     system(Name, InitialChatbotCodeLink, _, System),
     chatbots_system(Chatbots, System),
     remove_duplicate_chatbots([Chatbot | Chatbots], [], ListChatbots),
     sort(ListChatbots, SystemChatbots),
     system(Name, InitialChatbotCodeLink, SystemChatbots, NewSystem).
     	
% Dominio: System (List) X UserName (string) X NewSystem (List).
% Metas Primarias: systemAddUser.
% Metas Secundarias: system, user, users_system, remove_duplicate_users, sort.
% Descripción: Predicado modificador que agrega un usuario a una lista de usuarios de un
% sistema, si no se repite el nombre de ese usuario en la lista de usuarios. En caso contrario,
% devuelve false. 	
	
systemAddUser(System, UserName, NewSystem):-
    system(Name,ChatbotCodeLink,Chatbots,_,RegisterUser,ChatHistory,System),
    user(UserName, [], User),
    users_system(ListUsers, System),
    remove_duplicate_users([User | ListUsers], [], Users),
    sort(Users, SystemUsers),
    system(Name,ChatbotCodeLink,Chatbots,SystemUsers,RegisterUser,ChatHistory,NewSystem).
 
% Dominio: System (List) X UserName (string) X NewSystem (List).
% Metas Primarias: systemLogin.
% Metas Secundarias: system, registerUser_system, user, member, length, L, append, system.
% Descripción: Predicado modificador que agrega un solo usuario registrado en el sistema a la lista de loggeados de un
% sistema. Si se desea agregar, se debe usar systemLogout para agregar otro.

systemLogin(System, UserName, NewSystem):-
    system(Name,ChatbotCodeLink,Chatbots,ListUsers,_,ChatHistory,System),
    registerUser_system(RegisterUser, System),
    user(UserName, [], UserLogin),
    member(UserLogin, ListUsers),
    length(RegisterUser, L),
    L < 1,
    append(UserLogin, RegisterUser, LoggedUser),
    system(Name,ChatbotCodeLink,Chatbots,ListUsers,LoggedUser,ChatHistory,NewSystem).
    
% Dominio: System (List) X NewSystem (List).
% Metas Primarias: systemLogout.
% Metas Secundarias: system.
% Descripción: Predicado modificador que elimina al usuario loggeado en el sistema.

systemLogout(System, NewSystem):-
     system(Name,ChatbotCodeLink,Chatbots,ListUsers,_,ChatHistory,System),
     system(Name,ChatbotCodeLink,Chatbots,ListUsers,[],ChatHistory,NewSystem).
