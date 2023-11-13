:-consult('TDAOption_20677670_SaavedraOlmos').
:-consult('TDAFlow_20677670_SaavedraOlmos').
:-consult('TDAChatbot_20677670_SaavedraOlmos').
:-consult('TDASystem_20677670_SaavedraOlmos').
:-consult('TDAUser_20677670_SaavedraOlmos').
:-consult('TDAChatHistory_20677670_SaavedraOlmos').

% Los predicados systemTalkRec, systemSynthesis y systemSimulate están planteados como 
% comentarios, debido a que no se realizó el código de estos predicados. 

% Script de pruebas 1.

option(1, "1) Viajar", 2, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10, OP2, F11),
% flowAddOption(F10, OP1, F12), %si esto se descomenta, debe dar false, porque es opción con id duplicada.
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), %solo añade una ocurrencia de F11
%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),
%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3, OP4, OP5, OP6], F20),
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7, OP8, OP9, OP10], F21),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11, OP12, OP13, OP14, OP15], F22),
chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1, [F20, F21, F22], CB1),
%Chatbot2
option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16, OP17, OP18], F30),
chatbot(2, "Orientador Académico",  "Bienvenido\n¿Qué te gustaría estudiar?", 1, [F30], CB2),
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),
systemAddUser(S02, "user1", S2),
systemAddUser(S2, "user2", S3),
% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user3", S5),
% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.
systemLogin(S5, "user1", S7),
% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login
systemLogout(S7, S9),
systemLogin(S9, "user2", S10),
% systemTalkRec(S10, "hola", S11), % si se descomenta, daría false por que “hola” no es un option o keyword
% systemTalkRec(S110, "1", S12),
% systemTalkRec(S12, "1", S13),
% systemTalkRec(S13, "Museo", S14),
% systemTalkRec(S14, "1", S15),
% systemTalkRec(S15, "3", S16),
% systemTalkRec(S16, "5", S17),
% systemSynthesis(S17, "user2", Str1),
% systemSimulate(S3, 5, 32131, S99).


% Script de pruebas propio 

