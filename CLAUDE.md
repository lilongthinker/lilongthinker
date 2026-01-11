# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Jekyll-based academic portfolio website called "al-folio" (a fork of the original al-folio theme). It's a responsive academic theme designed for researchers and academics to showcase their work, publications, and CV.

## Architecture & Structure

### Core Components
- **Static Site Generator**: Jekyll (Ruby-based)
- **Frontend**: HTML, CSS, JavaScript with Liquid templating
- **Styling**: Bootstrap, SCSS with custom themes
- **Deployment**: GitHub Pages, Docker
- **Languages**: Ruby, JavaScript, Liquid templates, YAML, Markdown

### Key Directories
- `_config.yml`: Main configuration file with site settings and personal info
- `_pages/`: Main pages (about, blog, cv, projects, publications)
- `_posts/`: Blog posts organized by date
- `_data/`: YAML data files for CV, socials, repositories, coauthors, venues
- `_bibliography/`: BibTeX file for publications
- `_news/`: News updates displayed on the homepage
- `_projects/`: Project descriptions
- `_books/`: Book entries
- `assets/`: Static assets (CSS, JS, images, JSON, PDFs)
- `_layouts/`: Jekyll templates
- `_includes/`: Reusable HTML fragments
- `_sass/`: SCSS stylesheets
- `_scripts/`: Additional scripts

### Special Features
- Light/Dark mode toggle
- Publication management with BibTeX integration
- CV generation from JSON or YAML
- Math typesetting with MathJax
- Code syntax highlighting
- Image zoom functionality
- Social media integration
- RSS feeds
- GitHub stats integration

## Development Commands

### Local Development
```bash
# Using Docker (recommended)
docker compose pull
docker compose up

# Alternative: Using Docker slim image
docker compose -f docker-compose-slim.yml up

# Local setup (if Ruby is installed)
bundle install
bundle exec jekyll serve
```

### Building and Deployment
```bash
# Build the site locally
bundle exec jekyll build

# Manual deployment to GitHub Pages
./bin/deploy

# Build with purged CSS (removes unused classes)
bundle exec jekyll build
purgecss -c purgecss.config.js
```

### Formatting
```bash
# Prettier is used for code formatting (configured in package.json)
npm install
npx prettier --write .
```

## Development Workflow

### Creating Content
- **Blog posts**: Add Markdown files to `_posts/` with format `YYYY-MM-DD-title.md`
- **Projects**: Add Markdown files to `_projects/`
- **News**: Add Markdown files to `_news/`
- **Publications**: Edit `_bibliography/papers.bib` (BibTeX format)
- **CV**: Edit `assets/json/resume.json` (JSON Resume format) or `_data/cv.yml`

### Configuration
- All site configuration is in `_config.yml`
- Theme colors can be customized in `_sass/_themes.scss`
- Social media links are in `_data/socials.yml`
- GitHub repositories/users info is in `_data/repositories.yml`

### GitHub Actions
- Automatic deployment occurs when pushing to main branch
- Workflows include: deploy, linting (Prettier), broken link checking, accessibility testing
- To enable GitHub Actions, go to Settings → Actions → General → Workflow permissions and give "Read and write permissions" to GitHub Actions

### Docker Development
- The site can be developed using Docker with live reloading
- The container serves on port 8080
- Changes to files are watched and Jekyll automatically rebuilds
- The entry point script handles Jekyll serving and config changes

## Important Files
- `_config.yml`: Primary configuration
- `Gemfile`: Ruby dependencies
- `package.json`: Node.js dependencies (currently just Prettier)
- `Dockerfile` and `docker-compose.yml`: Container setup
- `.github/workflows/deploy.yml`: Deployment configuration
- `bin/deploy`: Manual deployment script
- `bin/entry_point.sh`: Docker container startup script