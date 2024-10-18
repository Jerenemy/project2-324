/*!tests!
 *
 * {
 *  "input":    [],
 *  "output":   ["2", "4", "6", "2", "24", "6",  "2", "24", "6", "12", "14", "16"]
 * }
 *
 */

#include "cminus.h"

void print_assigned() {


    /* new frame created: new env block
    any params immediately set in frame. any additional blocks inside have regular env block semantics 
    but cannot access vars from the previous env block that the function was called in */
    int x[3] ;
    
    x[0] = 2 ;
    x[1] = 4 ;
    x[2] = 6 ;

    print_int(x[0]) ;
    print_int(x[1]) ;
    print_int(x[2]) ;

    {
        /* is the semantics for function def blocks and blocks within funcs the same? NO THEY ARE NOT. confusing q wording */
        x[1] = 24 ;
        x[2] = 26 ;
        print_int(x[0]) ;
        print_int(x[1]) ;
        print_int(x[2]) ;
    }

    print_int(x[0]) ;
    print_int(x[1]) ;
    print_int(x[2]) ;
    return ;
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
