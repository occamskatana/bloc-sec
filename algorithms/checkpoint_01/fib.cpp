#include <gmp.h>
#include <gmpxx.h>

mpz_class fib(int n)
{
    mpz_class a = 1, b = 1;
    for (int i = 3; i <= n; i++) {
        mpz_class c = a + b;
        a = b;
        b = c;
    }           
    return b;
}

int main()
{
	for(int i = 0; i <= 10000; i++){
	   fib(10000);
	}
	return 0;
}

