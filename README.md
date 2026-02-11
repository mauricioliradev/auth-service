# Auth Service (Microsserviço de Autenticação)

Responsável pelo gerenciamento de usuários e emissão de tokens JWT (JSON Web Tokens).

## 📋 Requisitos
* **Ruby:** 3.4.7
* **Rails:** 8.1+ (API Mode)
* **Banco de Dados:** PostgreSQL
* **Dependências:** `jwt`, `bcrypt`

## 🚀 Como Executar (Docker Compose)

Clonar este repositório na mesma pasta (desafio-contact2sale) que os outros serviços estão.

Este serviço faz parte da stack principal. Para rodar todo o ambiente:

```bash
# Na raiz do projeto webscraping-manager
sudo docker-compose up --build
```

O serviço estará disponível em: http://localhost:3001

## 🔌 Documentação da API

### 1. Registrar Usuário

Cria um novo usuário no sistema.

**Endpoint:** `POST /auth/register`

**Body (JSON):**
```json
{
  "email": "dev@teste.com",
  "password": "senha_segura"
}
```

**Exemplo cURL:**
```bash
curl -X POST http://localhost:3001/auth/register \
     -H "Content-Type: application/json" \
     -d '{"email": "dev@teste.com", "password": "senha123"}'
```

### 2. Login (Autenticação)

Retorna o Token JWT necessário para sessões.

**Endpoint:** `POST /auth/login`

**Body (JSON):**
```json
{
  "email": "dev@teste.com",
  "password": "senha_segura"
}
```

**Response (200 OK):**
```json
{
  "token": "eyJhbGciOiJIUzI1NiJ9...",
  "exp": "2026-02-12T10:00:00",
  "user": { "id": 1, "email": "dev@teste.com" }
}
```

**Exemplo cURL:**
```bash
curl -X POST http://localhost:3001/auth/login \
     -H "Content-Type: application/json" \
     -d '{"email": "dev@teste.com", "password": "senha123"}'
```

