/*!tests!
 *
 * {
 *    "input":      [],
 *    "output":     ["true"]
 * }
 *
 */

#include "cminus.h"

bool f() {
    if (true) return true ;


    print_string("This won't be printed") ;

    return false ;
}

void main() {
    print_bool(f()) ;
    return ;
}

