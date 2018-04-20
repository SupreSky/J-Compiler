@Echo Off 
Set input= 
:Begin 
Set /P input="Please give me a command." 
If /I "%input%"=="1" Echo "1 - j_parse.c" && Goto ONE 
If /I "%input%"=="2" Echo "2 - j_parse.o" && Goto TWO
If /I "%input%"=="3" Echo "3 - j_lex.c" && Goto THREE
If /I "%input%"=="4" Echo "4 - j_lex.o" && Goto FOUR
If /I "%input%"=="5" Echo "5 - main.o" && Goto FIVE
If /I "%input%"=="6" Echo "6 - jparse" && Goto SIX

Echo 不正確的輸入，請重來一次。 
Echo . 
Goto Begin 

:ONE

if exist j_parse.y (

bison -d -o j_parse.c j_parse.y
bison -d -o j_parse.c j_parse.y
pause

Echo Step ONE Finished.

)else (
Echo ONE ERROR!!
)
Goto Begin

:TWO
if exist j_parse.c && exist j_lex.h && exist j_parse.h (

gcc -c -o j_parse.o j_parse.c

Echo Step TWO Finished.
)else (
Echo TWO ERROR!!
)
Goto Begin

:THREE
if exist j_lex.l (

flex -oj_lex.c j_lex.l

Echo Step THREE Finished.
)else (
Echo THREE ERROR!!
)
Goto Begin

:FOUR
if exist j_lex.c && exist j_lex.h && exist j_parse.h (

gcc -c -o j_lex.o j_lex.c

Echo Step FOUR Finished.
)else (
Echo FOUR ERROR!!
)
Goto Begin

:FIVE
if exist main.c && exist j_lex.h && exist j_parse.h (

gcc -c -o main.o main.c

Echo Step FIVE Finished.
)else (
Echo FIVE ERROR!!
)
Goto Begin

:SIX
if exist main.0 && exist j_lex.o && exist j_parse.o (

gcc -o jparse main.o j_parse.o j_lex.o

Echo Step SIX Finished.
)else (
Echo SIX ERROR!!
)
Goto Begin


:End 
Echo Owari