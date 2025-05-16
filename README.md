# Backend User Task API

## 🚀 Overview
RESTful and GraphQL API for managing users and tasks, built with Ruby on Rails.

## 🛠️ Prerequisites
- Docker & Docker Compose
- Ruby 3.2+
- PostgreSQL 15
- Git

## 🔧 Quick Start

1. Clone the repository:
```bash
git clone https://github.com/2312-miguel/backend-user-task-api.git
cd backend-user-task-api
```

2. Configure database:
```bash
# Copy database configuration example
cp config/database.yml.example config/database.yml

# Adjust if needed for your local environment
```

3. Build and start containers:
```bash
docker-compose build
docker-compose up -d
```

4. Database Setup:
```bash
# Create database
docker-compose exec web rails db:create

# Run migrations
docker-compose exec web rails db:migrate

# Load seed data (includes test user)
docker-compose exec web rails db:seed

# Or do all at once
docker-compose exec web rails db:setup 
```

The seed data will create:
- A test user with credentials listed in Authentication section
- Sample tasks for testing
- Additional random users and tasks

## 🧪 Running Tests
First, setup the test database:
```bash
docker-compose exec web rails db:setup RAILS_ENV=test
```

Then run the tests:
```bash
docker-compose run --rm web bundle exec rspec
```

## 📡 API Endpoints

### Testing Endpoints
The project includes a `requests.http` file that you can use to test all endpoints using REST Client in VS Code or similar IDE plugins. The file contains:
- REST API endpoint examples
- GraphQL query examples
- Authentication headers pre-configured
- Test user credentials

### REST API
- `GET /api/users` - List users
- `GET /api/users/:id` - Get user details
- `POST /api/tasks` - Create task
- `PUT /api/tasks/:id` - Update task
- `DELETE /api/tasks/:id` - Delete task

### GraphQL API
Available at `/graphql` with queries for:
- Users listing
- Tasks management
- User authentication

## 🔒 Authentication
Bearer token authentication required for protected endpoints.

### Development Credentials
For testing purposes, use these credentials:
```
Token: test-token-123
Email: test@example.com
Role: admin
```

### Getting User Tokens
To get all users' emails and their authentication tokens, run:
```bash
# Access Rails console
docker-compose exec web rails c

# List all users' emails and tokens
User.all.map { |u| [u.email, u.auth_token] }
```

Example request header:
```
Authorization: Bearer test-token-123
```

## 🚀 Deployment

1. Build the production image:
```bash
docker-compose -f docker-compose.prod.yml build
```

2. Deploy

## 📦 CI/CD
Jenkins pipeline available for:
- Automated testing
- Docker image building
- Deployment stages

