:- module(TDAOption_20677670_SaavedraOlmos, [option/6, addOptionToOptions/3, remove_duplicate_options/3]).

% Dominio: Code (int) X Message (string) X ChatbotCodeLink (int) X InitialFlowCodeLink (int)
% X Keywords (List) X Option (List).
% Metas Primarias: option.
% Metas Secundarias: No posee metas secundarias.
% Descripción: Predicado constructor de una opción para un flujo en un sistema de chatbots.

option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords, 
        [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords]).
        
% Dominio: Code (int) X Option (List).
% Metas Primarias: code_option.
% Metas Secundarias: option.
% Descripción: Predicado selector que obtiene el código de una opción.

code_option(Code, Option):-
    option(Code,_,_,_,_,Option).

% Dominio: Options (List) X NewOption (List) X ListOptions (List).
% Metas Primarias: addOptionToOptions.
% Metas Secundarias: No posee metas secundarias.
% Descripción: Predicado modificador que agrega una opción a una lista de opciones.

addOptionToOptions(Options, NewOption, [NewOption | Options]).

% Dominio: Options (List) X OptionCodes (List) X ListOptions (List).
% Metas Primarias: remove_duplicate_options.
% Metas Secundarias: code_option, member, remove_duplicate_options.
% Descripción: Predicado con recursión natural que elimina opciones duplicadas 
% de una lista de opciones, a través de su código (code).

remove_duplicate_options([], _, []).

remove_duplicate_options([Option | RestOptions], OptionCodes, [Option | ListOptions]):-
    code_option(Code, Option),
    \+ member(Code, OptionCodes),
    remove_duplicate_options(RestOptions, [Code | OptionCodes], ListOptions).

