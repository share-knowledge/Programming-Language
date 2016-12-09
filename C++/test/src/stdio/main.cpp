#include <cstdio>
#include <stdio.h>
#include <vector>
#include <map>
#include <array>

int add(int a, int b);

int main()
{
    std::vector<int> a;
    a.push_back(11);
    a.clear();

    printf("");

    int b = add(1,1);
    int c=10;
    c +=b;
    for (int i =0 ; i <10; ++i) {
        b +=i;
    }
    printf("%d", b);

    return 0;
}

int add(int a, int b)
{
    if (a > 1) {
        b = 10;
    } else {
        a=0;
    }
    return a + b;
}
