---
title: 'Linux&C语言练习[持续更新]'
date: 2022-11-13 21:42:29
updated: 2022-11-13 21:42:29
tags: ['Linux', 'C语言', 'C']
categories:
  [随笔]
cover:
description:
---

# C语言练习题

## 求和

> 题目：求 2+22+222+2222..+2222(6次相加) 
> 其中次数(6)和基数(2)需要从键盘输入 

```c
/*
题目：求 2+22+222+2222..+2222(6次相加) 
其中次数(6)和基数(2)需要从键盘输入 
*/ 

# include <stdio.h>
# include <math.h>

int gen_number(int i, int a);

int main(void)
{
	int n, a; // n用于控制次数,a用于代表基数
	int sum=0, tmp;
	
	printf("请输入次数和基数:");
	scanf("%d,%d", &n, &a);
	
	printf("n=%d, a=%d\n", n, a);
	
	for (int i=1; i<=n; i++)
	{
		tmp = gen_number(i, a);
		printf("%d\t", tmp);
		sum += tmp;
	}
	printf("\n");
	
	printf("sum=%d\n", sum);
	
	return 0;
}

int gen_number(int cnt, int a)
{
	int i=0;
	double tmp=0;
	
	for (;i<cnt; i++)
	{
		tmp += a*pow(10, i);
	}
	printf("tmp=%.0lf\n", tmp);
	
	return (int)tmp;
}
```

## 球弹起高度

> 一球从100m高空下落，每次弹起上一次的一半。
> 问：第十次弹起高度是多少，一共走了多远 

```c
/*
一球从100m高空下落，每次弹起上一次的一半。
问：第十次弹起高度是多少，一共走了多远 
*/ 

# include <stdio.h>

int main(void)
{
	float h=100, s=0;
	int n=10;
	
	for (int i=0; i<n; i++)
	{
		s += h+h/2;
		h /= 2;
		printf("第%d次反弹高度：%.2f\n", i+1, h);
	}
	
	printf("第%d次的反弹高度是%.2f米,总共走了%.2f米\n", n, h, s);
	
	return 0;
}
```

## 猴子吃桃  

> 猴子吃桃问题：有一堆桃子，和一个猴子。第一天猴子吃一半，再多吃一个；
> 。。。。；第10天的时候只剩1个了。
> 问：之前有多少桃子 

```c
/*
猴子吃桃问题：有一堆桃子，和一个猴子。第一天猴子吃一半，再多吃一个；
。。。。；第10天的时候只剩1个了。
问：之前有多少桃子 
*/ 

# include <stdio.h>

int main(void)
{
	int peach_cnt=0;
	int end=1, n=9;
	
	printf("香蕉的个数:%d\n", end);
	
	for (int i=0; i<n; i++)
	{
		end = (end+1)*2;
		printf("香蕉的个数:%d\n", end);
	}
	
	return 0;
 } 
```

## 分数序列求和 

> 有一分数序列：2/1，3/2，5/3，8/5，13/8，21/13...求出这个数列的前20项之和。

```c
/*
有一分数序列：2/1，3/2，5/3，8/5，13/8，21/13...求出这个数列的前20项之和。
*/

# include <stdio.h>

int main(void)
{
	float a, b, tmp;	// 分别代表分母和分子；
	float sum=0;
	
	a = 2;
	b = 1;
	
	for (int i=0; i<20; i++) 
	{
		printf("a/b = %f\n", a/b);
		sum +=  a/b;
		tmp = a;
		a = a+b;
		b = tmp;
	}
	printf("sum = %f\n", sum);
	
	return 0;
}
```

## 阶乘求和

> 求1+2!+3!+...+20!的和。

```c
/*
求1+2!+3!+...+20!的和。
*/

# include <stdio.h>

long double get_jiecheng(int i);

int main(void)
{
	long double sum=0;
	
	for (int i=1; i<=20; i++)
	{
		printf("%d!=%Lf\n", i, get_jiecheng(i));
		sum += get_jiecheng(i);
	}
	printf("sum=%Lf\n", sum);
	
	return 0;
}

long double get_jiecheng(int i)
{
	if (i==1)
		return 1;
	else
		return i*get_jiecheng(i-1);
}
```

## 逆序打印

> 输入一个正整数，求是几位数，然后逆序打印 

