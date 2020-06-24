%{
    #include "sintacticoExercise3.tab.h"
%}

%%
bb         {return (bb);}
\n         {return (EOL);}
.          {return yytext[0];}
%%

int yywrap(){
    return 0;
}

