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

## 更改提交的操作

+ git reset

  > git另一个特征便是可以灵活操作历史版本

  + 回溯历史版本
  + git reset --hard hash值
    + hash值指的是目标时间点的哈希值

## 推送至远程仓库

远程仓库顾名思义，是与我们本地仓库相对独立的另一个仓库。

+ git remote add
+ git push  -u orgin master
  + -u参数可以在推送的同时，将origin仓库的master分支设置为本地仓库当前分支的upstream（上游）
+  git push -u origin feature-D 
  + 本地新建立的分支在推送的时候也要和远端的分支名保持一致
  + 故需要加上-u参数

## 从远程仓库获取

+ git clone
  + 执行git clone命令后我们会默认处于master分支下，同时系统会自动将origin设置成该远程仓库的标识符。也就是说，当前本地仓库的master分支与GitHub端远程仓库（origin）的master分支在内容上是完全相同的。
+ git branch -a
  + 查看当前分支的相关信息，-a参数可以同时显示本地仓库和远程仓库的分支信息
+ git checkout -b feature-D origin/feature-D
  + -b参数的后面是本地仓库中新建分支的名称。新建分支名称后面是获取来源的分支名称。例子中指定了origin/feature-D，就是说以名为origin的仓库（这里指GitHub端的仓库）的feature-D分支为来源，在本地仓库中创建feature-D分支。
+ git pull
  +  从远端仓库拉取更新，使得本地内容为最新
  + 然后就可以将自己修改的内容更新上去了
  + == git  fetch  + git merge
+ git  fetch

## 高级操作

+ git rebase