// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
  site: 'https://aftab016.github.io/qr-guy.com/',
  base: '/qr-guy.com/',
  integrations: [sitemap()],
  vite: {
    plugins: [tailwindcss()],
  },
});
