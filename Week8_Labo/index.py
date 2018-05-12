from flask import Flask, render_template, request, make_response
from flaskext.mysql import MySQL


app = Flask(__name__)

mysql = MySQL(app)

#gegevens ingeven voor database
app.config["MYSQL_DATABASE_HOST"] = "localhost"
app.config["MYSQL_DATABASE_DB"] = "db"
app.config["MYSQL_DATABASE_USER"] = "root"
app.config["MYSQL_DATABASE_PASSWORD"] = "1234"

def get_data(sql, params=None):
    conn =  mysql.connect()
    #soort winkelkar om gegevens uit te kiezen
    cursor = conn.cursor()

    try:
        cursor.execute(sql, params)
    except Exception as e:
        print(e)
        return False

    results = cursor.fetchall()
    db_data = []

    for row in results:
        #lijst wordt in een lijst gestopt, 1 row = 1 lijst
        db_data.append(list(row))

    #afsluiten connectie en winkelkar
    cursor.close()
    conn.close()

    return db_data

@app.route('/')
def header():
    return render_template("header.html")

@app.route('/data/<tabel>/')
def ttt(tabel):
    html = render_template("header.html")
    sql_title = "SHOW COLUMNS FROM "
    sql_title += tabel
    titles = get_data(sql_title)
    sql_list = "SELECT * FROM "
    sql_list += tabel
    list = get_data(sql_list)
    # strlist = str(get_data("SELECT * FROM " + tabel))
    # html += strlist
    return render_template("data.html", list = list, titles=titles, tabel = tabel)

if __name__ == "__main__":
    app.run(debug = True)
