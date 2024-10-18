/*!tests!
 *
 * {
 *    "input":      [],
 *    "output":  ["5"]
 * }
 *
 */

#include "cminus.h"

int f() {
    int x = 5 ;

    return x ;
}

void main() {
    int y = f() ;
    print_int(y) ;

    return ;
}

