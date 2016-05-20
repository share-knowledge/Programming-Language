#include <stdio.h>
#include <iostream>
#include <string.h>

/**
 * 测试字节对齐
 * 64 位系统系统
 */

// 获取变量在结构体的偏移量
#define myoffsetof(type, member) (size_t)&(((type*)0)->member)

#pragma pack(4) // default 4, can set valid value 1,2,4,8,16
struct Student {
	int num; // 4
	char name[14]; // 14
	char sex; // 1
	int age; // 4
	float score; // 4
	char addr[30]; // 30
};
#pragma pack()

// 类型大小
void type_sizeof()
{
	std::cout << "内置类型大小: ---------------------\n";
	std::cout << "sizeof of char: " << sizeof(char) << std::endl;	
	std::cout << "sizeof of bool: " << sizeof(bool) << std::endl;	
	std::cout << "sizeof of int: " << sizeof(int) << std::endl;	
	std::cout << "sizeof of short: " << sizeof(short) << std::endl;	
	std::cout << "sizeof of long: " << sizeof(long) << std::endl;	
	std::cout << "sizeof of unsigned int: " << sizeof(unsigned int) << std::endl;	
	std::cout << "sizeof of unsigned long: " << sizeof(unsigned long) << std::endl;	
	std::cout << "sizeof of float: " << sizeof(float) << std::endl;	
	std::cout << "sizeof of double: " << sizeof(double) << std::endl;	
	std::cout << "sizeof of int8_t: " << sizeof(int8_t) << std::endl;	
	std::cout << "sizeof of int16_t: " << sizeof(int16_t) << std::endl;	
	std::cout << "sizeof of int32_t: " << sizeof(int32_t) << std::endl;	
	std::cout << "sizeof of int64_t: " << sizeof(int64_t) << std::endl;	
	std::cout << "sizeof of long long: " << sizeof(long long) << std::endl;	
	std::cout << "sizeof of void *: " << sizeof(void *) << std::endl;	
	std::cout << "sizeof of char [14]: " << sizeof(char [14]) << std::endl;	
	std::cout << "sizeof of std::string: " << sizeof(std::string) << std::endl;	

}

void test_alignment(const Student *stu)
{
	std::cout << "struct Student 大小: -------------------------\n";

	std::cout << "sizeof of Student: " << sizeof(Student) << std::endl; 

	printf("struct student member num sizeof: %lu, [%lu, %lu]\n", sizeof(stu->num), 0l, myoffsetof(Student, name));
	printf("struct student member name sizeof: %lu, [%lu, %lu]\n", sizeof(stu->name), myoffsetof(Student, name), myoffsetof(Student, sex));
	printf("struct student member sex sizeof: %lu, [%lu, %lu]\n", sizeof(stu->sex), myoffsetof(Student, sex), myoffsetof(Student, age));
	printf("struct student member age sizeof: %lu, [%lu, %lu]\n", sizeof(stu->age), myoffsetof(Student, age), myoffsetof(Student, score));
	printf("struct student member score sizeof: %lu, [%lu, %lu]\n", sizeof(stu->score), myoffsetof(Student, score), myoffsetof(Student, addr));
	printf("struct student member addr sizeof: %lu, [%lu, %lu]\n", sizeof(stu->addr), myoffsetof(Student, addr), sizeof(Student));

	/**
	 * 计算方法
	 *
	 */
}


union Stu {
	char a[25];
	int b;
	char c;
};

void test_alignment(Stu *stu)
{
	std::cout << "stu -------- \n";
	std::cout << sizeof(Stu) << std::endl;

}


int main(int argc, char *argv[])
{
	type_sizeof();

	Student stu;
	stu.num = 13;
	stu.sex = '1';
	test_alignment(&stu);

	Stu s;
	test_alignment(&s);

	return 0;
}

