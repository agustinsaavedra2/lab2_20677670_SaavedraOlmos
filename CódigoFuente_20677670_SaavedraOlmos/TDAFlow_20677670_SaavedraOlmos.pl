:-module(tda_flow, [flow/4, remove_duplicate_flows/3, id_flow/2,id_flows/2]).
:-use_module(tda_option, [option/6, remove_duplicate_options/3, addOptionToOptions/3]).

% Dominio: ID (int) X Name_Message (string) X Options (List) X Flow (List).
% Metas Primarias: flow.
% Metas Secundarias: remove_duplicate_options.
% Descripción: Predicado constructor de un flujo en un sistema de chatbots.

flow(ID, Name_Message, Options, [ID, Name_Message, FlowOptions]):-
    remove_duplicate_options(Options, [], FlowOptions),
    !.

% Dominio: ID (int) X Flow (List).
% Metas Primarias: id_flow.
% Metas Secundarias: flow.
% Descripción: Predicado selector que obtiene el id de un flujo.

id_flow(ID, Flow):-
    flow(ID,_,_,Flow).

% Dominio: Options (List) X Flow (List).
% Metas Primarias: options_flow.
% Metas Secundarias: flow.
% Descripción: Predicado selector que obtiene las opciones de un flujo.

options_flow(Options, Flow):-
    flow(_,_,Options,Flow).

% Dominio: Flow (List) X NewOption (List) X NewFlow (List).
% Metas Primarias: flowAddOption.
% Metas Secundarias: flow, options_flow, addOptionToOptions, remove_duplicate_options,
% sort.
% Descripción: Predicado modificador que agrega una opción a una lista de opciones de un
% flujo, si no se repite el código de esa opción en la lista de opciones. En caso contrario,
% devuelve false.

flowAddOption(Flow, NewOption, NewFlow):-
    flow(ID, Name, _, Flow),
    options_flow(Options, Flow),
    addOptionToOptions(Options, NewOption, NewOptions),
    remove_duplicate_options(NewOptions, [], ListOptions),
    sort(ListOptions, FlowOptions),
    flow(ID, Name, FlowOptions, NewFlow).

id_flows([], []).

id_flows([Flow | RestFlows], [IDFlow | RestIDFlows]):-
    id_flow(IDFlow, Flow),
    id_flows(RestFlows, RestIDFlows).

% Dominio: Flows (List) X IDFlows (List) X ListFlows (List).
% Metas Primarias: remove_duplicate_flows.
% Metas Secundarias: id_flow, member, remove_duplicate_flows.
% Descripción: Predicado que elimina flujos duplicados de una lista de 
% flujos, en base a su ID.

remove_duplicate_flows([], _, []).

remove_duplicate_flows([Flow | RestFlows], IDFlows, [Flow | ListFlows]):-
    id_flow(FlowID, Flow),
    \+ member(FlowID, IDFlows),
    remove_duplicate_flows(RestFlows, [FlowID | IDFlows], ListFlows).
