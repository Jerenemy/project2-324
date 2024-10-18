/*!tests!
 *
 * {
 *      "input":    ["67", "false", "cheese"],
 *      "output":   ["67", "false", "cheese"]
 * }
 *
 * {
 *      "input":    ["-67", "true", "sponge"],
 *      "output":   ["-67", "true", "sponge"]
 * }
 *
 */

#include "cminus.h"

void main() {
    int x ;
    bool b ;
    char* s ;

    x = get_int() ;
    b = get_bool() ;
    s = get_string() ;

    print_int(x) ;
    print_bool(b) ;
    print_string(s) ;

    return ;
}

