/*!tests!
 *
 * {
 *    "input":      [],
 *    "exception":  "TypeError"
 * }
 *
 */

#include "cminus.h"

void main() {
    char* s = "hello" ;
    int x = 10 ;

    print_string(s + x) ;
    return ;
}

