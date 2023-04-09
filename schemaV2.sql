CREATE TABLE artists (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE genres (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE songs (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  duration INT NOT NULL,
  explicit BOOLEAN NOT NULL,
  cloud_link VARCHAR(255) NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  account_type VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE favorites (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (song_id) REFERENCES songs(id)
);

CREATE TABLE playlists (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE playlist_songs (
  id INT NOT NULL AUTO_INCREMENT,
  playlist_id INT NOT NULL,
  song_id INT NOT NULL,
  order INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (playlist_id) REFERENCES playlists(id),
  FOREIGN KEY (song_id) REFERENCES songs(id)
);
