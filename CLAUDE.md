# CLAUDE.md — Hugo Developer System Prompt

You are an expert **Hugo static site developer** working on the **Pantano Beat** music collective website (`pantanobeat.com`).

---

## Project Overview

| Key | Value |
|-----|-------|
| **Site** | https://pantanobeat.com/ |
| **Engine** | Hugo v0.156.0+ (extended, darwin/arm64) |
| **Theme** | hugo-theme-terminal v4 (`github.com/panr/hugo-theme-terminal/v4`) |
| **Module system** | Go modules (Go 1.23.6) |
| **Deployment** | GitHub Pages via GitHub Actions (master branch triggers build) |

---

## Repository Layout

```
pantanobeat.com/
├── hugo.toml                        # Site configuration
├── go.mod / go.sum                  # Go module deps (theme)
├── content/
│   ├── _index.md                    # Homepage
│   ├── about.md                     # About page
│   ├── posts/                       # News & blog posts
│   ├── releases/                    # Discography entries
│   └── events/                      # Gigs & events
├── archetypes/default.md            # Content archetype
├── static/                          # Static assets (favicon, images)
├── layouts/                         # Layout overrides
├── assets/                          # Asset pipeline overrides
├── .github/workflows/hugo.yaml      # GitHub Actions: build & deploy
├── .gitignore
├── Makefile
└── CLAUDE.md
```

---

## Configuration — `hugo.toml`

Key theme params:

| Param | Value | Notes |
|-------|-------|-------|
| `themeColor` | `"orange"` | Terminal accent color |
| `centerTheme` | `true` | Centered layout |
| `contentTypeName` | `"posts"` | Main listing section |
| `autoCover` | `true` | Auto cover from resources |

---

## Content Authoring

### Frontmatter Format: TOML (`+++`)

```toml
+++
title = "Post Title"
date = "2026-02-22T00:00:00+00:00"
draft = false
tags = ["tag1"]
description = "Meta description"
+++
```

### Content Sections

| Section | URL | Purpose |
|---------|-----|---------|
| `content/posts/` | `/posts/` | News, updates, announcements |
| `content/releases/` | `/releases/` | Albums, EPs, singles |
| `content/events/` | `/events/` | Upcoming and past shows |

### Creating new content

```bash
make new section=posts name=my-post-slug
make new section=releases name=album-title
make new section=events name=venue-city-date
```

---

## Build Commands

| Command | What it does |
|---------|-------------|
| `make run` | Dev server at http://localhost:1313 (live reload) |
| `make run-drafts` | Dev server including draft posts |
| `make build` | Build to `public/` with `--gc --minify` |
| `make clean` | Remove `public/` and `resources/_gen/` |
| `make new section=X name=Y` | Create new content |
| `make update` | Update Hugo modules |

---

## Deployment

Deployment is fully automated via GitHub Actions (`.github/workflows/hugo.yaml`):

1. Push to `master` triggers the workflow
2. Hugo extended is installed and builds the site
3. Output is uploaded as a GitHub Pages artifact
4. GitHub deploys it — no build output is ever committed

**GitHub Pages Settings**: Source must be set to **"GitHub Actions"** (not "Deploy from a branch").

**Custom domain**: Add a `CNAME` file to `static/` containing `pantanobeat.com`, and configure DNS:
- `A` records pointing to GitHub Pages IPs
- Or `CNAME` pointing `www` to `pedrogasparotti.github.io`

---

## Guardrails

- **NEVER** commit `public/` or `resources/_gen/` — they are gitignored
- **ALWAYS** test locally before pushing: `make run`
- **NEVER** modify files in the Hugo module cache
- Hugo content uses **TOML** frontmatter (`+++`)
- The site deploys from `master`
