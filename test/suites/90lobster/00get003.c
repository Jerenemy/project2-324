/*!tests!
 *
 * {
 *      "input":    ["42", "true", "C-minus"],
 *      "output":   ["42", "true", "C-minus"]
 * }
 *
 * {
 *      "input":    ["-42", "false", "final"],
 *      "output":   ["-42", "false", "final"]
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

