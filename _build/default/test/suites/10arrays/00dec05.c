/*!tests!
 *
 * {
 *  "input":    [],
 *  "exception":  "MultipleDeclaration"
 * }
 *
 */

#include "cminus.h"

int assign_arr(int x) {
    int xs = 2 ;
    int xs[x] ;
    /* should give a VarAlreadyAssignedError */
    return x ; /* this test DEFINITELY fails. not allowed since assignment to var already in env */
}


void main() {
    int x = assign_arr(1) ;

    return ;
}
