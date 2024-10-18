/*!tests!
 *
 * {
 *  "input":    [],
 *  "output":   [1]
 * }
 *
 */

#include "cminus.h"

int assign_arr(int x) {
    /*int xs[x] ;*/
    print_int(x) ;
    return x ; 
}


void main() {
    int x = assign_arr(1) ;
    
    print_int(x) ;

    return ;
}
