/*!tests!
 *
 * {
 *      "input":    ["-10", "true", "3"],
 *      "output":   ["-10", "true", "3"]
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

