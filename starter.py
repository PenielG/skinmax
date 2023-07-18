'''This module will generate  a mini webserver'''
from skinapp import app




if __name__=="__main__":
    app.run(debug=True,port=8080)

