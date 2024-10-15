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

    x = get_int() ;
    b = get_bool() ;
    s = get_string() ;

    print_int(x) ;
    print_bool(b) ;
    print_string(s) ;

    return ;
}

