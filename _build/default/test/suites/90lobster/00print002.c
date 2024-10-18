/*!tests!
 *
 * {
 *      "input":    [],
 *      "output":   ["-1", "true", "false", "Hello"]
 * }
 */

#include "cminus.h"

void main() {
    print_int(-1) ;
    print_bool(true) ;
    print_bool(false) ;
    print_string("Hello") ;

    return ;
}

