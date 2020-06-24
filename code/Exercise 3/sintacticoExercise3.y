%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    int yyerror(char* s);
%}
%token bb
%token EOL
%%

c: bb EOL        {printf("Se reconocio la cadena bb\n");
                    exit(0); }
;

%%

int yyerror(char* s){
    printf(" Error sintactico: %s \n",s);
    exit(0);
}

void main(){
    printf("Ingrese una cadena: \n");
    yyparse();
    yylex();
}