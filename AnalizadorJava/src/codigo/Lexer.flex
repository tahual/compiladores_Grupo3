/* ===== ENCABEZADO ===== */
package codigo;
import static codigo.Tokens.*;

/* ===== SECCIÓN DE OPCIONES Y VARIABLES ===== */
%%
%class Lexer
%type Tokens

%{
    public String lexeme;
%}

/* ===== DEFINICIONES DE EXPRESIONES REGULARES ===== */
Letras   = [a-zA-Z_]
Digitos  = [0-9]
Ident    = {Letras}({Letras}|{Digitos})*
Numero   = "-"?{Digitos}+
espacio  = [ \t\r\n]+
cadena   = \"([^\"\\]|\\.)*\"     // cadenas de texto
Decimales = "-"?(({Digitos}+"."{Digitos}*)|("."{Digitos}+))
raiz = "raiz""-"?(({Digitos}+"."{Digitos}*)|("."{Digitos}+))


/* ===== REGLAS LÉXICAS ===== */
%%
/* Palabras reservadas (incluyendo ciclos) */
("entero" | "si" | "contrario" | "mientras" | "retornar" | "booleano" | "para" | "hacer" | "repetir" | "hasta"|"excepciones") 
    { lexeme = yytext(); return Reservadas; }

("true" | "false")                     
    { lexeme = yytext(); return Booleano; }

("try" | "catch"| "trows"| "finally")                     
    { lexeme = yytext(); return excepciones; }


/* Comentarios y espacios */
{espacio}                               { /* ignorar espacios */ }
"//".*                                  { /* ignorar comentarios de línea */ }
"/*"([^*]|\*+[^*/])*\*+"/"              { /* ignorar comentarios multilínea */ }

/* Palabra clave para bloque (opcional) */
"INICIO"                                { /* ignorar palabra clave INICIO */ }

/* Operadores aritméticos */
"+"                                     { lexeme = yytext(); return opSuma; }
"-"                                     { lexeme = yytext(); return opResta; }
"*"                                     { lexeme = yytext(); return opMultiplicacion; }
"/"                                     { lexeme = yytext(); return opDivision; }
"="                                     { lexeme = yytext(); return opIgual; }

/* Operadores lógicos y relacionales */
"=="                                    { lexeme = yytext(); return opIgualIgual; }
"!="                                    { lexeme = yytext(); return opDiferente; }
"<"                                     { lexeme = yytext(); return opMenor; }
">"                                     { lexeme = yytext(); return opMayor; }
"<="                                    { lexeme = yytext(); return opMenorIgual; }
">="                                    { lexeme = yytext(); return opMayorIgual; }
"&&"                                    { lexeme = yytext(); return opAND; }
"||"                                    { lexeme = yytext(); return opOR; }

/* Símbolos y separadores */
"("                                     { lexeme = yytext(); return ParentesisApertura; }
")"                                     { lexeme = yytext(); return ParentesisCierre; }
"{"                                     { lexeme = yytext(); return LlaveApertura; }
"}"                                     { lexeme = yytext(); return LlaveCierre; }
";"                                     { lexeme = yytext(); return PuntoComa; }
","                                     { lexeme = yytext(); return Coma; }
"@"                                     { lexeme = yytext(); return Arroba; }

/* Identificadores, números y cadenas */
{Ident}                                 { lexeme = yytext(); return Identificador; }
{Numero}                                { lexeme = yytext(); return Numero; }
{cadena}                                { lexeme = yytext(); return Cadena; }
{Decimales}                             { lexeme = yytext(); return Decimales; }
{raiz}                                  { lexeme = yytext(); return raiz; }

/* Error por cualquier otro carácter */
.                                       { lexeme = yytext(); return ERROR; }
