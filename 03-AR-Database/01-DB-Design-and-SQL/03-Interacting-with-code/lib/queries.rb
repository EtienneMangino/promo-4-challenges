require 'sqlite3'

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name

  tab = db.execute("SELECT COUNT(*) FROM #{table_name};")
  tab[0][0]
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  tab = db.execute("SELECT name FROM artists ORDER BY name ASC;")
  tab.map! { |x| x[0] }
end

def love_tracks(db)
  # TODO: return array of love songs
  tab = db.execute("SELECT name FROM tracks WHERE name LIKE \"%love%\";")
  tab.map! { |x| x[0] }
end

def long_tracks(db, min_length)
  # TODO: return tracks verifying: duration > min_length (minutes)
  tab = db.execute("SELECT name FROM tracks WHERE milliseconds/1000 > #{min_length * 60};")
  tab.map! { |x| x[0] }
end


DATABASE_PATH = File.join(File.dirname(__FILE__), '../lib/db/jukebox.sqlite')
db = SQLite3::Database.new(DATABASE_PATH)

number_of_rows(db, "albums")
sorted_artists(db)
love_tracks(db)