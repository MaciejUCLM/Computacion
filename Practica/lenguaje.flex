/* --------------------------Seccion codigo-usuario ------------------------ */
import java_cup.runtime.Symbol;

%%
/* ----------------- Seccion de opciones y declaraciones  ----------------- */

/* %class lenguaje */
%cup
%type java_cup.runtime.Symbol
%standalone
%unicode

%{
%}

%init{
%init}

%eof{
%eof}

%%
/* ------------------------ Seccion de reglas lexicas ---------------------- */

";" { return new Symbol(sym.SEMICOLON); }
"+" { return new Symbol(sym.PLUS); }
"-" { return new Symbol(sym.MINUS); }
"*" { return new Symbol(sym.MUL); }
"/" { return new Symbol(sym.DIV); }
"(" { return new Symbol(sym.PAREN_L); }
")" { return new Symbol(sym.PAREN_R); }

[0-9]+ { return new Symbol(sym.NUMBER, new Integer(yytext())); }

[ \t\r\n\f] { /* ignore */ }

. { /* System.err.println("Caracter Ilegal: " + yytext()); */ }
