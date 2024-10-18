/*!tests!
 *
 * {
 *    "input":      [],
 *    "exception":  "TypeError"
 * }
 *
 */

#include "cminus.h"

void main() {
    bool b = true ;
    int x = 5 * b ;
    print_int(x) ;
    return ;
}

