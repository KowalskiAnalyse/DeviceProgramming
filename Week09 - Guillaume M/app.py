from flask import Flask, render_template
from flaskext.mysql import MySQL
import os

app = Flask(__name__)
mysql = MySQL()
app = Flask(__name__)
app.config["MYSQL_DATABASE_HOST"] = "localhost"
app.config["MYSQL_DATABASE_DB"] = "webshop"
app.config["MYSQL_DATABASE_USER"] = "root"
app.config["MYSQL_DATABASE_PASSWORD"] = "1234"
mysql.init_app(app)


@app.route('/')
def index():
    return render_template("index.html")


@app.route('/producten/')
def producten():
    cursor = mysql.connect().cursor()
    cursor.execute("SELECT foto, naam from products;")
    data = cursor.fetchall()
    cursor.close()
    return render_template("products.html", Producten=data)


@app.route('/productdetail/<name>')
def productdetail(name):
    file = openFile()
    line = file.readline()
    product = []
    while len(line) > 0:
        if name in line:
            product = line.split(":")
        line = file.readline()
    file.close()
    return render_template("productOverview.html", Product=name, Content=product[1])


@app.route('/contact/')
def contact():
    return render_template("about.html")


def openFile():
    file = open("{0}/static/products.txt".format(os.path.dirname(os.path.abspath(__file__))), 'r')
    return file


if __name__ == '__main__':
    app.run()