```c
/*
输入一个正整数，求是几位数，然后逆序打印 
*/

# include <stdio.h>

int main(void)
{
	int n;
	int yu, zheng;	// yu 代表取余的个位数，zheng代表除以10之后的数 
	int tmp, cnt=1;
	
	printf("请输入一个整数:");
	scanf("%d", &n);
	
	tmp = n;
	
	while (n/10>0)
	{
		yu = n%10;
		printf("%d", yu);
		n = n/10;
		cnt++;
	}
	printf("%d\n", n);
	
	printf("%d是%d位数\n", tmp, cnt);
	
	return 0;
}
```

## 删除指定字符

> 删除一个字符串中的指定 字符，如 "aabc"删除其中的a 

```c
/*
删除一个字符串中的指定 字符，如 "aabc"删除其中的a 
*/

# include <stdio.h>
# include <string.h>

# define MAXLEN  100

int main(void)
{
	char s[MAXLEN];
	char c;
	int j;
	
	gets(s);
	puts(s);
	
	printf("请输入指定删除的字符 :");
	c = getchar();
	
	for (int i=0; i<strlen(s);  i++)
	{
		if (s[i] ==  c)
		{
			for(j=i; j<strlen(s); j++)
			{
				s[j]  = s[j+1];
			}
		}
	}
	puts(s);
	
	return 0;
}
```

## 字符串反转

```c
# include <stdio.h>
# include <string.h>

void reverse(char s[]);

int main(void)
{
	char s[100];

	printf("请输入一串字符串：");
	gets(s);
	reverse(s);
	puts(s);

	return 0;
}

void reverse(char s[])
{
	int i;
	int len=strlen(s);
	char tmp;

	for (i=0; i<len/2; i++)
	{
		tmp = s[i];
		s[i] = s[len-1-i];
		s[len-1-i] = tmp;

	}

	return;
}
```



## 插入有序数组

```c
# include <stdio.h>

void show_arr(int a[], int len)
{
	int i;

	for (i=0; i<len; i++)
	{
		printf("%d\t", a[i]);
	}
	printf("\n");

	return;
}

int main(void)
{
	int a[6] = {1,  3, 45, 56, 78};
	int val;

	printf("请输入一个整数:");
	scanf("%d", &val);

	show_arr(a, 5);

	if (val > a[4])
		a[5] = val;
	else
	{
		for (int i=0; i<5; i++)
		{
			if (val<=a[i])
			{
				for (int j=4; j>=i; j--)
				{
					a[j+1] = a[j];
				}
				a[i] = val;
				break;
			}
		}
	}

	show_arr(a, 6);

	return 0;
}

```

## 使用函数交换两个变量的值

```c

/*
 通过函数修改主函数中变量的值必须传入该变量的地址
 然后通过指针的解引用*p的形式来修改变量的值

 */
 # include <stdio.h>

void swap(int* a, int* b)
{
	int tmp;

	tmp = *a;
	*a = *b;
	*b = tmp;

	return;
}

int main(void)
{
	int a, b;

	a = 4;
	b = 5;

	printf("交换前:a=%d, b=%d\n", a, b);
	swap(&a, &b);
	printf("交换后:a=%d, b=%d\n", a, b);

	return 0;
}

```



## 使用指针将数组中最大值和最小值放置到数组的结尾和开头

```c
# include <stdio.h>

void show_arr(int val[], int len)
{
	int i;

	for (i=0; i<len; i++)
	{
		printf("%d\t", val[i]);
	}
	printf("\n");

	return;
}

void swap(int *p, int val[], int index)
{
	int tmp;

	tmp = *p;
	*p = val[index];
	*(val+index) = tmp;

	return;
}

void zhizhen_swap(int val[], int len)
{
	int i;
	int *pMax, *pMin;

	pMax = pMin = val;

	for (i=1; i<len; i++)
	{
		if (val[i]>*pMax)
			pMax = &val[i];
		else if (val[i]<*pMin)
			pMin = val+i;
	}

	swap(pMax, val, len-1);
	swap(pMin, val, 0);

	

	return;
}

int main(void)
{
	int val[] = {34, 32, 123, 109, 899, 451};
	int len;

	len = sizeof(val) / sizeof(val[0]);

	show_arr(val, len);
	zhizhen_swap(val, len);
	show_arr(val, len);

	printf("length of array is %d\n", len);

	return 0;
}

```

