/*!tests!
 *
 * {
 *    "input":      [],
 *    "exception":  "UnboundVariable"
 * }
 *
 */

#include "cminus.h"

void main() {
    {
        print_int(x) ;
    }

    int x = 10 ;
    return ;
}

