/*!tests!
 *
 * {
 *      "input":    ["10", "false", "testing"],
 *      "output":   ["10", "false", "testing"]
 * }
 *
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
