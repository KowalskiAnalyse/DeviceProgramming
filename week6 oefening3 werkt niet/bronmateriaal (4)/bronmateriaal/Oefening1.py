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

# start de Flask server met debug
if __name__ == '__main__':
    app.run(debug=True)

