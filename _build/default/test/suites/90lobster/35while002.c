/*!tests!
 *
 * {
 *      "input":    [],
 *      "output":   ["100", "200"]
 * }
 */

#include "cminus.h"

void main() {
    int x = 100 ;

    while (x == 100) {
        print_int(100) ;
        x = 0 ;
    }

    print_int(200) ;

    return ;
}

