# 如何使用属性搜索功能

### 一.数值类属性查找
打开储存管理器，在搜索栏处输入数值条件即可，格式如下：
<center><img src=".res/example.png"/></center>

符号处使用 `> < = >= <=` 均可。

下面罗列几个常用的数值属性查找

- `[stack>n]` 查找堆叠数大于n的物品
- `[damage>n]` 查找伤害大于n的物品，不会查找到无伤害的物品，也可用于搜索武器
- `[value>n]` 查找价值大于n的物品，价值以铜币计算
- `[crit>n]` 查找暴击大于n%的物品，注：基础暴击为4%，即搜索`[crit>0]`的结果为暴击率>4%的物品
- `[healLife>n]` 查找恢复生命值大于n的物品，也可用于查找有回血效果的物品
- `[healMana>n]` 查找恢复魔力值大于n的物品，也可用于查找有回蓝效果的物品
- `[pick>n]` 查找镐力大于n的物品
- `[axe>n]` 查找斧力大于n的物品
- `[hammer>n]` 查找锤力大于n的物品

### 二.是非类属性查找
与上一个相同，只不过语法有些许不同

- `[melee]` 查找近战武器
- `[magic]` 查找魔法武器
- `[ranged]` 查找远程武器
- `[summon]` 查找召唤武器
- `[material]` 查找能当作材料的物品
- `[accessory]` 查找所有饰品
- `[consumable]` 查找所有消耗品、可放置物品

如果你想搜索不是近战/不是魔法...的物品，可以使用以下语法

- `[melee=0]` 查找不是近战武器的所有物品

其余是非类属性都可以使用如上的`[x=0]`语法

### 三.进阶使用

这些属性可以共同使用，但中间要加入空格，如：

- `[melee] [accessory]` 或 `[accessory] [damage>0]` 均可搜索到克苏鲁之盾

同样的，这些属性查找可以与名称查找共同使用，中间也要加入空格：

- `[melee] 铜` 查找所有近战且名字中带有铜字的武器

### 四.更多使用

实际上本功能基于C#的反射功能制作，理论上只要你在文档里可以查到的Item类的int，bool类型属性均可用于查找。更多使用方法期待玩家自行探索。