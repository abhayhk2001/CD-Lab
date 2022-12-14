%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<unistd.h>
    #include<string.h>
    void yyerror(char *s);
    int yylex();
    char AddToTable(char,char,char);
    char table[100][4];
	int currIndex=0;
    char temp = 'A';
%}

%token NUMBER LETTER
%left '+' '-'
%right '*' '/'

%%
statement: LETTER '=' expr {AddToTable((char)$1,(char)$3,'=');}
         | expr
         ;
expr: expr '+' expr {$$ = AddToTable((char)$1,(char)$3,'+');}
		| expr '-' expr {$$ = AddToTable((char)$1,(char)$3,'-');}
		| expr '*' expr {$$ = AddToTable((char)$1,(char)$3,'*');}
		| expr '/' expr {$$ = AddToTable((char)$1,(char)$3,'/');}
		| '(' expr ')' {$$ = (char)$2;}
		| NUMBER {$$ = $1;}
		| LETTER {$$ = (char)$1;}
		;

%%

void yyerror(char *s)
{
    printf("ERROR: %s",s);
    exit(0);
}

char AddToTable(char od1, char od2, char op)
{
	temp++;

	table[currIndex][0] = od1;
	table[currIndex][1] = od2;
	table[currIndex][2] = op;
	table[currIndex][3] = temp;

	currIndex++;
	return temp;
}

void printTAC()
{
	printf("\nTABLE:\n");
	for(int i=0; i<currIndex; i++)
	{
		printf("%c =  %c \t %c \t %c\n", table[i][3], table[i][0], table[i][2], table[i][1]);
	}
	printf("#####\n");
}

void main()
{
	printf("\nEnter expression: ");
	yyparse();
	printf("\nVALID\n");
	printTAC();
}
