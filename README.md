# Jess' Notebook

This is the source code for my notebook blog at [jessjstill.com/notebook](https://jessjstill.com/notebook). It's built with a set of shell scripts using [sed](https://www.gnu.org/software/sed/manual/sed.html), [ninja](https://ninja-build.org/), and [pandoc](https://pandoc.org/).

Forked from [Wesley Aptekar-Cassels' notebook](https://github.com/wesleyac/notebook), which was inspired by [David R. MacIver's notebook](https://notebook.drmaciver.com/).

## Writing New Entries

### In Obsidian

1. Create a new markdown file in the `entries/` folder
2. Name it using the format: `{UNIX_TIMESTAMP}-{slug}.md`
   - Get the current timestamp: Run `date +%s` in terminal (Unix/Mac) or use an online converter
   - Example: `1704470400-my-first-post.md`
3. Add YAML frontmatter at the top:
   ```yaml
   ---
   tz: America/New_York
   location: City, State
   ---
   ```
4. Write your content in markdown
5. Use `@sidenote: Your sidenote text here` for margin notes
6. Save and commit to git

### Publishing

This site uses **GitHub Actions** to automatically build and deploy when you push to the repository.

**Workflow:**
1. Write your entry in Obsidian
2. Commit and push (use Obsidian Git plugin or manually)
3. GitHub Actions automatically builds and deploys to GitHub Pages

The site will be live at https://jessjstill.com/notebook

**Manual build (requires WSL/Linux/Mac):**
```bash
./bin/build/build.py
./bin/serve.sh  # Local preview
```

## Features

### Sidenotes
The implementation is based on [tufte-css](https://edwardtufte.github.io/tufte-css/), with [additional javascript](/parts/sideline.js) to draw lines connecting sidenote labels to sidenotes on hover.

### Changelogs
When posts are updated, a changelog is generated from git history and embedded into the post, with links to diffs.

### Deep Links
JavaScript allows users to create deep links to any text selection on the page.

### Image Compression
Images are automatically compressed with `pngcrush`, `optipng`, and `jpegoptim`, and converted to WebP format.

### Link Prefetching
[Instantpage](https://instant.page/) prefetches links on hover for faster loading.

### 404 Page
The 404 page allows visitors to write what they think should be there and share it with others.

## Requirements

- Node.js (for html-minifier, terser, svgo)
- Pandoc
- Ninja build system
- Image optimization tools (optional but recommended)

Install Node dependencies:
```bash
npm install
```

## License

Except where otherwise noted, all code in this repository is licensed under the terms of the [MIT license](https://mit-license.org/). All prose is licensed under the terms of the [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/) license.
