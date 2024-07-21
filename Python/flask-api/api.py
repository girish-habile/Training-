from flask import Flask, jsonify, request , abort
import json

app = Flask(__name__)
@app.route('/')
def hello():
    return '<h1>Hello, World!</h1>'

def load_books():
    with open("bookdata.json" , 'r') as f:
        data = json.load(f)
        return data

def save_books(data):
     with open("bookdata.json" , 'w') as f:
        json.dump(data , f , indent = 4)
        
def findbook(bookId):
        for book in data:
            if book["id"] == bookId:
                return book
        return  None 
    
         
data = load_books()


@app.route('/books', methods=['GET'])
def get_books():
    return jsonify(data)


        
@app.route('/books/<int:book_id>' , methods =['GET'])
def get_book(book_id):
    book = findbook(book_id)
    if book is None:
        abort(404)
    return jsonify(book)


@app.route('/books/<int:book_id>', methods=['DELETE'])
def delete_book(book_id):
    global data  
    book = findbook(book_id)
    if book is None:
        abort(404)
    
    data.remove(book)
    save_books(data)
    return jsonify({'result': True})


@app.route('/books/<int:book_id>', methods=['PUT'])
def update_book(book_id):
    global data 
    book = findbook(book_id)
    
    if book is None:
        abort(404)
    
    book.update(request.json)
    save_books(data)
    return jsonify(book)

@app.route('/books' , methods =['POST'])
def create_book():
    global data
    
    new_book = request.json
    
    data.append(new_book)
    save_books()
    return jsonify(data)
    





if __name__ == '__main__':
    app.run(debug=True)