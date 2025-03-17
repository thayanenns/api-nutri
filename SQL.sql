use nutri;
CREATE TABLE Nutricionista (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR (150) UNIQUE NOT NULL,
    senha VARCHAR(150) NOT NULL
);

CREATE TABLE Paciente (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_nutricionista INT NOT NULL,
    nome VARCHAR (150) NOT NULL, 
    idade INT NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    altura DECIMAL(5,2) NOT NULL,
    nivel_atividade ENUM('Sedentário', 'Leve', 'Moderado', 'Ativo', 'Muito Ativo') NOT NULL, 
    FOREIGN KEY (id_nutricionista) REFERENCES nutricionista(id) ON DELETE CASCADE
);

CREATE TABLE Anamnese (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT UNIQUE NOT NULL,
    historico_medico TEXT, 
    preferencias_alimentares TEXT,
    restricoes_alergias TEXT,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id) ON DELETE CASCADE
);

CREATE TABLE Avaliacao_Fisica(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    data_avaliacao DATE NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    altura DECIMAL(5,2) NOT NULL,
    imc DECIMAL(5,2) GENERATED ALWAYS AS (Peso / (Altura * Altura)) STORED,
    circunferencia_abdominal DECIMAL(5,2),
    circunferencia_cintura DECIMAL(5,2),
    circunferencia_quadril DECIMAL(5,2),
    gastoEB DECIMAL(6,2), 
    gastoET DECIMAL(6,2), 
    fator_Atividade DECIMAL(3,2),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id) ON DELETE CASCADE
);

CREATE TABLE Dieta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    data_prescricao DATE NOT NULL,
    calorias_totais DECIMAL(6,2) NOT NULL,
    proteinas DECIMAL(5,2),
    carboidratos DECIMAL(5,2),
    gorduras DECIMAL(5,2),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id) ON DELETE CASCADE
);

CREATE TABLE Alimentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    calorias DECIMAL(5,2) NOT NULL,
    proteinas DECIMAL(5,2),
    carboidratos DECIMAL(5,2),
    gorduras DECIMAL(5,2)
);

CREATE TABLE Dieta_Alimentos (
    id_dieta INT,
    id_alimento INT,
    quantidade DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id_dieta, id_alimento),
    FOREIGN KEY (id_dieta) REFERENCES Dieta(id) ON DELETE CASCADE,
    FOREIGN KEY (id_alimento) REFERENCES Alimentos(id) ON DELETE CASCADE
);