# API WAREHOUSE - The House Of API's

API WAREHOUSE is a Rails application designed to serve as a centralized repository for APIs.

## Development Setup

### Prerequisites

Make sure you have [Docker](https://www.docker.com/) installed on your machine.

### Running the Development Environment

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/api_warehouse.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd api_warehouse
    ```

3. **Build and run the development environment using Docker Compose:**

    ```bash
    docker-compose up --build
    ```

    This command will build the Docker image for your Rails application and start both the Rails app and the PostgreSQL database.

4. **Access the running Rails application:**

    Once the Docker containers are up and running, you can access your Rails application at [http://localhost:3000](http://localhost:3000).

5. **Run migrations on Rails localhost interface:**

    You have to click on Run Migrations in the browser and the application will start.

### Stopping the Development Environment

To stop the development environment, press `Ctrl+C` in the terminal where `docker-compose` is running, and then run:

```bash
docker-compose down
```

This will stop and remove the running Docker containers.

# Notes

The development environment is configured to use PostgreSQL as the database. Make sure you have Docker running before starting the environment.
Customize the environment variables and configurations in the docker-compose.yml and Dev.dockerfile files based on your project's requirements.
If you encounter any issues or need additional information, feel free to contact our support team or check our documentation.