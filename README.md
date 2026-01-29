# Napstar Landing Page

Marketing landing page for Napstar - Calm Sleep Tracking for Tired Parents.

## Local Development

Simply open `index.html` in a browser, or use a local server:

```bash
# Using Python
python3 -m http.server 8080

# Using Node
npx serve .

# Using PHP
php -S localhost:8080
```

Then visit http://localhost:8080

## Deployment to deplo.io

### Prerequisites

- Docker installed locally (for testing)
- deplo.io CLI configured
- Access to deplo.io dashboard

### Build & Test Locally

```bash
# Build the image
docker build -t napstar-landing .

# Run locally
docker run -p 8080:8080 napstar-landing

# Visit http://localhost:8080
```

### Deploy to deplo.io

```bash
# Using deplo CLI
deplo deploy --dockerfile-path Dockerfile

# Or via GitHub integration in deplo.io dashboard
```

### Configuration

The app listens on port 8080 by default (deplo.io standard).

If you need to customize:
- Port: Update `nginx.conf` and deplo.io app settings
- Build context: Use `--dockerfile-build-context` flag

## File Structure

```
landing-page/
├── index.html      # Main HTML page
├── styles.css      # All styling (Mental Health App inspired)
├── nginx.conf      # Nginx configuration
├── Dockerfile      # Container definition
├── .dockerignore   # Files to exclude from build
└── README.md       # This file
```

## Assets Needed

Before launch, add these files:

1. **favicon.png** - 32x32 app icon for browser tab
2. **og-image.png** - 1200x630 Open Graph image for social sharing
3. **apple-touch-icon.png** - 180x180 for iOS home screen

Place them in the same directory and uncomment the COPY line in Dockerfile.

## Design System

Based on "Mental Health App" style:

### Colors
- Primary: `#7C6FA0` (soft lavender)
- Secondary: `#8FA897` (warm sage)
- Accent: `#D4A59A` (soft coral)
- Background: `#FAFAFA` (warm white)
- Text: `#2D2A33` (warm charcoal)

### Typography
- Font: Inter (Google Fonts)
- Weights: 400, 500, 600, 700

### Characteristics
- Soft, rounded corners (12-24px)
- Generous whitespace
- Calming color palette
- Accessible contrast ratios
- Smooth, subtle animations
- Mobile-first responsive design

## Performance

- No JavaScript frameworks
- Single CSS file (no build step)
- Gzip enabled via nginx
- 1-year cache for static assets
- Optimized for Core Web Vitals
