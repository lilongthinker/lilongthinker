#!/bin/bash

# Script to start the Jekyll site locally

show_help() {
    echo "Usage: ./start.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --docker          Start with Docker (default)"
    echo "  --docker-slim     Start with Docker slim image"
    echo "  --local           Start with local Ruby setup (requires bundle install)"
    echo "  --help, -h        Show this help message"
    echo ""
    echo "The site will be available at http://localhost:8080 (Docker) or http://localhost:4000 (local)"
}

# Default to local Ruby setup
START_MODE="local"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --docker)
            START_MODE="docker"
            shift
            ;;
        --docker-slim)
            START_MODE="docker-slim"
            shift
            ;;
        --local)
            START_MODE="local"
            shift
            ;;
        --help|-h)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

echo "Starting Jekyll site in $START_MODE mode..."

case $START_MODE in
    "docker")
        if ! command -v docker &> /dev/null; then
            echo "Error: Docker is not installed or not in PATH"
            exit 1
        fi
        echo "Starting with Docker..."
        echo "Access the site at: http://localhost:8080"
        docker compose up
        ;;
    "docker-slim")
        if ! command -v docker &> /dev/null; then
            echo "Error: Docker is not installed or not in PATH"
            exit 1
        fi
        echo "Starting with Docker slim image..."
        echo "Access the site at: http://localhost:8080"
        docker compose -f docker-compose-slim.yml up
        ;;
    "local")
        if ! command -v bundle &> /dev/null; then
            echo "Error: Bundler is not installed. Run 'gem install bundler' first."
            exit 1
        fi
        echo "Starting with local Ruby setup..."
        echo "Access the site at: http://localhost:4000"
        bundle exec jekyll serve
        ;;
esac