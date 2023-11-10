:- module(tda_option, [option/6, addOptionToOptions/3, remove_duplicate_options/3]).

option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords, 
        [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords]).

code_option(Code, Option):-
    option(Code,_,_,_,_,Option).

addOptionToOptions(Options, NewOption, [NewOption | Options]).

remove_duplicate_options([], _, []).

remove_duplicate_options([Option | RestOptions], OptionCodes, [Option | ListOptions]):-
    code_option(Code, Option),
    \+ member(Code, OptionCodes),
    remove_duplicate_options(RestOptions, [Code | OptionCodes], ListOptions).
