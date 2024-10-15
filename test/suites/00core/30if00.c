/*!tests!
 *
 * {
 *      "input":    ["true"],
 *      "output":   ["0", "2"]
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

    if (b) print_string("0") ;
    else print_string("1") ;

    if (b) print_string("2") ;

    if (!b) print_string("3") ;

    return ;
}
