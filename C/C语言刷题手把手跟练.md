# C语言刷题/手把手跟练

# 1、分钟->时间+分钟

> /*
> 编写一个程序，把用分钟表示的时间转换成用小时和分钟表示的时间。
> 使用#define或const创建一个表示60的符号常量或const变量。
> 通过while循环让用户重复输入值，直到用户输入小于或等于0的值才停止循环。
> */

```c
/*
编写一个程序，把用分钟表示的时间转换成用小时和分钟表示的时间。
使用#define或const创建一个表示60的符号常量或const变量。
通过while循环让用户重复输入值，直到用户输入小于或等于0的值才停止循环。
*/

# include <stdio.h>
# define MINUTE_HOUR 60

void MinuteToHour(int, int *, int *);

int main(void)
{
	int iMinute;
	int iHour = 0;
	int iRestMinute = 0;	// 分钟转换为小时为单位剩余的分钟数	
	
	while (1)
	{
		printf("请输入时间(单位是分钟)，小于等于0时退出:");
		scanf("%d", &iMinute);
		
		if (iMinute > 0)
		{
			MinuteToHour(iMinute, &iHour, &iRestMinute) ;
		}
		else
		{
			break;
		}
		printf("%d分钟=%d小时%d分钟\n", iMinute, iHour, iRestMinute);
	}
	
	return 0;
}

void MinuteToHour(int iMinute, int* ptrHour, int* ptrRestMinute)
{
	*ptrHour = iMinute / MINUTE_HOUR;
	*ptrRestMinute = iMinute % MINUTE_HOUR;
	
	return;
}
```

