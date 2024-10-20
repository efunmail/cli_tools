'''
$$ FLASK_APP=hello.py flask run
'''

from flask import Flask, request

app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello!'


@app.route('/msg')
@app.route('/msg/<ver>')  # , defaults={'ver': '0.1'})
def msg(ver='0.1'):
    qry = request.query_string
    name = request.args.get('name')
    return f"(Version: {ver}) (Hello, {name}!) (Query String: {qry})"
