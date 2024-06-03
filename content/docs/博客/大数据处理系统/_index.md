---
title: "大数据处理系统"
weight: 1

# bookFlatSection: false

# bookToc: true

# bookHidden: false

# bookCollapseSection: false

# bookComments: false

# bookSearchExclude: false
---

## 大数据处理系统

01. 请分析大数据相关特征，包括数据体量大(Volume)、数据流动性高(Velocity)以及数据种类繁多(Variety)分别对大数据处理带来了什么具体挑战，并简要阐述相应措施。
   
答：挑战：设计高拓展性、低成本、快速响应的大数据存储和处理系统；数据种类多，需求多样，关联复杂；建模、存储、查询、分析和理解多样化的复杂数据，挖掘数据价值    
；
措施：1. 数据为中心的计算架构  2. 化繁为简，弱化数据一致性，提高可拓展性和可靠性

02. 复制与一致性：具有多副本的分布式存储系统，当一个节点的数据被修改时，还需要保持副本之间的一致性；通过数据读写的操作日志回放，能够实现主副本到备副本的增量复制；
03. 集群环境下多副本需要实现负载均衡，数据均匀分布，副本一致性。
04. CAP涵义  1.一致性：要求系统保持数据一致；2.可用性：指系统处于可用状态；3.分区容忍性：在存在多个数据分区和数据分区发生变化的情况下，分布式系统仍然能够满足一致性和可用性
05. 向量钟是实现数据一致性的工具。使用向量钟可以捕获同一对象不同版本之间的因果关系，从而保证不同副本通过传递向量钟实现数据一致。向量钟是一个（节点，计数）的链表。计数器，初始为0，节点每次更新操作加1.
   Merkle树又称hash树，节点存储数据块的hash值，非叶节点存储对应子节点串联字符串的hash
06. nvm成本较dram低，功耗、散热要求低、掉电存储不丢失。两者结合可以既获得dram优越的访问性能，又减小dram介质易失性和存储密度低的缺点。
07. 内存计算是以将数据装入内存中处理，进行避免I/O操作的一种新型的以数据为中心的并行计算模式。内存计算相比较于传统方式减少了磁盘io，大幅度提高了数据吞吐量和数据处理速度
08. Dynamo系统使用一致性哈希算法将数据分布到多个存储节点中。使用虚拟哈希环，每个物理节点分配多个虚拟token，来实现均匀分配
09. 函数式编程：函数是一等公民。特点：函数可以单独存在，可以作为参数或者返回值，无副作用。
10. 引用透明性：程序可自由的将表达式替换为它的值而不改变程序
    高阶函数：函数可以不依赖任何其他对象而独立存在，可以作为参数传入另一个函数，可以作为函数返回值
    函数柯里化：把接受多个参数的函数变成接受单一参数的函数，并且返回接受余下参数并返回结果的新函数
    惰性求值：调用函数时，不是盲目地计算所有实参的值然后再进入函数体，而是先进入函数体，只有当需要实参值时才计算所需实参值。

11. MapReduce是抽象并行编程模型，定义了map和reduce两个抽象的编程接口，实现基本的并行计算任务。两个函数的输入、输出以及中间结果都是<key,value>键值对的形式。
12.  

```c
//Map
function map(){
    return list{tunks};
}
function reduce(){
    sort (tunk)
    return tunk[...100];
}
int main(){
    res=info;
    while(res.length!=100){
        tmp = map(res);
        for(i:tmp){
            reduce(i)
        }
    }
}

```

13. 流处理系统的语义保障按照每个元组被完全处理的次数分为：
    至多一次；系统保证在处理数据时，任意元组要么被刚好处理一次，要么被丢此，不会出现对同一元组的重复处理
    至少一次；指系统能够保证处理数据时，任意元组都至少被处理一次不能丢失，但是允许同一元组被重复处理
    恰好一次：指系统能够保障数据处理时，所有元组都恰好被处理一次，不存在元组被重复处理或者被丢弃的情况

14. Apache Storm是实时分布式流处理系统，从分布式系统或者分布式消息队列中获取源数据，并将元数据封装为元组，一条数据流就是一个无边界的tuple数据，这些tuple序列以分布式的方式创建和处理。Spark Streaming是spark api核心拓展，本质是典型的微处理系统，和以元组问单位进行流式处理不同，spark将无尽的数据流按时间切分成连续的小批次数据，然后用批处理方法处理，数据流按照时间片分隔开的离散流。

15.  
    以点为中心的编程模型：VC，pagerank，缺点是由于图内部结构依赖复杂，不易拓展，难以并行化，优点：点处理的并行度高，能容易的表示大部分图算法，缺点：存在对边的大量随机访存
    以边为中心的编程模型：EC，bfs，优点：可以表示多种图算法，对边的访问时顺序的。缺点：存在对点的大量随机访问，存在对边的冗余计算。顺序访存占比高，性能好
    以路径为中心的编程模型：与以边为中心的编程模型类似，采用顺序访存。包含分散（scatter）和整合（gather）操作。主节点通过迭代器对所有节点循环执行gather和scatter
    以子图为中心的编程模型：粗粒度的编程模型，局部收敛促进全局收敛，减少收敛次数

16.  

```c
class Edge:
    source:Vertex
    target:Vertex
    weight:float

class Vertex:
    id:int
    state:Any

class Graph:
    edges:List[Edge]
    vertex_states:Dict[int,Vertex]

function initialize(graph,source_id):
    for each vertex in graph.vertex_states:
        if vertex.id == source_id:
            vertex.state = 0
        else:
            vertex.state = infinity

function scatter(edges,vertex_states):
    messages=[]
    for each edge in edges:
        source_state = vertex_states[edge.souce].state
        if source_state != infinity:
            message = source_state + edge.weight
            messages.append((edge.target,message))
    return messages

function gather(messages,vertex_states):
    for each(terget,message) in messages:
        current_state = vertex_states[target].state
        if message<current_state
            vertex_state[target].state=message

function main_loop(graph,source_id,max_iterations):
    initialize(graph,source_id)
    for i in range(max_iterations):
        messages = scatter(graph.edges,graph.vertex_states)
        gather(messages,graph.vertex_states)
        if(convergence_reached(graph.vertex_states)):
            break
```

18.  
19. A-->B-->A-->B
20. 资源调度算法
    FIFO：根据任务到达顺序将任务送到线性队列里，按照先进先出的顺序依次分配。设置多个队列，优先级不相同。
    延迟调度算法：为了满足数据的局部性而采取的算法，因为分布式系统中计算和数据可能在不同地方，为了减小数据传输延迟，选择将计算移动到数据的位置
    主资源公平调度算法
    多资源打包调度算法
    无私的资源调度算法

21. 并行任务在分布式缓存系统中调度的基本原则时使用更好的任务执行计划，作业更快时间完成。
    存储优化解决小文件问题：
        HAR文件：在HDFS上构建分层文件系统，使用Hadoop archive命令构建，运行MapReduce作业，将要归档的文件打包成少量HDFS文件

        采用序列文件(SequenceFile)的格式：使用文件名作为Key，文件内容作为Value，将大量小文件存入序列文件，然后在序列文件上用流方式处理。
        将逻辑元数据管理负担部分转移到应用层
        相比于HAR，优点是降低了主控节点的计算负载，但小文件的逻辑存储层对于应用不透明。
