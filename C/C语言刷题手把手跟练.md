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

# 2、统计输入的字符

```c
/*
编写一个程序读取输入，读到#字符停止，
然后报告读取的空格数、换行符数和所有其他字符的数量。
scanf不会清空缓冲区中的回车键，而getchar会清空回车键 
*/
# include <stdio.h>

# define MAXLEN 100

void getInput(char *);
void testOutput(char *);
void calInputCharNum(char *);

int main(void)
{
	char sInputs[MAXLEN];
	
	getInput(sInputs);
//	testOutput(sInputs);
	calInputCharNum(sInputs);
	
	return 0;
}

void getInput(char sInputs[])
{
	int i = 0;	// 计数器
	char cTmp;
	
	printf("输入#结束:");
	
	while (1)
	{
		cTmp = getchar();
		
		if (cTmp != '#')
		{
			sInputs[i] = cTmp;
			i++;
		}
		else
		{
			sInputs[i] = '\0';
			break;
		}	
	} 
	
	return;
}

void testOutput(char* ptrStr)
{
	int iTmp = 0;
	
	while (ptrStr[iTmp])
	{
		printf("%c", ptrStr[iTmp]); 
		iTmp++;
	}
	printf("\n");
	
	return;
}

void calInputCharNum(char *ptrStr)
{
	int iSpaceNum = 0;
	int iReturnNum = 0;
	int iOtherNum = 0;
	int i = 0;
	
	while (ptrStr[i])
	{
		if (ptrStr[i] == '\n')
			iReturnNum++;
		else if (ptrStr[i] == ' ')
			iSpaceNum++;
		else
			iOtherNum++;
		i++;
	}

	printf("空格个数:%d,回车个数:%d,其他字符个数:%d\n", iSpaceNum, iReturnNum, iOtherNum);
	
	return;
}
```

# 3、统计输入字符中ei的次数

```c
# include <stdio.h>

int main(void)
{
	char sInputs[100];
	char cTemp;
	int i = 0;
	int ieiCnt = 0;	// 记录ei出现的次数 
	
	while ((cTemp=getchar()) != '#')
	{
		sInputs[i++] = cTemp;
	}
	sInputs[i] = '\0';
	
	i = 0;
	while (sInputs[i])
	{
		if (sInputs[i]=='e' && sInputs[i+1]=='i')
		{
			ieiCnt++;
			i += 2;
		}
		else
		{
			i++;
		}
	}
	
	printf("输入字符中包含ei的个数是%d\n", ieiCnt);
	
	return 0;
}
```

# 4、天数->周+天

```c
/*
编写一个程序，提示用户输入天数，然后将其转换成周数和天数。例如，用户输入18，则转换成2周4天。
以下面的格式显示结果。通过while循环让用户重复输入天数，
当用户输入一个非正值时（如0或-20），循环结束。
*/ 

# include <stdio.h>

const int iDayWeek = 7;
void dayToWeek(int, int *, int *);

int main(void)
{
	int iDay = 0;	// 用户输入，将输入的时间转换为xx周xx天 
	int iWeek = 0;
	int iRestDay = 0;	// 转换为周之后剩余的天数 
	
	while (1)
	{
		printf("请输入一个天数(小于等于0时退出)：");
		scanf("%d", &iDay);
		
		if (iDay > 0)
		{
			dayToWeek(iDay, &iWeek, &iRestDay);
			printf("%d天=%d周 %d天\n", iDay, iWeek, iRestDay);
		}
		else
		{
			break;
		}
	} 
	
	return 0;
}

void dayToWeek(int iDay, int* ptrWeek, int* ptrRestDay)
{
	*ptrWeek = iDay / iDayWeek;
	*ptrRestDay = iDay % iDayWeek;
	
	return;
}
```

# 5、输入奇数以及偶数

```c
# include <stdio.h>

int main(void)
{
	int iOddCnt = 0;
	int iEvenCnt = 0;
	float fOddAvg = 0.0;
	float fEvenAvg = 0.0;
	int iTemp;
	
	printf("请输入一些整数(0结束输入):");
	
	while (1)
	{
		scanf("%d", &iTemp);
		
		if (iTemp != 0)
		{
			if (iTemp % 2 == 0)
			{
				fEvenAvg += iTemp;
				iEvenCnt++;
			}
			else
			{
				fOddAvg += iTemp;
				iOddCnt++;
			}
		}
		else
		{
			break;
		}
	}
	
	printf("输入的奇数个数是%d个，平均数为%.2f", iOddCnt, fOddAvg/iOddCnt);
	printf("输入的偶数个数是%d个，平均数为%.2f", iEvenCnt, fEvenAvg/iEvenCnt);
	
	return 0;
}
```

