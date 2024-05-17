---
title: "Cpp学习笔记"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
---

## Effictive Cpp

### 1：让自己习惯C++

### 1st:View C++ as a federation of languages

### 2nd:Prefer consts,enums,and inlines to #defines

### 3rd:USe const whenever possible

### 4th:

## Cpp std

## 使用随机数生成器生成随机数
随机数生成器是随机数引擎类模板的一个预定义实例
```cpp
#include <random>
#include <iostream>
int main(){
    std::random_device rd;
    for(size_t n {};n<8;++n){
        std::cout<<rd()<<" ";
    }
    std::cout << std::endl;
}

```