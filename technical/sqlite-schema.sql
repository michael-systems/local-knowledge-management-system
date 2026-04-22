-- Local Knowledge Management System
-- Public-safe simplified schema overview

CREATE TABLE libraries (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    source_path TEXT NOT NULL,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL
);

CREATE TABLE themes (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL
);

CREATE TABLE tags (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    created_at TEXT NOT NULL
);

CREATE TABLE documents (
    id INTEGER PRIMARY KEY,
    library_id INTEGER NOT NULL,
    theme_id INTEGER,
    title TEXT NOT NULL,
    file_path TEXT NOT NULL,
    file_type TEXT NOT NULL,
    body TEXT,
    word_count INTEGER DEFAULT 0,
    is_favorite INTEGER DEFAULT 0,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (library_id) REFERENCES libraries(id),
    FOREIGN KEY (theme_id) REFERENCES themes(id)
);

CREATE TABLE notes (
    id INTEGER PRIMARY KEY,
    theme_id INTEGER,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    is_pinned INTEGER DEFAULT 0,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (theme_id) REFERENCES themes(id)
);

CREATE TABLE document_tags (
    document_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (document_id, tag_id),
    FOREIGN KEY (document_id) REFERENCES documents(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE note_tags (
    note_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (note_id, tag_id),
    FOREIGN KEY (note_id) REFERENCES notes(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE note_document_links (
    note_id INTEGER NOT NULL,
    document_id INTEGER NOT NULL,
    PRIMARY KEY (note_id, document_id),
    FOREIGN KEY (note_id) REFERENCES notes(id),
    FOREIGN KEY (document_id) REFERENCES documents(id)
);

CREATE TABLE tasks (
    id INTEGER PRIMARY KEY,
    note_id INTEGER,
    document_id INTEGER,
    title TEXT NOT NULL,
    priority TEXT NOT NULL DEFAULT 'normal',
    due_date TEXT,
    status TEXT NOT NULL DEFAULT 'todo',
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (note_id) REFERENCES notes(id),
    FOREIGN KEY (document_id) REFERENCES documents(id)
);

CREATE TABLE backups (
    id INTEGER PRIMARY KEY,
    file_name TEXT NOT NULL,
    file_path TEXT NOT NULL,
    file_size_kb INTEGER,
    status TEXT NOT NULL,
    created_at TEXT NOT NULL
);

CREATE INDEX idx_documents_library_id ON documents(library_id);
CREATE INDEX idx_documents_theme_id ON documents(theme_id);
CREATE INDEX idx_notes_theme_id ON notes(theme_id);
CREATE INDEX idx_tasks_status ON tasks(status);
CREATE INDEX idx_tasks_due_date ON tasks(due_date);
