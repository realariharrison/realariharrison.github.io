# ariharrison.github.io

Personal website for Ari Harrison — Architect of the Intelligence Layer.

## Live Site

https://ariharrison.github.io

## Features

- Single-page portfolio with smooth scroll navigation
- Writings section powered by Supabase (optional)
- Responsive design with elegant animations
- Mobile-optimized with hamburger menu

## Supabase Setup (Optional)

To enable dynamic writings from Supabase:

1. Create a Supabase project at [supabase.com](https://supabase.com)
2. Run `supabase/schema.sql` in the SQL Editor
3. Update `index.html` with your credentials:

```javascript
const SUPABASE_URL = 'https://your-project.supabase.co';
const SUPABASE_ANON_KEY = 'your-anon-key';
```

Without Supabase configured, the site displays fallback content.

## Local Development

Just open `index.html` in a browser — no build step required.

## Adding Writings

In Supabase SQL Editor or via the dashboard:

```sql
INSERT INTO writings (title, slug, excerpt, body, is_published, published_at)
VALUES (
  'Your Post Title',
  'your-post-slug',
  'A brief excerpt...',
  'Full markdown body here...',
  TRUE,
  NOW()
);
```

## License

© 2026 Ari Harrison
