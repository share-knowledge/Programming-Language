#include <stdio.h>
#include <string>

/**
 * %d int
 * %c char
 * %s char *
 */


void print(std::string f, ...)
{
	va_list ap;
	va_start(ap, f);
	int a1 = va_arg(ap, int);
	char *a2 = va_arg(ap, char *);
	char a3 = va_arg(ap, int);
	float a4 = va_arg(ap, double);
	va_end(ap);

	printf("a1=%d a2=%s a3=%c a4=%f\n", a1, a2, a3, a4);
}

int main()
{

	print("", 1, "123", 'A', 10.2);

	return 0;
}
