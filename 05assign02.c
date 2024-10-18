/*!tests!
 *
 * {
 *  "input":    [],
 *  "output":   ["2", "4", "6", "12", "4", "6", "22", "24", "6", "12", "4", "6"]
 * }
 *
 */

#include "cminus.h"



void main() {
    int x[3] ;

    x[0] = 2 ;
    x[1] = 4 ;
    x[2] = 6 ;

    {
        x[0] = 12;
        print_int(x[0]) ;
        print_int(x[1]) ;
        print_int(x[2]) ;
        int x[3] ;
        x[0] = 22 ;
        x[1] = 24 ;
        print_int(x[0]) ;
        print_int(x[1]) ;
        print_int(x[2]) ; /* this here might fail, not sure if x[2] is in scope */

    }

    print_int(x[0]) ;
    print_int(x[1]) ;
    print_int(x[2]) ;

    return ;
}
