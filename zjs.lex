%{
	#include <stdio.h>
	int lines = 1;
%}

%%
done		{ printf("END %s\n", yytext); }
;		{ printf("END_STATEMENT %s\n", yytext); }
plot_point	{ printf("POINT %s\n", yytext); }
draw_line	{ printf("LINE %s\n", yytext); }
draw_circle	{ printf("CIRCLE %s\n", yytext); }
draw_rect	{ printf("RECTANGLE %s\n", yytext); }
set_color	{ printf("SET_COLOR %s\n", yytext); }
[0-9]+		{ printf("INT %s\n", yytext); }
[0-9]+\.[0-9]+ 	{ printf("FLOAT %s\n", yytext); }
[' '|\t]	;
\n		{ ++lines; }
. { printf("NOT A TOKEN ON LINE %d: %s\n", lines, yytext); }
%%
int main(int argc, char** argv) {
	yylex();
	return 0;
}
