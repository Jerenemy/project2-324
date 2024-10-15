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
    int x[x] ;
    return x ; /* this test probably fails. not allowed since assignment to var already in env? */
}


void main() {
    int x = assign_arr(1) ;

    return ;
}
