#include <iostream>
#include <vector>
#include <random>
#include <algorithm>
#include <numeric>
#include <x86intrin.h>
#include <chrono>

#if 1
#define NO_VECTOR
#else
#define NO_VECTOR _Pragma("novector")
#endif

__attribute__((noinline))
void copy_ref(double* __restrict c,
              const double* __restrict a,
              const size_t len) {
NO_VECTOR
  for (size_t i = 0; i < len; i++) {
    c[i] = a[i];
  }
}

__attribute__((noinline))
void scale_ref(double* __restrict b,
               const double* __restrict c,
               const double scalar,
               const size_t len) {
NO_VECTOR
  for (size_t i = 0; i < len; i++) {
    b[i] = scalar * c[i];
  }
}

__attribute__((noinline))
void add_ref(const double* __restrict a,
             const double* __restrict b,
             double* __restrict c,
             const size_t len) {
NO_VECTOR
  for (size_t i = 0; i < len; i++) {
    c[i] = a[i] + b[i];
  }
}

__attribute__((noinline))
void triadd_ref(double* __restrict a,
                const double* __restrict b,
                const double* __restrict c,
                const double scalar,
                const size_t len) {
NO_VECTOR
  for (size_t i = 0; i < len; i++) {
    a[i] = b[i] + scalar * c[i];
  }
}

__attribute__((noinline))
void copy_avx2(double* __restrict c,
               const double* __restrict a,
               const size_t len) {
  for (size_t i = 0; i < (len/4)*4; i += 4) {
    const auto tmp = _mm256_loadu_pd(a + i);
    _mm256_storeu_pd(c + i, tmp);
  }
  for (size_t i = (len/4)*4; i < len; i++) {
    c[i] = a[i];
  }
}

__attribute__((noinline))
void scale_avx2(double* __restrict b,
                const double* __restrict c,
                const double scalar,
                const size_t len) {
  const auto vscalar = _mm256_set1_pd(scalar);
  for (size_t i = 0; i < (len/4)*4; i += 4) {
    auto tmp = _mm256_loadu_pd(c + i);
    tmp = _mm256_mul_pd(vscalar, tmp);
    _mm256_storeu_pd(b + i, tmp);
  }
  for (size_t i = (len/4)*4; i < len; i++) {
    b[i] = scalar * c[i];
  }
}

__attribute__((noinline))
void add_avx2(const double* __restrict a,
              const double* __restrict b,
              double* __restrict c,
              const size_t len) {
  for (size_t i = 0; i < (len/4)*4; i += 4) {
    const auto atmp = _mm256_loadu_pd(a + i);
    const auto btmp = _mm256_loadu_pd(b + i);
    const auto ret  = _mm256_add_pd(atmp, btmp);
    _mm256_storeu_pd(c + i, ret);
  }
  for (size_t i = (len/4)*4; i < len; i++) {
    c[i] = a[i] + b[i];
  }
}

__attribute__((noinline))
void triadd_avx2(double* __restrict a,
                 const double* __restrict b,
                 const double* __restrict c,
                 const double scalar,
                 const size_t len) {
  const auto vscalar = _mm256_set1_pd(scalar);
  for (size_t i = 0; i < (len/4)*4; i += 4) {
    const auto btmp = _mm256_loadu_pd(b + i);
    const auto ctmp = _mm256_loadu_pd(c + i);
    const auto ret  = _mm256_fmadd_pd(ctmp, vscalar, btmp);
    _mm256_storeu_pd(a + i, ret);
  }
  for (size_t i = (len/4)*4; i < len; i++) {
    a[i] = b[i] + scalar * c[i];
  }
}

__attribute__((noinline))
void copy_avx512(double* __restrict c,
                const double* __restrict a,
                const size_t len) {
  for (size_t i = 0; i < (len/8)*8; i += 8) {
    const auto tmp = _mm512_loadu_pd(a + i);
    _mm512_storeu_pd(c + i, tmp);
  }
  for (size_t i = (len/8)*8; i < len; i++) {
    c[i] = a[i];
  }
}

__attribute__((noinline))
void scale_avx512(double* __restrict b,
                 const double* __restrict c,
                 const double scalar,
                 const size_t len) {
  const auto vscalar = _mm512_set1_pd(scalar);
  for (size_t i = 0; i < (len/8)*8; i += 8) {
    auto tmp = _mm512_loadu_pd(c + i);
    tmp = _mm512_mul_pd(vscalar, tmp);
    _mm512_storeu_pd(b + i, tmp);
  }
  for (size_t i = (len/8)*8; i < len; i++) {
    b[i] = scalar * c[i];
  }
}

