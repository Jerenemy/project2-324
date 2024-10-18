/*!tests!
 *
 * {
 *      "input":    ["true"],
 *      "output":   ["2", "4"]
 * }
 *
 * {
 *      "input":    ["false"],
 *      "output":   ["1", "3"]
 * }
 *
 */

#include "cminus.h"

void main() {
    bool b = get_bool() ;

    if (b) print_int(2) ;
    else print_int(1) ;

    if (b) print_int(4) ;
    else print_int(3) ;

    return ;
}

