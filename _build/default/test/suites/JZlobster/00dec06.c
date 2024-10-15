/*!tests!
 *
 * {
 *  "input":    [],
 *  "output":   []
 * }
 *
 */

#include "cminus.h"

int assign_arr(int x) {
    int xs[x] ;
    xs[0] = 2 ;
    return xs ; /* what type does this return? special pointer type or int? */
}


void main() {
    int xs[5] ;
    xs[4] = 4 ;
    int x = assign_arr(1) ;
    xs[3] = 3 ;
    return ;
}
