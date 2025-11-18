# Christian Schneider CV

A Jekyll-based markdown CV originally forked from https://github.com/blmoore/md-cv but largely altered.

Built with Jekyll 3.8.x and PrinceXML for PDF generation.

## Prerequisites

- **Ruby** (2.6+ recommended)
- **Bundler** (comes with Ruby)
- **PrinceXML** (for PDF generation)

## First Time Setup

If you're setting this up on a new machine (or after 7 years!):

1. **Install dependencies:**
   ```bash
   bundle install
   ```

2. **Install PrinceXML** (if not already installed):
   ```bash
   brew install --cask prince
   ```
   Note: The free version adds a Prince watermark to PDFs.

3. **Verify everything works:**
   ```bash
   bundle exec jekyll build
   ```

## Usage

### Generate PDF (and open it)
```bash
./generate.sh
```
This will build the site and create `christian_schneider_cv.pdf`, then open it.

### Generate PDF (without opening)
```bash
./generate_no_open.sh
```
Creates `cv_christian_schneider.pdf` and closes the terminal.

### Development Server
```bash
bundle exec jekyll serve
```
Then open http://localhost:4000 to preview changes in real-time.

### Manual Build
```bash
bundle exec jekyll build
```
Output goes to `_site/` directory.

## Project Structure

- `_config.yml` - Personal information and site configuration
- `_layouts/cv.html` - Main CV layout template
- `_includes/*.html` - Section templates (education, employment, etc.)
- `_education/`, `_employment/`, `_teaching/`, etc. - Content organized by collection
- `css/cv-screen.scss` - Styles for both screen and print

## Editing Content

Each CV section is a Jekyll collection stored in its own directory (e.g., `_employment/`, `_education/`). Add/edit markdown files in these directories with YAML frontmatter.

## Troubleshooting

**Jekyll not found?**
```bash
bundle exec jekyll --version
```
Should show Jekyll 3.8.x. If not, run `bundle install`.

**Prince not found?**
```bash
prince --version
```
Should show Prince 16.x. If not, install via `brew install --cask prince`.

**Wrong Ruby version?**
```bash
ruby --version
```
Should be 2.6+. Use a Ruby version manager if needed.

## Notes

- Always use `bundle exec` to ensure correct Jekyll version
- PrinceXML free version adds a watermark (acceptable for personal CV)
- This project uses Jekyll 3.8.x (from 2019) - still works great!
- See `CLAUDE.md` for detailed architecture documentation
