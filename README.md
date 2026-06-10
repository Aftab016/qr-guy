# 🚀 [QR Guy]

> A brief, catchy description of what your project is and what it does. Built with [Astro](https://astro.build/) for maximum speed and performance.

## ✨ Features

* **Fast by Default:** Zero JavaScript frontend leveraging Astro's Island architecture.
* **Markdown Support:** Easy content authoring for blogs, portfolios, or documentation.
* **Responsive Design:** Mobile-first approach ensuring a great user experience on all devices.
* **SEO Optimized:** Built-in metadata management and lightning-fast load times.

## 🧞 Local Development

To get this project up and running on your local machine, follow these steps.

### Prerequisites

* Node.js (v18.14.1 or higher)
* npm, pnpm, or yarn

### Commands

All commands are run from the root of the project in your terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs all project dependencies.               |
| `npm run dev`             | Starts the local dev server at `localhost:4321`. |
| `npm run build`           | Builds the production site into `./dist/`.       |
| `npm run preview`         | Previews your local build before deploying.      |
| `npm run astro ...`       | Run CLI commands like `astro add` or `astro check`. |

## 📂 Project Structure

Inside of this Astro project, the codebase is organized as follows:

```text
/
├── public/           # Static assets (favicons, fonts, raw images)
├── src/
│   ├── assets/       # Processed assets (images, global CSS)
│   ├── components/   # Reusable UI components (Navbar, Footer, Cards)
│   ├── layouts/      # Page layout wrappers
│   └── pages/        # File-based routing (pages and API endpoints)
├── package.json      # Dependencies and scripts
└── astro.config.mjs  # Astro configuration file
