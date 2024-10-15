/*!tests!
 *
 * {
 *      "input":    ["5", "true", "hello"],
 *      "output":   ["5", "true", "hello"]
 * }
 *
 * {
 *      "input":    ["-7", "false", "fred"],
 *      "output":   ["-7", "false", "fred"]
 * }
 *
 */

#include "cminus.h"

void main() {
    int x ;
    bool b ;
    char* s ;

    x = prompt_int("Enter an int: ") ;
    b = prompt_bool("Enter a bool: ") ;
    s = prompt_string("Enter a string: ") ;

    print_int(x) ;
    print_bool(b) ;
    print_string(s) ;

    return ;
}
