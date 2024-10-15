/* I/O functions for C-.
 *
 * N. Danner
 */

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cminus.h"

#define INPUT_LEN 100

void print_int(int x) {
    printf("%d\n", x) ;
    return ;
}

void print_bool(bool b) {
    printf("%s\n", b ? "true" : "false") ;
    return ;
}

void print_string(char* s) {
    printf("%s\n", s) ;
    return ;
}

int get_int(void) {
    int x ;
    scanf("%d", &x) ;
    return x ;
}

bool get_bool(void) {
    char s[INPUT_LEN] ;
    bool b ;
    scanf("%s", s) ;

    if (strncmp(s, "true", 4) == 0) b = true ;
    else if (strncmp(s, "false", 5) == 0) b = false ;

    return b ;
}

char* get_string(void) {
    char* s = malloc(INPUT_LEN*sizeof(char)) ;
    scanf("%s", s) ;
    return s ;
}

int prompt_int(char* s) {
    int x ;
    printf("%s", s) ;
    scanf("%d", &x) ;

    return x ;
}

bool prompt_bool(char* p) {
    bool b ;
    char s[INPUT_LEN] ;

    printf("%s", p) ;
    scanf("%s", s) ;

    if (strncmp(s, "true", 4) == 0) b = true ;
    else if (strncmp(s, "false", 5) == 0) b = false ;

    return b ;
}

char* prompt_string(char* p) {
    char* s = malloc(INPUT_LEN*sizeof(char)) ;
    printf("%s", p) ;
    scanf("%s", s) ;

    return s ;
}

