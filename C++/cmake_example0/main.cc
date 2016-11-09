#include "tool/math_example.h"

#include <stdio.h>
#include "config.h"

int main()
{
	int b = add(12, 54);

	printf("Hello World from t1 Main: %d, version: %d.%d!\n", 
			b, 
			Demo_VERSION_MAJOR,
			Demo_VERSION_MINOR);
	return 0;
}


