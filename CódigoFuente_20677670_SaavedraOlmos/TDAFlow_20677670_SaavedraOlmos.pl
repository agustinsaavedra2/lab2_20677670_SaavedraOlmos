flow(ID, Name_Message, Options, [ID, Name_Message, ListOptions]):-
    combine1(Options, [], ListOptions).

id_flow(ID, Flow):-
    flow(ID,_,_,Flow).

options_flow(Options, Flow):-
    flow(_,_,Options,Flow).