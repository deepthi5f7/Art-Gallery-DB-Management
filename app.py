from flask import Flask, render_template, request, redirect
import MySQLdb

app = Flask(__name__)

db = MySQLdb.connect(
    host="localhost",
    user="root",
    passwd="1405",
    db="art_gallery_db"
)

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/artists')
def artists():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM artists")
    data = cursor.fetchall()
    return render_template("artists.html", artists=data)

@app.route('/add_artist', methods=['GET','POST'])
def add_artist():
    if request.method == 'POST':
        name = request.form['name']
        birthplace = request.form['birthplace']
        age = request.form['age']
        style = request.form['style']
        cursor = db.cursor()
        cursor.execute("INSERT INTO artists(name,birthplace,age,style) VALUES(%s,%s,%s,%s)",
                       (name,birthplace,age,style))
        db.commit()
        return redirect('/artists')
    return render_template("add_artist.html")

@app.route('/artworks')
def artworks():
    cursor = db.cursor()
    cursor.execute("""
        SELECT artworks.id, artworks.title, artworks.category, artworks.price, artists.name
        FROM artworks
        JOIN artists ON artworks.artist_id = artists.id
    """)
    data = cursor.fetchall()
    return render_template("artworks.html", artworks=data)

@app.route('/add_artwork', methods=['GET','POST'])
def add_artwork():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM artists")
    artists = cursor.fetchall()

    if request.method == 'POST':
        title = request.form['title']
        year = request.form['year']
        category = request.form['category']
        price = request.form['price']
        artist_id = request.form['artist_id']

        cursor.execute("""
            INSERT INTO artworks(title,year_created,category,price,artist_id)
            VALUES(%s,%s,%s,%s,%s)
        """, (title,year,category,price,artist_id))
        db.commit()
        return redirect('/artworks')

    return render_template("add_artwork.html", artists=artists)

@app.route('/report')
def report():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM artwork_report")
    data = cursor.fetchall()
    return render_template("artworks.html", artworks=data)

if __name__ == '__main__':
    app.run(debug=True)