# Contributing to Task Management SaaS

Thank you for your interest in contributing! This is a Trello-style Task Management SaaS backend built with Ruby on Rails.

## Getting Started

### Prerequisites

- Ruby 3.3.8 (recommended)
- PostgreSQL
- Redis (optional, for background jobs later)
- Bundler

### Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/task_management.git
   cd task_management
   ```
3. Install dependencies:
   ```bash
   bundle install
   ```
4. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   ```
5. Start the server:
   ```bash
   ./bin/rails server
   ```

## Project Structure

- `app/controllers/api/v1/` – API endpoints
- `app/models/` – ActiveRecord models (User, Organization, Board, List, Card, etc.)
- `app/services/` – Service objects (e.g. JsonWebToken)
- `config/routes.rb` – API routes
- `db/migrate/` – Database migrations

## How to Contribute

1. Create a new branch for your feature or bugfix:
   ```bash
   git checkout -b feature/your-feature-name
   ```
2. Make your changes
3. Write or update tests if applicable
4. Commit your changes with a clear message:
   ```bash
   git commit -m "Add feature: short description"
   ```
5. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
6. Open a Pull Request against the `main` branch

## Coding Guidelines

- Follow Ruby and Rails conventions
- Keep controllers thin — move complex logic into models or service objects
- Use strong parameters
- Prefer clear, descriptive variable and method names
- Write meaningful commit messages
- Do not commit secrets (API keys, passwords, `.env` files, etc.)

## Current Features (MVP)

- User authentication (Devise + JWT)
- Multi-tenant Organizations (Workspaces)
- Boards, Lists, and Cards
- Basic member management

## Areas We Welcome Contributions

- Improving authorization (Pundit policies)
- Adding Comments, Labels, Checklists
- Real-time updates (Action Cable)
- Better error handling and API responses
- Tests (RSpec)
- Documentation improvements
- Bug fixes

## Pull Request Process

- Keep PRs focused on a single feature or fix
- Describe what the PR does and why
- Link any related issues
- Make sure the application still boots and basic endpoints work

## Questions?

Feel free to open an issue if you need clarification or want to discuss a feature before implementing it.

Thank you for contributing!
