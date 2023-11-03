flow(ID, Name_Message, Options, [ID, Name_Message, ListOptions]):-
    combine1(Options, [], ListOptions).

id_flow(ID, Flow):-
    flow(ID,_,_,Flow).

options_flow(Options, Flow):-
    flow(_,_,Options,Flow).

flowAddOption(Flow, NewOption, NewFlow):-
    flow(ID, Name, _, Flow),
    options_flow(Options, Flow),
    combine1([NewOption | Options], [], FlowOptions),
    flow(ID,Name,FlowOptions,NewFlow).

combine2([],_,[]).

combine2([H|T],List2,[H|L]):-
    \+member(H,List2),
    combine1(T,[H | List2],L).

combine2([H|T],List2,L):-
    member(H,List2),
    combine1(T,List2,L).