option(1, "1) Hotel", 1, 1, ["hotel", "alojo", "habitación"], O1),
option(2, "2) Restaurant", 2, 1, ["comer", "servir", "llevar"], O2),
flow(1, "flujo1", [O1], F1),
% flowAddOption(F1, O1, F2),  % debe dar false si se descomenta, ya que es una opción con id duplicado.
flowAddOption(F1, O2, F3),
chatbot(0, "Chatbot Inicial", "Muy buenos días\n¿Qué te gustaría hacer", 1, [F3], CB0),
% opciones primer flujo Chatbot1
option(1, "1) 5 Estrellas", 1, 2, ["Excelente", "Muy buena calificación", "Gran Servicio"], O3),
option(2, "2) 4 Estrellas", 1, 1, ["Bueno", "Buen servicio"], O4),
option(3, "3) 3 Estrellas", 1, 1, ["Mediana calidad", "Medio", "Regular"], O5),
option(4, "4) Volver", 0, 1, ["Salir", "Volver", "Retornar"], O6),
% opciones segundo flujo Chatbot1
option(1, "1) Hotel Marriott", 1, 2, ["Marriott", "Hotel", "Hotel Marriott"], O7),
option(2, "2) Ritz-Carlton", 1, 2, ["Ritz", "Carlton", "Ritz-Carlton"], O8),
option(3, "3) Mandarín Oriental", 1, 3, ["Mandarín", "Oriental", "Mandarín Oriental"], O9),
option(4, "4) Cambiar destino", 1, 1, ["Regresar", "Volver", "Salir", "Retornar"], O10),
% opciones tercer flujo Chatbot1
option(1, "1) Reserva Individual", 1, 3, ["Solo", "Individual"], O11),
option(2, "2) Reserva en pareja", 1, 3, ["Pareja", "Dos Personas", "Dos"], O12),
option(3, "3) Reserva en familia", 1, 3, ["Familia"], O13),
option(4, "4) Agregar más hoteles", 1, 2, ["Volver", "Más Reservas", "Más"], O14),
option(5, "5) En realidad quiero otro hotel", 1, 1, ["Cambiar hotel", "Otro", "Otro hotel"], O15),
flow(1, "Flujo 1 Chatbot1\n¿Qué calidad hotelera desea buscar?", [O3], F4),
flowAddOption(F4, O4, F5),
flowAddOption(F5, O5, F6),
% flowAddOption(F6, O4, F7),  % debe dar false si se descomenta, ya que es una opción con id duplicado.
flowAddOption(F6, O6, F8),
% flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [O7, O8, O9, O9, O10], F9),  % debe dar false si se descomenta, ya que hay una opción con id duplicado.
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [O7, O8, O9, O10], F10),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [O11, O12, O13], F11),
flowAddOption(F11, O14, F12),
flowAddOption(F12, O15, F13),
% chatbot(1, "Agencia de Hoteles",  "Bienvenido\n¿Dónde quieres reservar tu estadía?", 1, [F8, F8, F10, F13], CB1),  % debe dar false si se descomenta, ya que hay un flujo con id duplicado.
chatbot(1, "Agencia de Hoteles",  "Bienvenido\n¿Dónde quieres reservar tu estadía?", 1, [F8, F13], CB1),
chatbotAddFlow(CB1, F10, CB2),
% chatbotAddFlow(CB2, F10, CB3),  % debe dar false si se descomenta, ya que hay un flujo con id duplicado.
%Chatbot2
option(1, "1) Entrada", 2, 1, ["Primer Plato", "Entrada", "Primero"], O16),
option(2, "2) Fondo", 2, 1, ["Segundo Plato", "Fondo", "Principal"], O17),
option(3, "3) Postre", 2, 1, ["Postre", "Dulce"], O18),
option(4, "4) Volver", 0, 1, ["Volver", "Salir", "Regresar"], O19),
flow(1, "Flujo 1 Chatbot2\n¿Qué menú deseas escoger?", [O16, O17, O18, O19], F14),
chatbot(2, "Restaurante",  "Bienvenido\n¿Qué te gustaría comer?", 1, [F14], CB4),
% chatbotAddFlow(CB4, F14, CB5),  % debe dar false si se descomenta, ya que hay un flujo con id duplicado.
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), % si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddChatbot(S0, CB2, S01),
systemAddChatbot(S01, CB4, S02),
systemAddUser(S02, "user0", S2),
systemAddUser(S2, "user1", S3),
% systemAddUser(S3, "user1", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user2", S5),
systemAddUser(S5, "user3", S6),
systemAddUser(S6, "user4", S7),
% systemLogin(S7, "user10", S8), %si esto se descomenta, debe dar false, porque el username no está registrado en la lista de usuarios.
systemLogin(S7, "user1", S9),
% systemLogin(S9, "user0", S10), %si esto se descomenta, debe dar false, porque ya hay un usuario loggeado en el sistema.
systemLogout(S9, S11),
systemLogin(S11, "user2", S12),
systemLogout(S12, S13),
systemLogin(S13, "user0", S14),
systemLogout(S15, S16),
systemLogin(S16, "user1", S17),
% Diálogo 1 
% systemTalkRec(S17, "Hola, ¿Qué me ofreces?", S18), % si se descomenta, daría false por que "Hola, ¿Qué me ofreces?" no es un option o keyword
% systemTalkRec(S118, "1", S19),
% systemTalkRec(S19, "1", S20),
% systemTalkRec(S20, "1", S21),
% systemTalkRec(S21, "1", S22),
% systemTalkRec(S22, "3", S23),
% systemTalkRec(S23, "5", S24),
% systemSynthesis(S24, "user1", Str1),
% systemSimulate(S3, 5, 32131, S50).
% Diálogo 2
% systemTalkRec(S17, "1", S25),
% systemTalkRec(S26, "1", S27),
% systemTalkRec(S27, "Ritz-Carlton", S28),
% systemTalkRec(S29, "1", S30),
% systemTalkRec(S30, "2", S31),
% systemTalkRec(S32, "5", S33),
% systemSynthesis(S33, "user1", Str2),
% systemSimulate(S3, 6, 10543, S51).
% Diálogo 3
% systemTalkRec(S17, "1", S34),
% systemTalkRec(S34, "1", S35),
% systemTalkRec(S35, "Mandarín", S36),
% systemTalkRec(S36, "1", S37),
% systemTalkRec(S37, "2", S38),
% systemTalkRec(S38, "5", S39),
% systemSynthesis(S39, "user1", Str3),
% systemSimulate(S3, 4, 20178, S52).