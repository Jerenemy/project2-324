/*!tests!
 *
 * {
 *      "input":    [],
 *      "output":   ["1", "false", "true", "Test string"]
 * }
 */

#include "cminus.h"

void main() {
    print_int(1) ;
    print_bool(false) ;
    print_bool(true) ;
    print_string("Test string") ;

    return ;
}

