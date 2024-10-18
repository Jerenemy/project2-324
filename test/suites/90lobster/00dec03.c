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
    return xs ; /* what type does this return? special pointer type or int? */
}


void main() {
    int x = assign_arr(1) ;

    return ;
}
