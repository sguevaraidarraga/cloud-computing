CREATE TABLE IF NOT EXISTS academia.teachers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL
);

ALTER TABLE academia.courses ADD COLUMN IF NOT EXISTS teacher_id INTEGER REFERENCES academia.teachers(id);

CREATE TABLE IF NOT EXISTS academia.enrollments (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES academia.students(id),
    course_id INTEGER NOT NULL REFERENCES academia.courses(id),
    enrolled_at DATE DEFAULT CURRENT_DATE,
    UNIQUE (student_id, course_id)
);

INSERT INTO academia.teachers (name, email) VALUES
('Carlos Ruiz', 'carlos@example.com'),
('Sofia Mejia', 'sofia@example.com');

UPDATE academia.courses SET teacher_id = 1 WHERE name = 'Cloud Computing';
UPDATE academia.courses SET teacher_id = 2 WHERE name = 'Internet of Things';

INSERT INTO academia.enrollments (student_id, course_id) VALUES
(1, 1), (1, 2), (2, 1), (3, 2);
