:-use_module(tda_option, [option/6, remove_duplicate_options/3, addOptionToOptions/3]).

flow(ID, Name_Message, Options, [ID, Name_Message, FlowOptions]):-
    remove_duplicate_options(Options, [], FlowOptions).

id_flow(ID, Flow):-
    flow(ID,_,_,Flow).

options_flow(Options, Flow):-
    flow(_,_,Options,Flow).

flowAddOption(Flow, NewOption, NewFlow):-
    flow(ID, Name, _, Flow),
    options_flow(Options, Flow),
    addOptionToOptions(Options, NewOption, ListOptions),
    flow(ID, Name, ListOptions, NewFlow).

combine2([],_,[]).

combine2([H|T],List2,[H|L]):-
    \+member(H,List2),
    combine1(T,[H | List2],L).

combine2([H|T],List2,L):-
    member(H,List2),
    combine1(T,List2,L).