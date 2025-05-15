# List all available actions
default:
    @just --list

# Starts the docker compose stack
dev:
    docker compose \
        --file ./manifests/compose.production.yaml \
        --file ./manifests/compose.development.yaml \
        --env-file \
        up \
        --remove-orphans \
        --build

# Shuts down the running docker compose stack
down:
    docker compose \
        --file ./manifests/compose.production.yaml \
        --file ./manifests/compose.development.yaml \
        down \
        --remove-orphans

# Clears all resources, and deletes any related data and container images
clean:
    docker compose \
        --file ./manifests/compose.production.yaml \
        --file ./manifests/compose.development.yaml \
        --env-file \
        down \
        --remove-orphans \
        --volumes \
        --rmi local

# Spin up infrastructure
infra-up:
    @tofu -chdir=infrastructure/environments/production apply

# Destroy inrastructure
infra-down:
    @tofu -chdir=infrastructure/environments/production apply
