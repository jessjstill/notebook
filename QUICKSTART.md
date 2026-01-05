# Quick Start Guide

## Writing Your First Entry

### Method 1: Manual Creation in Obsidian

1. In the `entries/` folder, create a new markdown file
2. Name it: `{timestamp}-{slug}.md`
   - Get timestamp: Open terminal and run `date +%s` (or use https://www.unixtimestamp.com/)
   - Example: `1736092800-hello-world.md`

3. Add this at the top of your file:
```yaml
---
tz: America/New_York
location: Your City, State
---
```

4. Write your content:
```markdown
# My First Post

This is my first notebook entry!

You can use @sidenote: This appears in the margin for additional notes.
```

### Method 2: Using the Helper Script

Run in terminal:
```bash
./bin/author/new-entry.sh my-post-title
```

This creates a template file you can then edit in Obsidian.

## Entry Format Tips

### Frontmatter
- `tz`: Your timezone (e.g., `America/New_York`, `America/Los_Angeles`)
- `location`: Where you're writing from (optional but nice)

### Markdown Features
- Standard markdown: `# Headers`, `**bold**`, `*italic*`, `[links](url)`
- Sidenotes: `@sidenote: Your margin note text`
- Margin notes: `@marginnote: Similar to sidenotes`
- Images: `![alt text](path/to/image.png)` (place images in `entries/`)

### File Naming Convention
Format: `{UNIX_TIMESTAMP}-{slug}.md`
- Timestamp determines the posting date/time
- Slug becomes the URL (e.g., `hello-world` → `/hello-world/`)

## Publishing Workflow

### 1. Write in Obsidian
Create and edit your markdown files in the `entries/` folder.

### 2. Build the Site
```bash
# From repository root
./bin/build/build.py
```

This generates the static site in `out/site/`.

### 3. Preview Locally
```bash
./bin/serve.sh
```

Visit http://localhost:8000 to see your notebook.

### 4. Deploy to GitHub Pages
```bash
./bin/deploy.sh --pages
```

Your site will be live at https://jessjstill.com/notebook

## Tips

- The introduction entry (`entries/1594164910-introduction.md`) is kept as a reference
- You can view it to see examples of formatting and sidenotes
- Commit your changes to git regularly
- The site automatically generates changelogs from git history

## Troubleshooting

### Build fails
- Check that you have Node.js installed: `npm install`
- Check that Pandoc is installed: `pandoc --version`
- Check that Ninja is installed: `ninja --version`

### Entry doesn't appear
- Verify the filename format: `{timestamp}-{slug}.md`
- Check that frontmatter is valid YAML
- Ensure the file is in the `entries/` folder

### Deploy fails
- Verify git remote is set: `git remote -v`
- Check GitHub Pages settings in your repository
- Ensure you have push permissions
