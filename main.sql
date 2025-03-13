CREATE DATABASE TXTARPG;
USE TXTARPG;

CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT NOT NULL
);

CREATE TABLE location_connections (
    location_id INT,
    connected_location_id INT,

    PRIMARY KEY (location_id, connected_location_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE CASCADE,
    FOREIGN KEY (connected_location_id) REFERENCES locations(location_id) ON DELETE CASCADE
);


CREATE TABLE location_monsters (
    location_id INT,
    monster_id INT,
    spawn_chance DECIMAL(5,2) NOT NULL, -- Example: 25.00 means 25% chance

    PRIMARY KEY (location_id, monster_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE CASCADE,
    FOREIGN KEY (monster_id) REFERENCES monsters(monster_id) ON DELETE CASCADE
);



CREATE TABLE monsters (
    monster_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    min_level INT NOT NULL,
    max_level INT NOT NULL,
    base_health INT NOT NULL,
    movement_points INT NOT NULL,
    brawniness INT NOT NULL,
    nimbility INT NOT NULL,
    mysticigence INT NOT NULL,
    enduritution INT NOT NULL
);


-- Create Locations
INSERT INTO locations (name, description) VALUES ('Town Square', 'The bustling heart of the town, full of shops and people.');
INSERT INTO locations (name, description) VALUES ('Forest', 'A dense, quiet forest filled with tall trees and wildlife.');
INSERT INTO locations (name, description) VALUES ('Mountain', 'A towering mountain range, with narrow trails and steep cliffs.');


-- Create Connections between locations
-- Town Square is connected to Forest and Mountain
INSERT INTO location_connections (location_id, connected_location_id) 
VALUES (1, 2), (1, 3);

-- Forest is connected to Town Square and Mountain
INSERT INTO location_connections (location_id, connected_location_id) 
VALUES (2, 1), (2, 3);

-- Mountain is connected to Town Square and Forest
INSERT INTO location_connections (location_id, connected_location_id) 
VALUES (3, 1), (3, 2);

-- Create Monsters
INSERT INTO monsters (name, base_health, min_level, max_level, movement_points, brawniness, nimbility, mysticigence, enduritution) 
VALUES ('Wolf', 30, 1, 5, 3, 6, 7, 2, 5);
INSERT INTO monsters (name, base_health, min_level, max_level, movement_points, brawniness, nimbility, mysticigence, enduritution) 
VALUES ('Goblin', 25, 1, 5, 2, 5, 6, 3, 4);

INSERT INTO location_monsters (location_id, monster_id, spawn_chance) 
VALUES 
    (1, 1, 50.00),  -- Wolf 50% chance in Town Square
    (1, 2, 50.00);  -- Goblin 50% chance in Town Square

-- Forest
INSERT INTO location_monsters (location_id, monster_id, spawn_chance) 
VALUES 
    (2, 1, 50.00),  -- Wolf 50% chance in Forest
    (2, 2, 50.00);  -- Goblin 50% chance in Forest

-- Mountain
INSERT INTO location_monsters (location_id, monster_id, spawn_chance) 
VALUES 
    (3, 1, 50.00),  -- Wolf 50% chance in Mountain
    (3, 2, 50.00);  -- Goblin 50% chance in Mountain

SELECT * FROM location_monsters;
SELECT * FROM monsters;
SELECT * FROM locations;
