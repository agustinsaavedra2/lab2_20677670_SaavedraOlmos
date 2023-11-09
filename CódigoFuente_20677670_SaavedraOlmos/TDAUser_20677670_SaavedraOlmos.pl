:- module(tda_user, [user/3])

user(Name, ChatHistory, [Name, ChatHistory]).

name_user(Name, User):-
    user(Name, _, User).