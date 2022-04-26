-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int NOT NULL,
  `blogname` varchar(25) CHARACTER SET utf8 NOT NULL,
  `blogtext` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `types` varchar(25) CHARACTER SET utf8 NOT NULL,
  `time` date NOT NULL,
  `likes` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'javascript数据类型','JavaScript中有八种数据类型，包括五种基本数据类型（Number，String，Boolean，Null，undefined），和一种复杂数据类型（Object），以及ES6新增基本数据类型（Symbol，Bigint）。 ES6新增 Symbol ，代表创建后独一无二且不可变的数据类型，它主要是为了解决可能出现的全局变量冲突的问题。 ES10新增 Bigint，是一种数字类型的数据，它可以表示任意精度格式的整数，使用 BigInt 可以安全地存储和操作大整数，即使这个数已经超出了 Number 能够表示的安全整数范围。','2','2022-01-25',102),(2,'javascript作用域','通常来说，一段程序代码中所用到的名字并不总是有效和可用的，而限定这个名字的可用性代码范围就是这个名字的作用域，作用域的使用提高了程序逻辑的局限性，增强了程序的可靠性，减少了名字冲突。 JavaScript 有两种作用域：全局作用域和局部作用域。在函数定义之外声明的变量是全局变量，它的值可在整个程序中访问和修改。在函数定义内声明的变量是局部变量。每当执行函数时，都会创建和销毁该变量，且无法通过函数之外的任何代码访问该变量。','2','2022-01-28',199),(3,'this的指向问题','this 总是指向调用该函数的对象。','2','2022-01-28',250),(4,'let和const','ES6 的 let 和 const 实现了块级所用域的变量声明方式，使用 let 和 const 声明变量能有效避免由于变量提升导致的变量污染的问题。因为用 let 和 const 声明的变量作用域是代码块，这个设计比较符合大多数人的思维方式。并且严格来说， const 声明了一个指向变量的指针，并不是说 const 声明的变量不可改变， 而是该指针指向的地址不可改变。','2','2022-01-28',301),(5,'实现单行和多行文本内容溢出时隐藏','单行文本溢出时使用这三句代码：overflow: hidden; white-space: nowrap; text-overflow:ellipsis;而多行文本内容溢出时可以使用这四行代码：display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 4;overflow: hidden;','1,3','2022-02-12',0),(6,'vue中动态添加css属性','vue中可以通过 :class=\"\"这样来根据一定的条件来动态添加class','1,2,3,5','2022-02-08',1),(7,'如何使button的内容居中','可以使用line-height这一个属性在浏览器的网页开发者工具中调试使其内容得以居中显示。','1,2','2022-02-08',0),(8,'css样式优先级','优先级关系：内联样式 > ID 选择器 > 类选择器 = 属性选择器 = 伪类选择器 > 标签选择器 = 伪元素选择器','3','2022-02-14',0),(9,'vuex','在组件中使用dispatch来调用actions中的函数，在actions中使用commit来调用mutations中的函数，最后在mutations中对state中的数据进行修改，然后相关页面进行重新的render。','5','2022-02-14',0),(10,'webStorage','SessionStorage存储的内容会随着浏览器窗口关闭而消失；LocalStorage存储的内容，需要手动清除才会消失。以及都有的相关的API：getItem()、setItem()、removeItem()、clear()。','1,5','2022-02-14',0),(11,'vue中的全局事件总线','在new Vue()时在beforeCreate()钩子中使用Vue.prototype.$bus = this //安装全局事件总线，$bus就是当前应用的vm；使用时在需要接收数据的组件中使用this.$bus.$on(\'xxx\', 绑定的回调触发函数)，在发送数据的组件中使用this.$emit(\'xxx\', 发送的数据)来触发全局事件总线，最后最好在接受数据的组件的beforeDestroy()钩子中，用$off去解绑当前组件所用到全局事件总线的事件。','5','2022-02-14',0),(12,'vue中的nextTick','1. 语法：this.$nextTick(回调函数) 。2. 作用：在下一次 DOM 更新结束后执行其指定的回调。 3. 什么时候用：当改变数据后，要基于更新后的新DOM进行某些操作时，要在nextTick所指定的回调函数中执行。','5','2022-02-14',0),(13,'如何判断js中的数据的类型','typeof：可以判断undefined、数值、字符串、布尔值、function，但是不能判断null/object object/Array。instanceof：判断对象的具体类型。===：可以判断undefined、null。','2','2022-02-17',0),(14,'undefined和null的区别','undefined：定义了但是没有赋值。null：定义了并且赋值了，但是值为null。','2','2022-02-17',0),(15,'数据、变量和内存','数据：存储在内存中代表特定信息的01序列，特点是可传递，运算。变量：可以变化的量(变量名和变量值)，并且每一个变量都对应一小块内存空间，可以用变量名查找到对应的内存，变量值是内存存储的值。内存：内存条通电后产生的可以存储数据的临时空间，可分为栈(全局变量和局部变量)、堆(对象)。三者的关系：内存是存储数据的临时空间，变量是内存的标识。','2','2022-02-17',0),(16,'原型链','当我们去访问一个对象的属性时：先在对象本身的属性上找，没找到就(沿着隐式原型链)去对象的__proto__身上找(找到Object原型对象的__proto__)，没找到就返回undefined。','2','2022-02-17',0),(17,'原型链中的一些注意点','(1)Object的显式原型指向的对象不是空Object对象。(2)所有函数(包括Function自身)都是Function的实例。(3)Object的原型对象是原型链的尽头。','2','2022-02-17',0),(18,'变量提升与函数提升','变量提升：通过var定义的变量在定义语句之前就可以访问到(但是一般是undefined)。函数提升：通过function声明的函数在之前就可以直接调用。','2','2022-02-17',0),(19,'执行上下文','(1)代码分类：全局代码，函数(局部)代码。(2)全局执行上下文：执行全局代码之前将window确定为全局执行上下文=》全局数据预处理(var定义的全局变量=undefined，function声明的全局函数赋值(fun),并添加到window)=》this 赋值 window=》开始执行全局代码。(3)函数执行上下文：在调用函数准备执行函数体之前创建对应的函数执行上下文对象=》局部数据预处理(形参变量赋值，arguments赋值，var定义的局部变量赋值undefined，function声明的函数赋值fun，this赋值为调用函数的对象)=》开始执行函数体代码。','2','2022-02-17',0),(20,'执行上下文栈','(1)在全局代码执行前，JS引擎会创建一个栈来存储管理所有的执行上下文对象。(2)在全局执行上下文(window)确定后将其添加到栈中(压栈)。(3)在函数执行上下文创建后，将其添加到栈中(压栈)。(4)当前函数执行完毕后将栈顶的对象移除(出栈)。(5)在所有代码执行完毕后，栈中只剩下window。','2','2022-02-17',0),(21,'作用域和作用域链','(1)是静态的，在函数定义时就存在了。(2)分类：全局作用域、函数作用域。(3)作用：隔离变量，即不同作用域下的同名变量不会发生冲突。(4)作用域链：函数自己作用域没有的变量会往外部去找。','2','2022-02-17',0),(22,'闭包','(1)产生：当一个嵌套的内部函数引用了嵌套的外部函数的变量时，就产生了闭包。(2)用法：将函数作为另外一个函数的返回值；将函数作为一个实参传递给另外一个函数。(3)作用：使用函数外部的变量在函数执行完后仍然存活在内存中；让函数外部可以操作函数内部的数据。','2','2022-02-17',0),(23,'内存泄露和内存溢出的区别','(1)内存溢出：程序运行需要的内存超过剩余的内存时，出现的错误。(2)内存泄露：占用的内存没有及时释放，而内存泄露积累多了就会造成内存溢出。','2','2022-02-17',0),(24,'闭包的缺点和解决','(1)缺点：局部变量没有释放，内存可能泄露。 (2)解决：要不不用闭包，用闭包就记得及时释放局部变量。','2','2022-02-17',1),(25,'flex居中','当你在父盒子中使用 flex-direction: column; 让子元素 竖着排列时 这个时候想水平居中就是用 这个 align-items:center; 。垂直（纵向）居中就是用justify-content: center; 当父盒子 flex-direction: row;（默认的）则反之。 使用这两个属性还有一个前提那就是父盒子的宽度和高度得有，这个时候或许有人会有疑惑，我以前没指定过为什么也能用，原因是子盒子指定了把父盒子的给撑开了，但是如果是垂直方向上可能就会有问题，比如你想让一个盒子在一个页面的正中间，这个时候你就需要把父盒子的高度设为100%才可以。','3','2022-02-28',0),(26,'vue响应式','当一个 Vue 实例被创建时，它将 data 对象中的所有的 property 加入到 Vue 的响应式系统中。当这些 property 的值发生改变时，视图将会产生“响应”，即匹配更新为新的值。当这些数据改变时，视图会进行重渲染。值得注意的是只有当实例被创建时就已经存在于 data 中的 property 才是响应式的。如果你知道你会在晚些时候需要一个 property，但是一开始它为空或不存在，那么你仅需要设置一些初始值。','5','2022-02-28',0),(27,'inline-block布局存在的间隙问题','解决办法1：设置父元素container的字体大小为0，即font-size: 0，然后设置子元素 div1、div2的字体font-size: 12px。  办法2：在写法上，去掉div1和div2之间的换行。','1,3','2022-03-07',0),(28,'盒子实现透明状态','方式一：opacity: 0.4。优点是方便。缺点是：里面的内容也会半透明。  方式二：css3的技术来解决半透明。如下：  background: rgba(0,0,0,0.3);  background: rgba(0,0,0,.3)。','1,3','2022-03-07',0),(29,'超链接<a>的href跳转','href=\"\"//刷新页面；href=\"#\"//跳转到当前页面的顶部（不会刷新）；href=\"javascript:void(0)\"// 什么都不做；href=\"javascript:;\"// 什么都不做。','1','2022-03-07',0),(30,'meta viewport 是做什么用的，怎么写？','<meta name=\"viewport\" content=\"width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0\">：控制页面在移动端不要缩小显示。','1','2022-03-07',0),(31,'伪类和伪元素的区别是什么？','概念上的区别：伪类表示一种状态  伪元素是真的有元素。比如 ::after 是真的有元素，可以在页面上显示内容。使用上的区别：伪类：使用单冒号；伪元素：使用双冒号。','1,3','2022-03-07',0);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `bid` int NOT NULL,
  `ctext` tinytext NOT NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`cid`,`bid`),
  KEY `bid_idx` (`bid`),
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'我觉得写的很不错！赞！','2022-01-25'),(2,1,'哈哈，我也觉得不错！','2022-01-28'),(3,2,'不错，我也来点一个赞！','2022-01-28'),(4,3,'跟我想的差不多。','2022-01-28'),(5,4,'写的很不错，赞一个！','2022-01-28'),(8,1,'不错，解决了我的很多的不理解的地方，点赞！','2022-01-29'),(9,2,'不错，为博主点个赞！','2022-01-29'),(10,2,'能够解决问题，点个赞！','2022-01-29'),(12,3,'写的很好，点个赞！','2022-02-06'),(13,3,'有用，笔个芯心。','2022-02-06'),(14,1,'有用的博客，笔芯。','2022-02-06'),(16,4,'好，有用的博客+1。','2022-02-10'),(18,24,'确实应该这样。','2022-02-17');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typename` char(25) NOT NULL,
  `typeheat` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'html5',100),(2,'javascript',200),(3,'css',300),(4,'node.js',400),(5,'vue',500),(6,'react',600),(7,'mysql',700),(8,'mongodb',800),(9,'java',900),(10,'springboot',1000),(11,'python',1100),(12,'postman',1200),(15,'vs code',0),(16,'axios',0),(18,'test',0);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'blog'
--

--
-- Dumping routines for database 'blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-14 15:49:01
