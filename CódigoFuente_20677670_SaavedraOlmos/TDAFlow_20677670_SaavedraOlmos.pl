:-module(tda_flow, [flow/4, remove_duplicate_flows/3]).
:-use_module(tda_option, [option/6, remove_duplicate_options/3, addOptionToOptions/3]).

flow(ID, Name_Message, Options, [ID, Name_Message, FlowOptions]):-
    remove_duplicate_options(Options, [], FlowOptions), !.

id_flow(ID, Flow):-
    flow(ID,_,_,Flow).

options_flow(Options, Flow):-
    flow(_,_,Options,Flow).

flowAddOption(Flow, NewOption, NewFlow):-
    flow(ID, Name, _, Flow),
    options_flow(Options, Flow),
    addOptionToOptions(Options, NewOption, ListOptions),
    flow(ID, Name, ListOptions, NewFlow).

remove_duplicate_flows([], _, []).

remove_duplicate_flows([Flow | RestFlows], IDFlows, [Flow | ListFlows]):-
    id_flow(FlowID, Flow),
    \+ member(FlowID, IDFlows),
    remove_duplicate_flows(RestFlows, [FlowID | IDFlows], ListFlows).
