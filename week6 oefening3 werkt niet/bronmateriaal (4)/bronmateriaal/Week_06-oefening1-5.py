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
    html += "<table><tr><td>Naam</td><td>Groep</td></tr><tr><td>Ayron Vanhee</td><td>1NMCT3/5</td></tr></table>"
    html += footer()
    return html

@app.route('/showinfo/<naam>/<groep>')
def show_info(naam,groep):
    if groep.upper() == "1NMCT1":
        from flask import redirect
        return redirect("/error")
    else:
        html = header("Oefening1")
        html += "<h1>NMCT</h1>"
        html += "<table><tr><td>Naam</td><td>Groep</td></tr><tr><td>"+naam+"</td><td>"+groep+"</td></tr></table>"
        html += footer()
        return html

#ERROR
@app.route('/error')
def error():
    html = header("Error")
    html += "<h1>Error</h1>"
    html += footer()
    return html, 501

# oefening 3
def leesscores():
    import os
    bestandsnaam= os.path.dirname(os.path.abspath(__file__)) + "/Scores.txt"
    list_scores = []
    try:
        fp = open(bestandsnaam,'r')

    except FileNotFoundError:
        print("File not found!")
        return False

    lijn= fp.readline()

    while lijn !="":
        list_lijn = lijn.split(":")
        list_scores.append(list_lijn)
        lijn= fp.readline()

    fp.close()
    return list_scores

#def toonscores():
    #   scores= leesscores()

    #    html = header("Oefening 3")
    #    if scores:
    ##        html += '<table>'
    #        html +=  '<tr><th>Student</th>'

    #       for i in range(len(scores[0]) - 1):
#      html += '<th>Module' + str

@app.route("/priemgetallen/<mini>/<maxi>")
def priemgetallen(mini,maxi):
    mini = str(mini)
    maxi = str(maxi)
    if mini>maxi:
        mini, maxi = maxi, mini

    html = header("Priemgetallen")
    html += '<ul>'
    for num in range(mini, maxi):
        if num>1:
            for i in range(2, num):
                if num % i == 0:
                    break
            else:
                html += '<li>' + str(num) +'</li>'

    html += '</ul>'
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
    html += '<h1>Calendar' + datum.strftime("%B") +" " + datum.strftime("%Y")  +"</h1>"
    html += "<table><tr><td>Monday</td><td>Tuesday</td><td>Wednesday</td><td>Thursday</td><td>Friday</td><td>Saturday</td><td>Sunday</td></tr>"

    import calendar
    cal = calendar.Calendar()
    calmonth= cal.monthdatescalendar(jaar,maand)

    for week in calmonth:
        html += '<tr>'
        for day in week:
            html += '</td>'
            if day.month == maand:
                html += str(day.day)
                if day.day == dag:
                    html += '<div class="today">' + str(day.day) + '</div>'
                else:
                    html += str(day.day)

           # html +='</td>'

         #html += '</tr>'

    html += str(cal)
    html += '</table>'
    html += footer()
    return html

# start de Flask server met debug
if __name__ == '__main__':
    app.run(debug=True)
