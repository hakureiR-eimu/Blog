---
title: "Effective Git"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---


## Use git pull --rebase instead of git pull

## Git commit semantic

人生苦短,请遵守规范

### 提交细则
对于Git的提交日志，我们有非常明确而详细的提交规范。这将有助于我们在查看**项目历史**时，更容易明确每一次提交的内容。另一方面，我们还直接使用了Git提交日志来生成**AngularJS的变更日志**。
### 修改类型

每个类型值都表示了不同的含义，类型值必须是以下的其中一个

+ **feat** : 提交新功能
+ **fix** : 修复了bug
+ **docs** : 只修改了文档
+ **style** : 修改代码格式，未修改代码逻辑 
+ **refactor** : 代码重构，既没修复bug也没有添加新功能
+ **perf** : 性能优化，提高性能的代码更改
+ **test** : 添加或修改代码测试
+ **chore** : 对构建流程或辅助工具和依赖库(如文档生成等)的更改

### 代码回滚

代码回滚比较特殊，如果本次提交是为了恢复到之前的某个提交，那提交消息应该以“revert:”开头，后跟要恢复到的那个提交的标题。然后在消息正文中，应该写上“This reverts commit <hash>”，其中“<hash>”是要还原的那个提交的SHA值。

###  标题

标题是对变更的简明描述

+ 使用祈使句和现代时态
+ 不要大写首字母
+ 结尾不要使用句号