# Long-Term Front-End Plan
## Inspired by thestrokes.com

---

### The Core Lesson from The Strokes

The Strokes' site works because it has **one coherent idea executed completely**: retro-digital nostalgia matching their musical identity. It doesn't look accidentally dated — it looks *deliberately* dated. Every element (animated GIFs, pixel art, ASCII borders, screensaver animations) reinforces the same brand statement.

Pantano Beat already has an authentic identity: **the swamp**. Dark, humid, slow, organic, off-grid. The terminal theme accidentally aligns perfectly — dark warm brown, amber, monospace — it feels like a decaying CRT in a humid basement. The plan is to lean into this rather than modernize away from it.

---

### Phase 1 — Foundation (now → first release) ✅ done

- Homepage body copy, about voice, release/event copy
- CSS overrides, favicon, footer social links
- `readMore` fix, date format

---

### Phase 2 — Visual Identity (when first EP artwork exists)

**2a. Cover images via page bundles**
Convert `debut-ep.md` to a page bundle and add a cover. The amber border (ready in `style.css`, commented out) makes covers feel like framed prints.

**2b. A hero image or texture on the homepage**
A swamp photo — murky water, dense vegetation, low light — as a subtle background texture on `_index.md`. Hugo supports this via `static/` and a few CSS lines.

**2c. Custom SVG wordmark**
Still monospace-inspired, but hand-tuned. Add via `logoImage` in `hugo.toml` or override `layouts/partials/logo.html`.

---

### Phase 3 — Interactivity & Personality (ongoing, low-effort)

**3a. A custom 404 page** — `layouts/404.html`:

```
you're lost in the swamp.

→ go back home
```

**3b. ASCII art dividers in content**
A simple `────────────────────` in post bodies or a swamp-themed ASCII piece in `_index.md`. On-brand, zero-cost.

**3c. Blinking cursor on the subtitle**
Animate `music collective` with a blinking `█` cursor. ~10 lines of vanilla JS in `extended_head.html`. Ties the site to its terminal identity.

---

### Phase 4 — Content Depth (as the band's story develops)

**4a. Press/links section** — `content/press/`. Template it now, populate later.

**4b. Embedded audio player**
Soundcloud or Bandcamp embed in a release page. `{{< soundcloud ... >}}` shortcode in `debut-ep.md`.

**4c. Photo section or tour archive**
After the first show — a `content/photos/` section. A single post with 5 images is enough to start.

---

### Phase 5 — Distribution & Discovery (when ready to be found)

**5a. Social meta tags** (`extended_head.html`)
Open Graph + Twitter Card tags so shared links preview with cover art. Three `<meta>` tags.

**5b. Streaming links on release pages**
When the EP is live on Spotify/Apple Music — markdown links on the release page.

**5c. Newsletter**
A Buttondown or Substack embedded form in `extended_footer.html`. Free tier. One HTML block.

---

### Phase 6 — Aesthetic Deepening (long-term)

**6a. Custom syntax highlighting theme**
Amber-on-dark-brown palette matching the site. Uses `[markup.highlight]` with `noClasses = false`.

**6b. A genuine "visual statement" homepage**
A custom `layouts/index.html`: intro text, latest release block with cover, next show teaser.

**6c. Swamp-themed transition**
A brief flash of ASCII or a one-word message when navigating. CSS `animation` on the `<body>` element.

---

### What to Ignore

- Auto-playing audio
- Full-page video backgrounds
- Cookie consent popups / EU tracking scripts
- Generic hero sliders
- Custom webfonts — monospace is the brand

---

### Priority Order

| When | What | Effort |
|------|------|--------|
| Now | 404 page | 10 min |
| Now | ASCII divider in `_index.md` | 5 min |
| With EP art | Cover images (page bundles) | 15 min |
| With EP art | Activate CSS cover border | 2 min |
| With EP art | Open Graph meta tags | 15 min |
| After EP release | Streaming links on release page | 5 min |
| After first show | Bandcamp/Soundcloud embed | 10 min |
| After 3+ content items | Press section | 20 min |
| When identity is locked | SVG wordmark | 1–2 hrs |
| Long-term | Custom index layout | 2–3 hrs |
