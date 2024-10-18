/*!tests!
 *
 * {
 *  "input":    [],
 *  "output":   ["2", "4", "6", "12", "14", "16"]
 * }
 *
 */

#include "cminus.h"

void print_assigned() {
    int x[3] ;

    x[0] = 2 ;
    x[1] = 4 ;
    x[2] = 6 ;

    print_int(x[0]) ;
    print_int(x[1]) ;
    print_int(x[2]) ;
}

void main() {
    int x[3] ;

    x[0] = 12 ;
    x[1] = 14 ;
    x[2] = 16 ;

    print_assigned() ;

    print_int(x[0]) ;
    print_int(x[1]) ;
    print_int(x[2]) ;

    return ;
}
