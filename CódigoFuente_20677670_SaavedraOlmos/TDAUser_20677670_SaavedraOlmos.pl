:-module(tda_user, [user/3, remove_duplicate_users/3]). 

user(Name, ChatHistory, [Name, ChatHistory]).

name_user(Name, User):-
    user(Name, _, User).

remove_duplicate_users([], _, []).

remove_duplicate_users([User | RestUsers], UsersName, [User | ListUsers]):-
    name_user(Name, User),
    \+ member(Name, UsersName),
    remove_duplicate_users(RestUsers, [Name | UsersName], ListUsers).
