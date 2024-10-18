/*!tests!
 *
 * {
 *    "input":      ["true"],
 *    "exception":  "MultipleDeclaration"
 * }
 *
 */

#include "cminus.h"

void main() {
    bool b = get_bool() ;
    int x = 0 ;

    if (b) {
        int x = 2 ;
    }

    int x = 2 ;
    print_int(x) ;
}

