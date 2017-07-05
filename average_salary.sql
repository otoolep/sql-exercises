PRAGMA foreign_keys=ON;

CREATE TABLE companies (
    id INTEGER NOT NULL PRIMARY KEY,
    name TEXT
);
CREATE TABLE departments (
    id INTEGER NOT NULL PRIMARY KEY,
    name TEXT,
    company_id INTEGER,
    FOREIGN KEY(company_id) REFERENCES companies(id)
);
CREATE TABLE staff (
    id INTEGER NOT NULL PRIMARY KEY,
    name TEXT,
    salary INTEGER,
    department_id INTEGER,
    FOREIGN KEY(department_id) REFERENCES departments(id)
);

INSERT INTO companies(name) VALUES("Percolate");
INSERT INTO companies(name) VALUES("InfluxData");
INSERT INTO companies(name) VALUES("Jut");
INSERT INTO companies(name) VALUES("Loggly");
INSERT INTO companies(name) VALUES("Riverbed");
INSERT INTO companies(name) VALUES("TiVo");

INSERT INTO departments(name, company_id) VALUES("Engineering", 1);
INSERT INTO departments(name, company_id) VALUES("Engineering", 2);
INSERT INTO departments(name, company_id) VALUES("Engineering", 3);
INSERT INTO departments(name, company_id) VALUES("Engineering", 4);
INSERT INTO departments(name, company_id) VALUES("Engineering", 5);
INSERT INTO departments(name, company_id) VALUES("Engineering", 6);
INSERT INTO departments(name, company_id) VALUES("Sales", 1);
INSERT INTO departments(name, company_id) VALUES("Sales", 2);
INSERT INTO departments(name, company_id) VALUES("Sales", 3);
INSERT INTO departments(name, company_id) VALUES("Sales", 4);
INSERT INTO departments(name, company_id) VALUES("Sales", 5);
INSERT INTO departments(name, company_id) VALUES("Sales", 6);

INSERT INTO staff(name, salary, department_id) VALUES("Adam", 100000, 1);
INSERT INTO staff(name, salary, department_id) VALUES("Bob", 150000, 1);
INSERT INTO staff(name, salary, department_id) VALUES("Carl", 150000, 1);

INSERT INTO staff(name, salary, department_id) VALUES("Dick", 200000, 2);
INSERT INTO staff(name, salary, department_id) VALUES("Eric", 300000, 2);
INSERT INTO staff(name, salary, department_id) VALUES("Frank", 50000, 2);
INSERT INTO staff(name, salary, department_id) VALUES("Garry", 60000, 2);

INSERT INTO staff(name, salary, department_id) VALUES("Henry", 40000, 7);
INSERT INTO staff(name, salary, department_id) VALUES("Ivan", 60000, 7);

SELECT avg(salary),departments.name FROM staff JOIN departments ON department_id=departments.id GROUP BY departments.name;

SELECT avg(salary),departments.id,departments.name FROM staff JOIN departments ON department_id=departments.id GROUP BY departments.id;

SELECT salary,staff.name,departments.name,departments.id,departments.company_id FROM staff JOIN departments ON department_id=departments.id JOIN companies ON departments.company_id=companies.id;

SELECT avg(salary),companies.name FROM staff JOIN departments ON department_id=departments.id JOIN companies ON departments.company_id=companies.id GROUP BY companies.name;

SELECT avg(salary),companies.name FROM staff JOIN departments ON department_id=departments.id JOIN companies ON departments.company_id=companies.id GROUP BY companies.name ORDER BY avg(salary) DESC;
