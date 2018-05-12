# importeer de flask library
from flask import Flask

# Maak een applicatie-object aan
app = Flask(__name__)

#header en footer worden gedefinieert
def header(title):
    #met title variabele
    #return '<!doctype html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"><meta http-equiv="X-UA-Compatible" content="ie=edge"><title>'+ title +'</title><link rel="stylesheet" href="http://127.0.0.1:5000/static/css/style.css"/></head><body>'.format(title)

    #met {0}
    return '<!doctype html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"><meta http-equiv="X-UA-Compatible" content="ie=edge"><title>{0}</title><link rel="stylesheet" href="http://127.0.0.1:5000/static/css/style.css"/></head><body>'.format(title)
def footer():
    return '</body></html>'

# oefening 1
@app.route('/')
def index():
    html = header("Oefening1")
    html += "<h1>NMCT</h1>"
    html += "<table><tr><td>Naam</td><td>Groep</td></tr><tr><td>Ayron Vanhee</td><td>1NMCT3</td></tr></table>"
    html += footer()
    return html

@app.route("/toonkalendervandaag")
def toonkalendervandaag():
    import datetime
    return bouwkalender(datetime.date.today())

def bouwkalender(datum):
    jaar= datum.year
    maand = datum.month
    dag = datum.day

    html = header("Kalender")
    html += '<h1>'+ datum.strftime("%B") +"</h1>"
    html += "<table><tr><td>Monday</td><td>Tuesday</td><td>Wednesday</td><td>Thursday</td><td>Friday</td><td>Saturday</td><td>Sunday</td></tr>"

    import calendar
    cal = calendar.Calendar()
    calmonth= cal.monthdatescalendar(jaar,maand)

    for week in calmonth:
        html += '<tr>'
        for day in week:
            html += '<td>'
            if day.month == maand:
                if day.day == dag:
                    html += '<div class="today">' + str(day.day) + '</div>'
                    html += '</td>'
                else:
                    html += str(day.day)
                    html += '</td>'

        html += '</tr>'

    html += '</table>'
    html += footer()
    return html

@app.route("/toonKalender/<jaar>/<maand>/<dag>")
def toonkalender(jaar,maand,dag):
    import datetime
    jaar = int(jaar)
    maand = int(maand)
    dag = int(dag)
    return bouwkalender(datetime.date(jaar,maand,dag))


def bouwkalender(datum):
    jaar= datum.year
    maand = datum.month
    dag = datum.day

    html = header("Kalender")
    html += '<h1>'+ datum.strftime("%B") +"</h1>"
    html += "<table><tr><td>Monday</td><td>Tuesday</td><td>Wednesday</td><td>Thursday</td><td>Friday</td><td>Saturday</td><td>Sunday</td></tr>"

    import calendar
    cal = calendar.Calendar()
    calmonth= cal.monthdatescalendar(jaar,maand)

    for week in calmonth:
        html += '<tr>'
        for day in week:
            html += '<td>'
            if day.month == maand:
                if day.day == dag:
                    html += '<div class="today">' + str(day.day) + '</div>'
                    html += '</td>'
                else:
                    html += str(day.day)
                    html += '</td>'

        html += '</tr>'

    html += '</table>'
    html += footer()
    return html

# start de Flask server met debug
if __name__ == '__main__':
    app.run(debug=True)

