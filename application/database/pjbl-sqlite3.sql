PRAGMA foreign_keys = ON;

CREATE TABLE admin (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    fullname TEXT NOT NULL
);

CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    fullname TEXT NOT NULL
);

CREATE TABLE projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    "desc" TEXT NOT NULL,
    deadline TEXT NOT NULL,
    pretest BLOB NOT NULL,
    teacher_id INTEGER NOT NULL,
    completed INTEGER DEFAULT 0,
    FOREIGN KEY (teacher_id)
        REFERENCES teachers(id)
        ON DELETE CASCADE
);

CREATE TABLE student_groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    fullname TEXT NOT NULL,
    member TEXT NOT NULL,
    project_id INTEGER NOT NULL,
    pretest_work BLOB,
    FOREIGN KEY (project_id)
        REFERENCES projects(id)
        ON DELETE CASCADE
);

CREATE TABLE phases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    "desc" TEXT NOT NULL,
    deadline TEXT NOT NULL,
    file BLOB NOT NULL,
    project_id INTEGER NOT NULL,
    prev_phase INTEGER,
    next_phase INTEGER,
    FOREIGN KEY(project_id)
        REFERENCES projects(id)
        ON DELETE CASCADE,
    FOREIGN KEY(prev_phase)
        REFERENCES phases(id)
        ON DELETE SET NULL,
    FOREIGN KEY(next_phase)
        REFERENCES phases(id)
        ON DELETE SET NULL
);

CREATE TABLE answers (
    idA INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    phase_id INTEGER NOT NULL,
    fileA BLOB NOT NULL,
    passed INTEGER NOT NULL DEFAULT 0,
    point INTEGER DEFAULT 0,
    comment TEXT,
    FOREIGN KEY(student_id)
        REFERENCES student_groups(id)
        ON DELETE CASCADE,
    FOREIGN KEY(phase_id)
        REFERENCES phases(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_answers_student ON answers(student_id);
CREATE INDEX idx_answers_phase ON answers(phase_id);
CREATE INDEX idx_projects_teacher ON projects(teacher_id);
CREATE INDEX idx_student_project ON student_groups(project_id);
CREATE INDEX idx_phase_project ON phases(project_id);
CREATE INDEX idx_phase_prev ON phases(prev_phase);
CREATE INDEX idx_phase_next ON phases(next_phase);