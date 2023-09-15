CREATE TABLE Pessoa (
  idPessoa INTEGER IDENTITY NOT NULL PRIMARY KEY,
  nome VARCHAR(255) NULL,
  logradouro VARCHAR(255) NULL,
  cidade VARCHAR(255) NULL,
  estado CHAR(2) NULL,
  telefone VARCHAR(11) NULL,
  email VARCHAR(255) NULL
);

CREATE TABLE Pessoafisica (
  idPessoaFisica INTEGER IDENTITY NOT NULL PRIMARY KEY,
  Pessoa_id_pessoa INTEGER NOT NULL CHECK (pessoa_id_pessoa > 0),
  cpf VARCHAR(20) NULL
);

CREATE TABLE PessoaJuridica (
  idPessoaJuridica INTEGER IDENTITY NOT NULL PRIMARY KEY,
  pessoa_id_pessoa INTEGER NOT NULL CHECK (pessoa_id_pessoa > 0),
  cnpj VARCHAR(20) NULL
);

CREATE TABLE Movimento (
  id_movimento INTEGER IDENTITY NOT NULL PRIMARY KEY,
  pessoa_id_pessoa INTEGER NOT NULL CHECK (pessoa_id_pessoa > 0),
  usuario_id_usuario INTEGER NOT NULL CHECK (usuario_id_usuario > 0),
  produto_id_produto INTEGER NOT NULL CHECK (produto_id_produto > 0),
  quantidade INTEGER NULL CHECK (quantidade > 0),
  tipo CHAR(1) NULL,
  valorUnitario NUMERIC(10, 2) NULL
);

CREATE TABLE Produto (
  idProduto INTEGER IDENTITY NOT NULL PRIMARY KEY,
  nome VARCHAR(255) NULL,
  quantidade INTEGER NULL CHECK (quantidade > 0),
  ValorVenda NUMERIC(10, 2) NULL
);

CREATE TABLE Usuario (
  idUsuario INTEGER IDENTITY NOT NULL PRIMARY KEY,
  login VARCHAR(20) NULL,
  senha VARCHAR(20) NULL
);

CREATE INDEX Pessafisica_FKIndex1 ON Pessoafisica(pessoa_id_pessoa);
CREATE INDEX PessoaJuridica_FKIndex1 ON PessoaJuridica(pessoa_id_pessoa);

CREATE INDEX Movimento_FKIndex1 ON Movimento(usuario_id_usuario);
CREATE INDEX Movimento_FKIndex2 ON Movimento(produto_id_produto);
CREATE INDEX Movimento_FKIndex3 ON Movimento(pessoa_id_pessoa);
