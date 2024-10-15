/*!tests!
 *
 * {
 *      "input":    [],
 *      "output":   [
 *          "5",
 *          "true",
 *          "false",
 *          "Hello, world!"
 *      ]
 * }
 */

#include "cminus.h"

void main() {
    print_int(5) ;
    print_bool(true) ;
    print_bool(false) ;
    print_string("Hello, world!") ;

    return ;

}