## 输入输出5个学生的信息

```c
# include <stdio.h>

typedef struct Stu
{
	char name[20];
	char sex[2];
}St, *pSt;

void input(St* s, int len)
{
	int i;

	for (i=0; i<len; i++)
	{
		printf("请输入第%d个学生的信息(姓名 性别):", i+1);
		scanf("%s %s", s[i].name, s[i].sex);
	}

	return;	
}

void output(St* s, int len)
{
	int i;

	for (i=0; i<len; i++)
	{
		printf("%s %s\n", s[i].name, s[i].sex);
	}

	return;
}

int main(void)
{
	St s[5];

	input(s, 5);
	output(s, 5);

	return 0;
}

```



## 二级指针

+ 指针

> int *p;
>
> int a=100;
>
> p = &a;

+ 指向一个变量
  + int
  + char
  + float
+ 二级指针
  + 指向一个指针
    + int *
    + char *
    + float *

[[Linux & C语言\]13、二级指针_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1zK411d7C8/?spm_id_from=333.999.list.card_archive.click&vd_source=7870216bb7d9a81dade7ca3168edad74)

## 二维数组 数组指针 指针数组

```c
# include <stdio.h>

int main(void)
{
	char s1[][5] = {"abc", "efd", "dfa"};
	char *p[3];

	for (int i=0; i<3; i++)
	{
		p[i] = s1[i];
	}

	
	for (int i=0; i<3; i++)
	{
		printf("%s\n", p[i]);
	}

	return 0;
}

```

[[Linux & C语言\]14、二维数组、指针数组、数组指针_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1bg411v7SB/?spm_id_from=333.999.list.card_archive.click&vd_source=7870216bb7d9a81dade7ca3168edad74)

## 再谈 二维数组 数组指针 指针数组

```c
# include <stdio.h>

int main(void)
{
	int a = 100;
	int* p = &a;
	int** p2 = &p;

	printf("&a = %p\n", &a);
	printf("p = %p\n", p);
	printf("*p2 = %p\n", *p2);
	printf("**p2 = %d\n", **p2);


	return 0;
}

```

[[Linux & C语言\]15、再谈 二维数组、指针数组、数组指针，敲黑板，重点！_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1WG4y1Z7Hq/?spm_id_from=333.999.list.card_archive.click&vd_source=7870216bb7d9a81dade7ca3168edad74)

## 结构体指针-寻找年龄最大的人

```c
# include <stdio.h>

typedef struct Person
{
	char name[20];
	int age;
}Person, *ptr_P;

void sort_struct_arr(ptr_P p_arr, int len)
{
	int i, j;
	Person tmp_p;

	for (i=0; i<len-1; i++)
	{
		for (j=0; j<len-1-i; j++)
		{
			if (p_arr[j].age<p_arr[j+1].age)
			{
				tmp_p = p_arr[j];
				p_arr[j] = p_arr[j+1];
				p_arr[j+1] = tmp_p;
			}
		}
	}
	printf("排序完成");

	return;
}

void show_struct_arr(ptr_P ptr_arr, int len)
{
	int i;

	for (i=0; i<len; i++)
	{
		printf("name:%s, age:%d\n", ptr_arr[i].name, ptr_arr[i].age);
	}

	return;
}

int main(void)
{
	Person person[4] = {"xiaowang", 21, "xiaoli", 23, "xiaosi", 45, "xiaolan", 18};
	ptr_P ptr_arr = person;

	show_struct_arr(ptr_arr, sizeof(person) / sizeof(person[0]));
	sort_struct_arr(ptr_arr, sizeof(person) / sizeof(person[0]));
	show_struct_arr(ptr_arr, sizeof(person) / sizeof(person[0]));

	return 0;
}

```

# 编写高质量代码

## 变量命名规范

+ 变量命名力求简单：一行只声明一个变量，最好声明的同时进行初始化；嵌套作用域最好不要声明相同名字的变量
+ 命名规范
  + **匈牙利命名法**
    		int iRet;	//	Result
    		char sBuff[20];		// 用来存储一些字符串中间变量
    		int iWidth = 10;	// 存储宽度
    		int iHeight;		
    		int iDepth;
  + 驼峰命名法
    + 大驼峰
    + 小驼峰
  + 帕斯卡命名法(大驼峰命名)
