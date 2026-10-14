# stevenjtaylor.com

A plain static site — hand-written HTML + CSS, **no build step, no framework**.
To change something, edit the file and re-deploy. That's it.

## Files

| Path                            | What it is                                             |
| ------------------------------- | ------------------------------------------------------ |
| `index.html`                    | Home page (intro + location + social links)            |
| `projects/index.html`           | Projects list → `/projects/` (one card per project)    |
| `projects/barkive/index.html`   | Barkive project → `/projects/barkive/`                 |
| `projects/wind-spots/index.html` | Wind Spots project → `/projects/wind-spots/`          |
| `styles.css`                    | Shared styles (edit `:root` at the top to reskin)      |
| `images/`                       | Screenshots / photos used by the pages                 |
| `favicon.svg`                   | Tab icon (a blue “S” — swap whenever)                  |
| `404.html`                      | Shown for unknown URLs                                  |
| `_headers`                      | Security headers, applied by Cloudflare Pages          |
| `_redirects`                    | Redirects for moved pages, applied by Cloudflare Pages |
| `copy.js`                       | Copy-to-clipboard buttons                              |
| `robots.txt`                    | Search engines allowed; AI crawlers asked to stay out  |
| `sitemap.xml`                   | List of pages for search engines                       |
| `preview.sh`                    | Local preview server (below)                           |

Everything is theme-aware (light/dark follows the visitor's OS setting). URLs are
directory-based (`/projects/barkive/`) so they resolve the same locally and on
Cloudflare Pages.

## Preview locally

```bash
./preview.sh
```

Serves on port **8010** (or the next free port) and opens your browser. Use a
server rather than opening `index.html` as a file, so the absolute paths
(`/styles.css`, `/images/…`) resolve exactly like production. Pass a port to
override, e.g. `./preview.sh 8080`.

## Adding a project

1. Copy an existing project folder: `projects/barkive/` → `projects/<slug>/`.
2. Edit `projects/<slug>/index.html` (title, prose, tags, images).
3. Add a card linking to `/projects/<slug>/` in `projects/index.html`.
4. Put any images in `images/` and reference them as `/images/<file>`.
5. Add `https://stevenjtaylor.com/projects/<slug>/` to `sitemap.xml`.
