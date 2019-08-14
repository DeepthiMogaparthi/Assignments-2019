from xml.dom.minidom import parse
import xml.dom.minidom

d=xml.dom.minidom.parse("sample.xml")
catalog=d.documentElement
if catalog.hasAttribute("index"):
    print "root element : ",catalog.getAttribute("index")
    
book=catalog.getElementsByTagName("book")
for book in book:
    print "**BOOKS**"
    if book.hasAttribute("id"):
        print "ID : %s" % book.getAttribute("id")
               
        author = book.getElementsByTagName('author')[0]
        print "Author : %s" % author.childNodes[0].data
        
        title = book.getElementsByTagName('title')[0]
        print "Title : ",title.childNodes[0].data
        
        genre = book.getElementsByTagName('genre')[0]
        print "Genre : ",genre.childNodes[0].data
        
        price = book.getElementsByTagName('price')[0]
        print "Price : ",price.childNodes[0].data