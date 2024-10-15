/*!tests!
 *
 * {
 *      "input":    ["5", "1", "6", "3", "8", "4"],
 *      "output":   ["Original list:", "1", "6", "3", "8", "4", "Sorted list:", "1", "3", "4", "6", "8"]
 * }
 *
 */

#include "cminus.h"

/* Pre-condition:  i > 0, xs[0:i-1] is sorted.
 * Post-condition: xs[i] is sorted.
 */
void insert(int xs[], int i) {
    int j = i ;

    while (j > 0 && xs[j-1] > xs[j]) {
        int t = xs[j-1] ;
        xs[j-1] = xs[j] ;
        xs[j] = t ;
        j = j - 1 ;
    }

    return ;

}

/* Pre-condition:  xs has length at least n.
 * Post-condition: xs[0:n] is sorted.
 */
void sort(int xs[], int n) {
    int i = 1 ;

    while (i < n) {
        insert(xs, i) ;
        i = i + 1 ;
    }

    return ;
}

void main() {
    int n ;

    n = prompt_int("Enter array size: ") ;

    int xs[n] ;

    int i = 0 ;
    while (i < n) {
        xs[i] = prompt_int("Enter a number: ") ;
        i = i + 1 ;
    }

    print_string("Original list:") ;
    i = 0 ;
    while (i < n) {
        print_int(xs[i]) ;
        i = i + 1 ;
    }

    sort(xs, n) ;

    print_string("Sorted list:") ;
    i = 0 ;
    while (i < n) {
        print_int(xs[i]) ;
        i = i + 1 ;
    }

    return ;

}
