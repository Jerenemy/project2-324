/*!tests!
 *
 * {
 *      "input":    [],
 *      "output":   ["1", "4"]
 * }
 */

#include "cminus.h"

void main() {
    int x = 1 ;

    while (x == 1) {
        print_int(1) ;
        x = 0 ;
    }

    print_int(4) ;

    return ;
}

