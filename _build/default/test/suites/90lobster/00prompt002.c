/*!tests!
 *
 * {
 *      "input":    ["0", "true", "test2"],
 *      "output":   ["0", "true", "test2"]
 * }
 */

#include "cminus.h"

void main() {
    int x = prompt_int("Enter an int: ") ;
    bool b = prompt_bool("Enter a bool: ") ;
    char* s = prompt_string("Enter a string: ") ;

    print_int(x) ;
    print_bool(b) ;
    print_string(s) ;

    return ;
}

