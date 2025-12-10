CC := gcc
CFLAGS := -Wall -Wextra -Werror -std=c99
TESTCASE_NUM := 4
build:rizc201
	${CC} ${CFLAGS} -g src/ex12q1.c bin/rizc201.o -o bin/ex12q1 

rizc201:
	${CC} ${CFLAGS} src/rizc201.c -c -o bin/rizc201.o


test: build
	bin/ex12q1 Testcases/1-1-input.txt Testcases/1-1-instructions.txt Testcases/1-1-student.txt
# debug: build
# 	gdb --args ./bin/ex12q1 Testcases/1-5-input.txt Testcases/1-5-instructions.txt Testcases/1-5-student.txt

print:
	${CC} ${CFLAGS} src/ex12q1.c bin/rizc201.o -o bin/ex12q1 -DDEBUG
	bin/ex12q1 Testcases/1-${TESTCASE_NUM}-input.txt Testcases/1-${TESTCASE_NUM}-instructions.txt Testcases/1-${TESTCASE_NUM}-student.txt > Testcases/1-${TESTCASE_NUM}-stdout-student.txt
	diff -s Testcases/1-${TESTCASE_NUM}-student.txt Testcases/1-${TESTCASE_NUM}-output.txt
	diff -s Testcases/1-${TESTCASE_NUM}-stdout-student.txt Testcases/1-${TESTCASE_NUM}-stdout.txt


memcheck: build
	valgrind --leak-check=full ./bin/ex12q1 Testcases/1-4-input.txt Testcases/1-4-instructions.txt Testcases/1-4-student.txt 
clean:
	rm -f bin/ex12q1