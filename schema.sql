CREATE TABLE Song (
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  artist_id INT NOT NULL,
  duration INT NOT NULL,
  explicit BOOLEAN NOT NULL,
  link VARCHAR(255) NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

CREATE TABLE Artist (
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE Genre (
  genre_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE User (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  fname VARCHAR(50) NOT NULL,
  lname VARCHAR(50) NOT NULL,
  pass VARCHAR(255) NOT NULL
);

CREATE TABLE Playlist (
  playlist_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Song_Genre (
  song_id INT NOT NULL,
  genre_id INT NOT NULL,
  PRIMARY KEY (song_id, genre_id),
  FOREIGN KEY (song_id) REFERENCES Song(song_id),
  FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

CREATE TABLE Favorite (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (song_id) REFERENCES Song(song_id)
);

CREATE TABLE Playlist_Song (
  playlist_id INT NOT NULL,
  song_id INT NOT NULL,
  rank INT NOT NULL,
  PRIMARY KEY (playlist_id, song_id),
  FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
  FOREIGN KEY (song_id) REFERENCES Song(song_id)
);
