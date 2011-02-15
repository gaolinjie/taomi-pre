Markdown  
========  
本文档演示了采用Markdown语法编辑的文档示例在GitHub中的显示效果。  

###一、重点强调  
    *italic*   **bold**  
    _italic_   __bold__  
 
###二、链接  
#####1.内嵌 
    An [example](http://url.com/ "Title")  

#####2.参考风格的标签（标题可选）  
    An [example][id]. Then, anywhere
    else in the doc, define the link:
    
      [id]: http://example.com/  "Title"  
  
###三、图像  
#####1.内嵌（标题可选）  
    ![alt text](http://pr4t.openwebster.com/wp-content/uploads/2010/02/markdown.png "Title")  
 
#####2.参考风格  
    ![alt text][id]
    
    [id]: http://pr4t.openwebster.com/wp-content/uploads/2010/02/markdown.png "Title"  

###四、标题    
#####1.Setext风格  
  
    Header 1  
    ========  
    Header 2  
    --------    

#####2.atx风格（#可选）  

    # Header 1    
    ## Header 2    
    ###### Header 6    

###五、列表  
#####1.有序，无段  
    1.  Foo
    2.  Bar  
 
#####2.无序，有段  
    *   A list item.
    
        With multiple paragraphs.

    *   Bar  
  
#####3.你可以嵌套上述两种方式  
    *   Abacus
        * answer
    *   Bubbles
        1.  bunk
        2.  bupkis
            * BELITTLER
        3. burper
    *   Cunning  
 
###六、引用文字  
    > Email-style angle brackets
    > are used for blockquotes.

    > > And, they can be nested.

    > #### Headers in blockquotes
    > 
    > * You can quote a list.
    > * Etc.  
  
###七、代码  
    `<code>` spans are delimited
    by backticks.

    You can include literal backticks
    like `` `this` ``.  
 
###八、预格式化代码块  
缩进每一个代码行至少4个空格或1个tab。  
This is a normal paragraph.

    This is a preformatted
    code block.  
  
###九、水平线     
三个或更多的破折号或星号：

    --- 

    * * *

    - - - - 
 
###十、手动换行符  
在每行结尾键入2个或多个空格符：  
    Roses are red,     
    Violets are blue.  