__attribute__((noinline))
void add_avx512(const double* __restrict a,
               const double* __restrict b,
               double* __restrict c,
               const size_t len) {
  for (size_t i = 0; i < (len/8)*8; i += 8) {
    const auto atmp = _mm512_loadu_pd(a + i);
    const auto btmp = _mm512_loadu_pd(b + i);
    const auto ret  = _mm512_add_pd(atmp, btmp);
    _mm512_storeu_pd(c + i, ret);
  }
  for (size_t i = (len/8)*8; i < len; i++) {
    c[i] = a[i] + b[i];
  }
}

__attribute__((noinline))
void triadd_avx512(double* __restrict a,
                  const double* __restrict b,
                  const double* __restrict c,
                  const double scalar,
                  const size_t len) {
  const auto vscalar = _mm512_set1_pd(scalar);
  for (size_t i = 0; i < (len/8)*8; i += 8) {
    const auto btmp = _mm512_loadu_pd(b + i);
    const auto ctmp = _mm512_loadu_pd(c + i);
    const auto ret  = _mm512_fmadd_pd(ctmp, vscalar, btmp);
    _mm512_storeu_pd(a + i, ret);
  }
  for (size_t i = (len/8)*8; i < len; i++) {
    a[i] = b[i] + scalar * c[i];
  }
}

void check(const std::vector<double>& a,
           const std::vector<double>& a_ref) {
  for (size_t i = 0; i < a.size(); i++) {
    if (a[i] != a_ref[i]) {
      std::cerr << "Error occurs" << std::endl;
      return;
    }
  }
}

#define MEASURE(func_expr, ...)                                         \
  do {                                                                  \
    const int loop = 10000;                                             \
    const auto beg = std::chrono::system_clock::now();                  \
    for (int i = 0; i < loop; i++) {                                    \
      func_expr(__VA_ARGS__);                                           \
    }                                                                   \
    const auto end = std::chrono::system_clock::now();                  \
    std::cout << #func_expr << ": " << std::endl;                            \
    std::cout << std::chrono::duration_cast<std::chrono::milliseconds>(end - beg).count(); \
    std::cout << " [ms]" << std::endl;                                  \
  } while (0)

int main(int argc, char* argv[]) {
  size_t len = 1 << 16;
  if (argc == 2) len = std::atoi(argv[1]);
  const double scalar = 2.0;

  std::mt19937 mt;
  std::uniform_real_distribution<> urd;
  std::vector<double> a_ref(len), b_ref(len), c_ref(len);
  std::vector<double> a_avx2(len), b_avx2(len), c_avx2(len);
  std::vector<double> a_avx512(len), b_avx512(len), c_avx512(len);

  std::generate_n(a_ref.begin(), len, [&mt, &urd](){return urd(mt);});
  std::generate_n(b_ref.begin(), len, [&mt, &urd](){return urd(mt);});
  std::fill_n(c_ref.begin(), len, 0);

  std::copy_n(a_ref.begin(), len, a_avx2.begin());
  std::copy_n(b_ref.begin(), len, b_avx2.begin());
  std::fill_n(c_avx2.begin(), len, 0);

  std::copy_n(a_ref.begin(), len, a_avx512.begin());
  std::copy_n(b_ref.begin(), len, b_avx512.begin());
  std::fill_n(c_avx512.begin(), len, 0);

  MEASURE(copy_ref, c_ref.data(), a_ref.data(), len);
  MEASURE(scale_ref, b_ref.data(), c_ref.data(), scalar, len);
  MEASURE(add_ref, a_ref.data(), b_ref.data(), c_ref.data(), len);
  MEASURE(triadd_ref, a_ref.data(), b_ref.data(), c_ref.data(), scalar, len);

  MEASURE(copy_avx2, c_avx2.data(), a_avx2.data(), len);
  MEASURE(scale_avx2, b_avx2.data(), c_avx2.data(), scalar, len);
  MEASURE(add_avx2, a_avx2.data(), b_avx2.data(), c_avx2.data(), len);
  MEASURE(triadd_avx2, a_avx2.data(), b_avx2.data(), c_avx2.data(), scalar, len);

  MEASURE(copy_avx512, c_avx512.data(), a_avx512.data(), len);
  MEASURE(scale_avx512, b_avx512.data(), c_avx512.data(), scalar, len);
  MEASURE(add_avx512, a_avx512.data(), b_avx512.data(), c_avx512.data(), len);
  MEASURE(triadd_avx512, a_avx512.data(), b_avx512.data(), c_avx512.data(), scalar, len);

  check(a_avx2, a_ref);
  check(b_avx2, b_ref);
  check(c_avx2, c_ref);

  check(a_avx512, a_ref);
  check(b_avx512, b_ref);
  check(c_avx512, c_ref);
}
