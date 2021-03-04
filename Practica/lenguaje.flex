/* --------------------------Seccion codigo-usuario ------------------------ */
import java_cup.runtime.Symbol;

%%
/* ----------------- Seccion de opciones y declaraciones  ----------------- */

%cup
/*%class lenguaje*/
%type java_cup.runtime.Symbol
%standalone
%8bit

%{
  public int cont;
%}

%init{
	cont = 0;
%init}

%eof{
	System.out.println("Naturales = "+cont);
%eof}

%%
/* ------------------------ Seccion de reglas lexicas ---------------------- */

/*
";" { return new Symbol(sym.PUNTOYCOMA); }
"+" { return new Symbol(sym.MAS); }
"*" { return new Symbol(sym.POR); }
"(" { return new Symbol(sym.PAREN_I); }
")" { return new Symbol(sym.PAREN_D); }
[0-9]+ { return new Symbol(sym.NUMERO, new Integer(yytext())); }
*/
[ \t\r\n\f] { /* ignora delimitadores */ }


. { System.err.println("Caracter Ilegal: "+yytext()); }
