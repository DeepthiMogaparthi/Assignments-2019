import xml.etree.ElementTree as et

def ParsingXMl(xml_file):
    tree = et.parse(xml_file)

    root = tree.getroot()

    print("**ROOT element**",root)

    for child in root:
        print child.tag,child.attrib
    
    
    for child in root:
        for element in child:
            print element.tag, " : ", element.text



#def main():
#loadXML()
    
xml_obj = ParsingXMl("emails.xml")

    
"""if __name__ == "__main__": 
  
    # calling main function 
    main()  """   
    
