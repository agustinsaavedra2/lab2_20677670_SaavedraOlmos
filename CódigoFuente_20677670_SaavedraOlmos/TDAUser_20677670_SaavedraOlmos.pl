:-module(TDAUser_20677670_SaavedraOlmos, [user/3, remove_duplicate_users/3]). 

% Dominio: Name (string) X ChatHistory (List) X User (List).
% Metas Primarias: user.
% Metas Secundarias: No posee metas secundarias.
% Descripción: Predicado constructor de un usuario en un sistema de chatbots.

user(Name, ChatHistory, [Name, ChatHistory]).

% Dominio: Name (string) X User (List).
% Metas Primarias: name_user.
% Metas Secundarias: user.
% Descripción: Predicado selector que obtiene el nombre de un usuario.

name_user(Name, User):-
    user(Name, _, User).

% Dominio: Users (List) X UsersName (List) X ListUsers (List).
% Metas Primarias: remove_duplicate_users.
% Metas Secundarias: name_user, member, remove_duplicate_users.
% Descripción: Predicado con relación recursiva natural que elimina usuarios duplicados de una lista de 
% usuarios, en base a su ID.

remove_duplicate_users([], _, []).

remove_duplicate_users([User | RestUsers], UsersName, [User | ListUsers]):-
    name_user(Name, User),
    \+ member(Name, UsersName),
    remove_duplicate_users(RestUsers, [Name | UsersName], ListUsers).
