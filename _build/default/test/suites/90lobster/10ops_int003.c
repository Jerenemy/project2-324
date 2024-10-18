/*!tests!
 *
 * {
 *      "input":    [],
 *      "output":   ["-15", "-15", "-50", "-2", "0"]
 *
 * }
 */

#include "cminus.h"

void main() {
    print_int(-10 + -5) ;
    print_int(-10 - 5) ;
    print_int(-10 * 5) ;
    print_int(-10 / 5) ;
    print_int(-10 % 5) ;
    return ;
}

