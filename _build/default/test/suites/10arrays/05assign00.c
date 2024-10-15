/*!tests!
 *
 * {
 *  "input":    [],
 *  "output":   ["12", "14", "16"]
 * }
 *
 */

#include "cminus.h"


void main() {
    int x[3] ;

    x[0] = 12 ;
    x[1] = 14 ;
    x[2] = 16 ;

    print_int(x[0]) ;
    print_int(x[1]) ;
    print_int(x[2]) ;

    return ;
}
