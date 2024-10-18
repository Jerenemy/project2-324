/*!tests!
 *
 * {
 *    "input":      [],
 *    "output":     ["0", "1", "2", "3"]
 * }
 *
 */

#include "cminus.h"

void main() {
    int x = 0 ;

    while (x < 4) {
        print_int(x) ;
        x = x + 1 ;

    }
    return ;
}

