-- Tabela de Imagens
CREATE TABLE images (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  -- chave primária
    name TEXT,
    author TEXT,
    path TEXT,
    datetime TEXT
);

-- Tabela de Comentários
CREATE TABLE comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  -- chave primária
    idimg INTEGER,  -- chave estrangeira
    user TEXT,
    comment TEXT,
    datetime TEXT,
    FOREIGN KEY (idimg) REFERENCES images(id)
);

-- Tabela de Votos
CREATE TABLE votes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,  -- chave primária
    idimg INTEGER,  -- chave estrangeira
    ups INTEGER,
    downs INTEGER,
    FOREIGN KEY (idimg) REFERENCES images(id)
);
