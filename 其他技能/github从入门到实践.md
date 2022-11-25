# github从入门到实践

## 基本操作

+ git init

  + 初始化仓库

    > 需要事先创建一个文件夹，进入该文件夹执行上述命令

  + 我们将这个目录的内容称为“附属于该仓库的工作树”

+ git status

  + 查看仓库的状态

+ git add

  + 向暂存区添加文件

    > 暂存区是提交之前的一个临时区域。要想使用Git仓库的管理对象，就需要使用git add命令将其加入暂存区

+ git commit

  + 保存仓库的历史记录

    > 将当前暂存区中的文件实际保存到仓库的历史记录中。通过这些记录，我们就可以在工作树中复原文件

  + -m ""
    + 可以添加提交信息

+ git log
  + 查看提交日志
  + git log file
    + 只显示某个文件的提交日志
  + git log -p file
    + 显示提交前后文件的差别
+ git diff
  + 查看当前工作树与暂存区的差别
  + git diff HEAD
    + 查看本次提交与上一次提交之间有什么差别，这里的HEAD指向当前分支中最新一次提交的指针

## 分支的操作

> 在进行**多个并行作业**时，我们会用到分支。在这类并行开发的过程中，往往同时存在多个最新代码状态。

+ git branch
  + 列出分支名，并且显示当前所在的分支
+ git checkout -b
  + 创建并切换分支
  + git branch feature-A
  + git checkout feature-A
+ git checkout -
  + 切换到上一个分支
+ git merge --no-ff feature-A
  + 将feature-A分支中的内容合并到主分支，记得先checkout到master(main)分支
+ git log --graph
  + 以图表的形式提交输出日志

