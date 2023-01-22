# Dish API

RESTful API for serving your favorite dishes and recipes.

Built with Ruby on Rails 6.

## Getting Started

The following is a guide to setting up Dish API locally.

### Prerequisites

- **Ruby 3.0.5** installed
- **Bundler** gem manager. Install it with:

```sh
gem install bundler
```

- **PostgreSQL 13** installed. Make sure the database server has been started on your `localhost`, port `5432`.

### Installation & Setup

1. Clone the repo

```sh
git clone https://github.com/anhdau185/whats-the-dish-api.git
```

2. Install packages

```sh
bundle install
```

3. Configuration

Create a `.env` file by copying the project's sample file `.env.dev`:

```sh
cp .env.dev .env
```

and fill out all the empty fields in it with your own values.

4. Set up the database

Create a development database:

```sh
rails db:create
```

and run migrations:

```sh
rails db:migrate
```

or if you're setting up a brand new database, loading the `schema.rb` file would be another option:

```sh
rails db:schema:load
```

Finally, if you need some initial seed data, you can optionally run:

```sh
rails db:seed
```

5. Run it on local

```
rails s -p 5000
```

The service can now be accessed via `localhost:5000`.

## Setting up Using Docker

Dish API can also run as a containerized application. In fact, this is the preferable way in which the service should be deployed and run in a production environment because of the portability (and many more advantages) that containers provide.

The following is an alternative setup guide using Docker containers.

### Prerequisites

- Latest version of [Docker Desktop](https://www.docker.com/products/docker-desktop) installed.
- Check if `docker` and `docker compose` are running:

```sh
docker version
docker compose version
```

### Installation & Setup

1. Configuration

Create a `.env` file by copying the project's sample file `.env.prod`:

```sh
cp .env.prod .env
```

and fill out all the empty fields in it with your own values.

2. Get the Docker images

Pull all the images needed to get the project up and running from Docker Hub:

```sh
# postgres image
docker pull postgres:13-alpine

# backend app image
docker pull registry.digitalocean.com/anhdau185/dish-api:latest
```

Note: You need authenticating before accessing a private Docker registry. See [this guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-top-of-digitalocean-spaces-and-use-it-with-digitalocean-kubernetes) on how to do this.

3. Run the service

Run the service as containers in the background with `docker compose`:

```sh
docker compose up --detach
```

The service can now be accessed via `localhost:3001`.

4. Set up a database (for the first spin-up)

Create a production database:

```sh
docker exec dish rails db:create RAILS_ENV=production
```

and run migrations:

```sh
docker exec dish rails db:migrate RAILS_ENV=production
```

or if you're setting up a brand new database, loading the `schema.rb` file would be another option:

```sh
docker exec dish rails db:schema:load RAILS_ENV=production
```

Finally, if you need some initial seed data, you can optionally run:

```sh
docker exec dish rails db:seed RAILS_ENV=production
```

The containerized service is now all set and ready for use!

5. Stop the service

If you'd want to stop (and then remove) the service's running containers as a whole, run the command:

```sh
docker compose down
```

## Workflows

Check out [this doc](https://github.com/anhdau185/application-infrastructure/blob/main/docs/whats-the-dish/workflows-backend.md) for how to develop the service as well as how to deploy and monitor it on a production environment.

<!-- ## Usage

This section lists out all the APIs exposed by the Auth Service as well as how to test them.

### API Documentation

| API Name/Purpose    | Endpoint               | Request Body                           | Bearer Token Required? | Comment             |
| ------------------- | ---------------------- | -------------------------------------- | ---------------------- | ------------------- |
| Register a New User | `POST /users/signup`   | `{ name; username; password; scope? }` | No                     |
| Get the User List   | `GET /users`           |                                        | Access Token           | Needs authorization |
| Get a User          | `GET /users/:id`       |                                        | Access Token           | Needs authorization |
| Update a User       | `PATCH /users/:id`     | `{ name; password }`                   | Access Token           | Needs authorization |
| Delete a User       | `DELETE /users/:id`    |                                        | Access Token           | Needs authorization |
| Sign In             | `POST /auth/login`     | `{ username; password }`               | No                     |
| Authenticate a User | `POST /auth/protected` |                                        | Access Token           |
| Refresh Tokens      | `POST /auth/refresh`   |                                        | Refresh Token          |
| Sign Out            | `POST /auth/logout`    |                                        | Refresh Token          |

### Testing

[Postman](https://www.postman.com/), a popular API platform, is a helpful tool to play around with and get used to the above APIs. Here are some sample collections that can be useful for testing these APIs:

- APIs: [Download here](https://gist.github.com/anhdau185/726c55cbf40cfef57a3ff377ee4576d9)
- Environment: [Download here](https://gist.github.com/anhdau185/11cbdbc976f7fc6de5b22564ef63b0ca) -->

## Roadmap

- [x] CRUD Actions for Dishes & Categories
- [x] Like/Unlike a Dish
- [ ] Dish Recipes
- [ ] User Authorization
  - [ ] Admin
  - [ ] User
  - [ ] Guest (Unauthorized)

See [open issues](https://github.com/anhdau185/whats-the-dish/issues) for a full list of proposed features (and known issues).

## Contact

Hi I'm Anh Dau, author of this repo. You can reach out to me with the contact info at [thecodinglad.com/about](https://thecodinglad.com/about).
