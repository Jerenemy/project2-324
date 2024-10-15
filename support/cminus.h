/* I/O macros for C-.
 *
 * N. Danner
 */

#include <stdbool.h>
#include <stdio.h>

void print_int(int) ;

void print_bool(bool) ;

void print_string(char*) ;

int get_int(void) ;

bool get_bool(void) ;

char* get_string(void) ;

int prompt_int(char* s) ;

bool prompt_bool(char* s) ;

char* prompt_string(char* s) ;

