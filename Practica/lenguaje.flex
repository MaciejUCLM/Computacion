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
"," { return new Symbol(sym.COMMA); }
"=" { return new Symbol(sym.ASSIGN); }
"+" { return new Symbol(sym.PLUS); }
"-" { return new Symbol(sym.MINUS); }
"*" { return new Symbol(sym.MUL); }
"/" { return new Symbol(sym.DIV); }

">" { return new Symbol(sym.GREATER); }
">=" { return new Symbol(sym.G_EQUAL); }
"<" { return new Symbol(sym.LESS); }
"<=" { return new Symbol(sym.L_EQUAL); }
"==" { return new Symbol(sym.EQUAL); }
"!=" { return new Symbol(sym.NOT_EQUAL); }

"&&" { return new Symbol(sym.AND); }
"||" { return new Symbol(sym.OR); }
"!" { return new Symbol(sym.NOT); }

"(" { return new Symbol(sym.PAREN_L); }
")" { return new Symbol(sym.PAREN_R); }
"{" { return new Symbol(sym.BRAC_L); }
"}" { return new Symbol(sym.BRAC_R); }

/* types */
"void" { return new Symbol(sym.T_VOID); }
"boolean" { return new Symbol(sym.T_BOOL); }
"int" { return new Symbol(sym.T_INT); }

/* functional */
"return" { return new Symbol(sym.RETURN); }
"while" { return new Symbol(sym.WHILE); }
"for" { return new Symbol(sym.FOR); }
"class" { return new Symbol(sym.CLASS); }
"static" { return new Symbol(sym.STATIC); }
"public" { return new Symbol(sym.PUBLIC); }

"true" { return new Symbol(sym.FLAG, true); }
"false" { return new Symbol(sym.FLAG, false); }

[a-zA-Z_][0-9a-zA-Z_]* { return new Symbol(sym.IDENT, yytext()); }

/* composite */
[0-9]+ { return new Symbol(sym.NUMBER, new Integer(yytext())); }

[ \t\r\n\f] { /* ignore */ }

. { /* System.err.println("Caracter Ilegal: " + yytext()); */ }
