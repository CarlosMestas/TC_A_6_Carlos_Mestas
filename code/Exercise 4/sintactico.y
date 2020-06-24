%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    int yyerror(char* s);
%}
%token INT 
%token WORD
%token NUMBER
%token SYMBOL1
%token SYMBOL2
%token SPACE
%token EOL
%%

s:  INT SPACE WORD d EOL        {printf("Se reconocio el ingreso de variable entera\n");
                                    exit(0); }
;
d:  e | f 
;
e:  SYMBOL1 EOL WORD SPACE SYMBOL2 SPACE NUMBER SYMBOL1 | SYMBOL1 EOL WORD SYMBOL2 NUMBER SYMBOL1 | SYMBOL1 EOL WORD SYMBOL2 SPACE NUMBER SYMBOL1 | SYMBOL1 EOL WORD SPACE SYMBOL2 NUMBER SYMBOL1  
;
f:  SPACE SYMBOL2 SPACE NUMBER SYMBOL1 | SYMBOL2 SPACE NUMBER SYMBOL1 | SPACE SYMBOL2 NUMBER SYMBOL1 | SYMBOL2 NUMBER SYMBOL1
;
%%

int yyerror(char* s){
    printf(" Error sintactico: %s \n",s);
    exit(0);
}

void main(){
    printf("Ingrese una asignacion de variable para el lenguaje C: \n");
    yyparse();
    yylex();
}