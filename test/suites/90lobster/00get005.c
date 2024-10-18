/*!tests!
 *
 * {
 *    "input":    ["3", "true", "5"],
 *    "output":   ["3", "true", "5"]
 * }
 *
 */

#include "cminus.h"

void main() {
    char* s = get_string() ;
    bool b = get_bool() ;
    int x = get_int() ;

    print_string(s) ;
    print_bool(b) ;
    print_int(x) ;

    return;
}

