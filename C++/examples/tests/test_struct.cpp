#include <iostream>
#include <stdio.h>
#include <stdlib.h>

/**
 * 如何根据某个结构成员的地址找出结构的地址
 */


struct User {
	std::string name;
	char sex;
	int age;
	char address[25];
};

#define myoffsetof(type, member) (size_t)&(((type*)0)->member)

#define mycontainer_of(ptr, type, member) ({ \
		const __typeof__( ((type *)0)->member ) *__mptr = (ptr); \
		(type *)( (char *)__mptr - myoffsetof(type, member) );})

void usage(const char *basename)
{
	fprintf(stderr, "%s name sex age address\n", basename);
}

void print(const User *user)
{
	if(NULL == user)
	{
		return;
	}

	fprintf(stdout, "name: %s\tsex:%c\tage:%d\taddress:%s\n", 
			user->name.c_str(), user->sex, user->age, user->address);
}


//./test_struct  zenggang 1 12 吴家湾
//
int main(int argc, char *argv[])
{
	if(argc < 5)
	{
		usage(argv[0]);

		return -1;
	}

	User user;

	user.name = argv[1];
	user.sex = argv[2][0];
	user.age = atoi(argv[3]);
	strlcpy(user.address, argv[4], sizeof(user.address));

	print(&user);

	std::cout << &(user.address) << std::endl;
	std::cout << &user << std::endl;

	std::cout << "name offset: " << myoffsetof(User, name) << std::endl;
	std::cout << "sex offset: " << myoffsetof(User, sex) << std::endl;
	std::cout << "age offset: " << myoffsetof(User, age) << std::endl;
	std::cout << "address offset: " << myoffsetof(User, address) << std::endl;

	std::cout << "sizeof std::string: " << sizeof(std::string) << std::endl;
	std::cout << "sizeof char: " << sizeof(char) << std::endl;
	std::cout << "sizeof int: " << sizeof(int) << std::endl;
	std::cout << "sizeof char *: " << sizeof(char *) << std::endl;
	std::cout << "sizeof User: " << sizeof(User) << std::endl;


	User *user1 = mycontainer_of(&(user.address), User, address);
	std::cout << user1 << std::endl;


	return 0;
}


