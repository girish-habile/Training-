import json
def getAllbookdetails():
    with open("bookdata.json") as f:
        data = json.load(f)
        print(data)
        
getAllbookdetails()
        
def getbook(bookId):
    with open("bookdata.json") as f:
        data = json.load(f)
        for book in data:
            if book["id"] == bookId:
                print(book)
                return 
        print("Check your Id : {} because there is no book with Id.".format(bookId))

getbook(10)


def createbook(newbook):
    with open("bookdata.json" , "r") as f:   
        data = json.load(f)
        list1 = newbook.keys()
        list2 = data[0].keys()
        if list1 != list2:
            print("You are not inserting correct format of data")
            return 
        
        
        for book in data:
            if book["id"] == newbook["id"]:
                print("you cannot add new book have the exisiting book with this id")
                return
            
        data.append(newbook)
    
    with open("bookdata.json", "w") as f:
        json.dump(data, f, indent=4)
        print("Data updated Succesfully")
        
        
        

newbook ={
            "id":9,
            "title":"Rethinking Productivity in Software Engineering",
            "subtitle":"",
            "author":"Caitlin Sadowski, Thomas Zimmermann",
            "published":"2019-05-11T00:00:00.000Z",
            "publisher":"Apress",
            "pages":310,
            "description":"Get the most out of this foundational reference and improve the productivity of your software teams. This open access book collects the wisdom of the 2017 \"Dagstuhl\" seminar on productivity in software engineering, a meeting of community leaders, who came together with the goal of rethinking traditional definitions and measures of productivity.",
            "website":"https://doi.org/10.1007/978-1-4842-4221-6"
        }








       
def deletebook(bookid):
    with open("bookdata.json") as f:
        data = json.load(f)
        
        removedbook ={}
        flag = 0
        for book in data:
            if book["id"] == bookid:
                removedbook =book
                flag = 1
        
        if flag == 1:
            data.remove(removedbook)
        else:
            print("This id is not in book data")
            
            
    with open("bookdata.json", "w") as f:
        json.dump(data, f, indent=4)
        print("Data updated Succesfully")
        
deletebook(8)
        



def editbook(id , updatedData):
    with open("bookdata.json") as f:
        data = json.load(f)
        updatedbook ={}
        flag = 0
        for book in data:
            if book["id"] == id:
                flag =1
                updatedbook = book
        data.remove(updatedbook)       
        if flag == 0:
            print("This id is not exist in book data")
        else:
            for key , value in updatedbook.items():
                if key in data[0].keys():
                    updatedbook[key] = value
                else:
                    print("You are updaating incorrect format of data")
                    return          
        data.append(updatedbook)
    with open("bookdata.json", "w") as f:
        json.dump(data, f, indent=4)
        print("your data is updated sucessfuly for id: {}".format(id))
        
dict ={"author":"Caitlin Sadowski, Thomas Zimmermann",
            "published":"2019-05-11T00:00:00.000Z",
            "publisher":"Apress",}
editbook(4 ,dict)
    


