/*!tests!
 *
 * {
 *      "input":    [],
 *      "output":   ["2", "1"]
 * }
 */

#include "cminus.h"

void main() {
    int x = 1 ;

    {
        int x = 2 ;
        print_int(x) ;
    }

    print_int(x) ;

    return ;
}

