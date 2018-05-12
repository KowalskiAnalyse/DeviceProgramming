from flask import Flask, redirect, url_for, render_template, request
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL(app)

# MySQL configurations
app.config["MYSQL_DATABASE_HOST"] = "localhost"
app.config["MYSQL_DATABASE_DB"] = "test"
app.config["MYSQL_DATABASE_USER"] = "root"
app.config["MYSQL_DATABASE_PASSWORD"] = "1234"


def get_data(sql, params=None):
    conn = mysql.connect()
    cursor = conn.cursor()
    print("getting data")
    try:
        print(sql)
        cursor.execute(sql, params)
    except Exception as e:
        print(e)
        return False

    result = cursor.fetchall()
    data = []
    for row in result:
        data.append(list(row))
    cursor.close()
    conn.close()

    return data


def set_data(sql, params=None):
    conn = mysql.connect()
    cursor = conn.cursor()
    print("Setting Data")
    # try:
    print(sql)
    cursor.execute(sql, params)
    conn.commit()
    # except Exception as e:
    # print(e)
    # return False

    # result = cursor.fetchall()
    # data = []
    # for row in result:
    # data.append(list(row))
    data = "Done"
    cursor.close()
    conn.close()

    return data


@app.route("/")
def index():
    return render_template("template.html")

@app.route('/data/')
def data():
    title_list = get_data("SHOW COLUMNS FROM " + "data")
    data_list = get_data("SELECT * FROM " + "data")
    # strlist = str(get_data(list))
    return render_template("data.html", data_list=data_list, title_list=title_list)

#lijst in lijst -> lijst
def optimize_list(lijst):
    for item in lijst:
        new_lijst = []
        new_lijst.append(item[0])
    return new_lijst

def getLijstJaar(jaar):
    data = get_data(
        "SELECT CAST(sum(Aantal_werknemers) as UNSIGNED) FROM data where Jaar = %s group by Maand order by Maand asc;",
        (jaar,))
    result = []
    for d in data:
        result.append(d[0])
    return result

@app.route("/chart/")
def chart():
    data = []
    jaren = get_data("SELECT DISTINCT jaar FROM data")

    # signed met of zonder teken (+ of -)
    sql = "SELECT CAST(SUM(Aantal_werknemers) AS UNSIGNED) from data"
    sql += " WHERE jaar = %s GROUP BY maand ORDER BY maand ASC"
    for jaar in jaren:
        # stukje data
        data_part = optimize_list(get_data(sql, jaar))
        # 1 grote lijst, daarin 3 lijsten voor elk jaar met elk hun waarden in 12 waarden
        data.append(data_part)

    labels = optimize_list(get_data("SELECT DISTINCT maand FROM data"))
    titel = 'Aantal werknemers in faillisementen'
    colors = ['red', 'green', 'orange', 'pink', 'black']

    return render_template("chart.html", values=data, labels=jaren, legend=titel, jaren=jaren, colors=colors)

if __name__ == "__main__":
    app.run(debug=True)
