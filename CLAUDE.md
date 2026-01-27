# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll-based CV/resume website that generates both HTML and PDF outputs. Originally forked from https://github.com/blmoore/md-cv but heavily customized. The CV content is organized into Jekyll collections representing different sections of a professional CV.

## Build and Development Commands

**Generate PDF and open it:**
```bash
./generate.sh
```
This builds the Jekyll site, converts `_site/index.html` to PDF using PrinceXML, and opens the PDF.

**Generate PDF without opening:**
```bash
./generate_no_open.sh
```
Similar to above but doesn't open the PDF and closes the terminal afterward.

**Serve locally for development:**
```bash
./publish.sh
```
Starts Jekyll development server at http://localhost:4000. Kills previous Ruby/Chrome instances first.

**Manual Jekyll commands:**
```bash
jekyll build    # Build static site to _site/
jekyll serve    # Serve at localhost:4000 with auto-rebuild
```

## Architecture

### Content Structure

CV content is organized into Jekyll collections (configured in `_config.yml`), each stored in a corresponding directory:

- `_education/` - Educational background
- `_employment/` - Work experience
- `_teaching/` - Teaching positions
- `_conferences/` - Conference presentations
- `_exhibitions/` - Exhibition history
- `_misc/` - Miscellaneous achievements
- `_computer_skills/` - Technical skills (subdivided: languages, libraries, dev_tools, operating_systems, other)
- `_languages/` - Language proficiencies
- `_interests/` - Personal interests
- `_drafts/` - Unpublished content

Each collection item is a markdown file with YAML frontmatter. All collections have `output: false` (not rendered as individual pages).

### Layout System

**Single layout:** `_layouts/cv.html` - Main CV template that includes all sections in order

**Includes (in `_includes/`):** One HTML partial per CV section (e.g., `employment.html`, `education.html`). Each include:
- Reads from its corresponding collection
- Sorts items (typically by year, most recent first)
- Renders chronological entries with consistent left/right structure
- Uses conditional logic to handle ongoing positions (no end date)

**Entry structure pattern:** Most includes use a left-right layout where:
- Left side: Time period
- Right side: Institution/title, position/role, content/description

### Frontmatter Schema

Collection items use YAML frontmatter. Common fields:

**Employment/Education/Teaching:**
```yaml
from: 2017
to: 2019
position: "Job Title"
institution: "Organization Name"
```

**Skills/Languages:**
Files in `_computer_skills/` and `_languages/` may have different structures specific to their content type.

### Styling

- CSS source: `css/cv-screen.scss` (SCSS)
- Same stylesheet used for both screen and print media
- Backup files exist (.bak extension) but are not in use

### PDF Generation

PrinceXML is used to convert the built HTML to PDF. The tool applies the same CSS for consistent print output.

## Personal Information

Contact details and personal info are stored directly in `_config.yml` (not in separate collection items):
- name, street, city, country
- birthdate, nationality
- phone, email, website
- photo path

These are referenced in templates via `{{ site.variable_name }}`.
