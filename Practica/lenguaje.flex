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
	public String class_name;

	public String func_name;

	public int num_bools;
	public int num_ints;

	public int num_fors;
	public int num_whiles;
%}

%init{
	class_name = "";
	func_name = "";
	num_bools = 0;
	num_ints = 0;
	num_fors = 0;
	num_whiles = 0;
%init}

%eof{
	System.out.println("class name =\t'" + class_name + "'");
	System.out.println("func name =\t'" + func_name + "'");
	System.out.println("bools count =\t'" + num_bools + "'");
	System.out.println("ints count =\t'" + num_ints + "'");
	System.out.println("fors count =\t'" + num_fors + "'");
	System.out.println("whiles count =\t'" + num_whiles + "'");
%eof}

%state CLASS
%state FUNC
%state LOOP
%state WLOOP

%%
/* ------------------------ Seccion de reglas lexicas ---------------------- */

/*
NOS SIRVE PARA ALGO?
";" { return new Symbol(sym.PUNTOYCOMA); }
"+" { return new Symbol(sym.MAS); }
"*" { return new Symbol(sym.POR); }
"(" { return new Symbol(sym.PAREN_I); }
")" { return new Symbol(sym.PAREN_D); }
[0-9]+ { return new Symbol(sym.NUMERO, new Integer(yytext())); }
*/

<YYINITIAL> public\ class\ [^\n\r{ ]+ { yybegin(CLASS); class_name = yytext().substring(13); }

<CLASS> {
	public\ static\ [^\n\r{ ]+ { yybegin(FUNC); func_name = yytext(); }
	"}" { yybegin(YYINITIAL); }
}

<FUNC> {
	for[^{]+ { num_fors++; yybegin(LOOP); }
	while[^{]+ { num_whiles++; yybegin(WLOOP); }
	"}" { yybegin(CLASS); }
}

<LOOP> {
	"}" { yybegin(FUNC); }
}

<WLOOP> {
	"}" { yybegin(FUNC); }
}

[ \t\r\n\f] { /* ignora delimitadores */ }

. {
	//System.err.println("Caracter Ilegal: " + yytext());
}
