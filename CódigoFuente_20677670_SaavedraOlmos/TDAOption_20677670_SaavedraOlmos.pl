option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords, 
        [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords]).

code_option(Code, Option):-
    option(Code,_,_,_,_,Option).

combine1([],_,[]).

combine1([H|T],List2,[H|L]):-
    \+ member(H,List2),
    combine1(T,[H | List2],L).

combine1([H|T],List2,L):-
    member(H,List2),
    combine1(T,List2,L).