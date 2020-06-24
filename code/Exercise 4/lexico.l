%{
    #include "sintactico.tab.h"
%}
number [0-9]+
word [a-zA-Z]+
space [ \t]
%%
int              {return (INT);}
{word}           {return (WORD);}
-?{number}       {return (NUMBER);}
;                {return (SYMBOL1);}
=                {return (SYMBOL2);}
{space}+         {return (SPACE);}  
\n               {return (EOL);}
.                {return yytext[0];}
%%

int yywrap(){
    return 0;
}

