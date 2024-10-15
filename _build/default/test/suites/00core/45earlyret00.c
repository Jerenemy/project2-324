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

    return false ;
}

void main() {
    print_bool(f()) ;

    return ;
}
