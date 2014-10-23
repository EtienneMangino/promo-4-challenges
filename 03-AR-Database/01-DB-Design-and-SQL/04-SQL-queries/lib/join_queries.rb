require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  tab = db.execute("SELECT t.name, al.title, ar.name FROM tracks t
    JOIN albums al ON (t.album_id = al.id)
    JOIN artists ar ON (al.artist_id = ar.id);")
  tab.map!(&:flatten)
end

def stats_on(db, genre_name)
  hash = {}
  query = "SELECT COUNT(t.name), ROUND(AVG(t.milliseconds/60000.0),2) FROM tracks t
  JOIN genres ge ON (t.genre_id = ge.id)
  WHERE ge.name = '#{genre_name}';"

  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  db.execute(query) do |x|
    hash[:category] = genre_name
    hash[:number_of_songs] = x[0]
    hash[:avg_length] = x[1]
  end
  hash
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 rock artists
  query = "SELECT ar.name, COUNT(t.name) FROM tracks t
  JOIN genres ge ON (t.genre_id = ge.id)
  JOIN albums al ON (t.album_id = al.id)
  JOIN artists ar ON (al.artist_id = ar.id)
  WHERE ge.name = '#{genre_name}'
  GROUP BY ar.name;"

  tab = db.execute(query)
  tab = tab.sort_by { |x| x[1] }
  tab.reverse[0..4]
end

DATABASE_PATH = File.join(File.dirname(__FILE__), '../lib/db/jukebox.sqlite')

db = SQLite3::Database.new(DATABASE_PATH)

top_five_artists(db, "Rock")