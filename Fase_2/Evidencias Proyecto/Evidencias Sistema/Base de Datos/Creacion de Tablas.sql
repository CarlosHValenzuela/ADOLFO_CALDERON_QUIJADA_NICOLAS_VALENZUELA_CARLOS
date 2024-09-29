CREATE TABLE PERSONA (
    id NUMBER PRIMARY KEY,
    rut VARCHAR2(12) UNIQUE NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    tipo VARCHAR2(20) CHECK (tipo IN ('visitante', 'residente')) NOT NULL
);

CREATE TABLE USUARIO (
    id NUMBER PRIMARY KEY,
    correo VARCHAR2(100) UNIQUE NOT NULL,
    contraseña VARCHAR2(100) NOT NULL,
    persona_id NUMBER UNIQUE,
    FOREIGN KEY (persona_id) REFERENCES PERSONA(id)
);

CREATE TABLE AUTO (
    id NUMBER PRIMARY KEY,
    patente VARCHAR2(10) UNIQUE NOT NULL,
    marca VARCHAR2(50) NOT NULL,
    dueño_id NUMBER,
    FOREIGN KEY (dueño_id) REFERENCES PERSONA(id)
);

CREATE TABLE REGISTRO (
    id NUMBER PRIMARY KEY,
    patente VARCHAR2(10) NOT NULL,
    dia DATE NOT NULL,
    hora TIMESTAMP NOT NULL,
    auto_id NUMBER,
    persona_id NUMBER,
    FOREIGN KEY (auto_id) REFERENCES AUTO(id),
    FOREIGN KEY (persona_id) REFERENCES PERSONA(id)
);