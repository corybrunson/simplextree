#include <Rcpp.h>
using namespace Rcpp;

#include "utility/discrete.h"

// 0-based conversion of natural number to (n choose k) combinadic
// [[Rcpp::export]]
IntegerMatrix to_subscript_R(IntegerVector numbers, const size_t n, const size_t k){
	IntegerMatrix sub = Rcpp::no_init_matrix(k, numbers.size());
  size_t i = 0;
  to_subscript(numbers.begin(), numbers.end(), n, k, [&](auto& cc){
	  IntegerVector rr(cc.begin(), cc.end());
	  sub.column(i++) = rr;
  });
	return(sub);
}

// 0-based conversion of (n choose k) combinadic subscripts to natural numbers. Expects column-matrix
// [[Rcpp::export]]
IntegerVector to_natural_R(IntegerMatrix m, const size_t n){
  const size_t k = m.nrow();
  IntegerVector result = Rcpp::no_init_vector(m.ncol());
  size_t i = 0;
  to_natural(m.begin(), m.end(), k, n, [&i, &result](size_t cc){
    result[i++] = cc;
  });
  return(result);
}


/*** R
# simplextree::nat_to_sub(seq(choose(10,2)), n = 10, k = 2)
# simplextree:::to_subscript(seq(choose(10,2))-1L, 10, 2)
# simplextree:::to_natural(combn(10,2), 10)

# microbenchmark::microbenchmark({ combn(100,3) }, times = 100)
# 
# microbenchmark::microbenchmark({ 
#   simplextree::nat_to_sub(x, n = 100, k = 3)
# }, times = 10, setup = { x <- seq(choose(100,3)) })
# 
# all(t(simplextree:::to_subscript(seq(choose(10,3))-1L, 10, 3)+1L) == combn(10,3))
*/
