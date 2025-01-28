CREATE TABLE games (
    id BIGINT,
    code TEXT,
    name TEXT NULL,
    description TEXT NULL,
    rules TEXT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id BIGINT,
    name TEXT NULL,
    email TEXT NULL UNIQUE,
    nick TEXT NULL,
    login TEXT NULL,
    password TEXT NULL,
    birthdate DATE,
    PRIMARY KEY (id)
);

CREATE TABLE avatars (
    id BIGINT,
    user_id BIGINT NOT NULL,
    game_id VARCHAR(255) NOT NULL,
    appearance TEXT NULL,
    level INT(4),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (game_id) REFERENCES games(id)
);

CREATE TABLE matches (
    id BIGINT,
    game_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    password TEXT NULL,
    created_at TIMESTAMP,
    status TEXT NOT NULL,
    creator_avatar_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (creator_avatar_id) REFERENCES avatars(id)
);

CREATE TABLE match_participants (
    match_id BIGINT,
    avatar_id BIGINT,
    PRIMARY KEY (match_id, avatar_id),
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (avatar_id) REFERENCES avatars(id)
);

CREATE TABLE confrontations (
    id BIGINT, 
    match_id BIGINT NOT NULL,
    avatar1_id BIGINT NOT NULL,
    avatar2_id BIGINT NOT NULL,
    result TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (avatar1_id) REFERENCES avatars(id),
    FOREIGN KEY (avatar2_id) REFERENCES avatars(id)
);
