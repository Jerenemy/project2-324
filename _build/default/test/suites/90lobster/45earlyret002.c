/*!tests!
 *
 * {
 *    "input":      [],
 *    "output":     ["false"]
 * }
 *
 */

#include "cminus.h"

bool f() {
    if (true) {
        if (false) {
            return true ;
        }
        return false ;
    }

    return true ;
}

void main() {
    print_bool(f()) ;
    return ;
}

