# 🚀 [QR Guy]

> A brief, catchy description of what your project is and what it does. Built with [Astro](https://astro.build/) for maximum speed and performance.

## ✨ Features

* **Fast by Default:** Zero JavaScript frontend leveraging Astro's Island architecture.
* **Markdown Support:** Easy content authoring for blogs, portfolios, or documentation.
* **Responsive Design:** Mobile-first approach ensuring a great user experience on all devices.
* **SEO Optimized:** Built-in metadata management and lightning-fast load times.

## 🧞 Local Development

To get this project up and running on your local machine, choose either the automated launcher (Windows only) or the manual steps (all operating systems).

### Prerequisites

Regardless of which method you choose, make sure you have:
* **Node.js** (v18.14.1 or higher; recommended v22.12.0+) installed. You can download it from [nodejs.org](https://nodejs.org/).
* A package manager (npm comes pre-installed with Node.js).

---

### 🚀 Option A: Automated Launch (Windows Users)

We have provided a convenient batch script `run-windows.bat` to automate the setup and run the development environment in one click.

#### Step-by-Step Instructions:
1. Locate the [run-windows.bat](file:///run/media/trojan/My%20Files/Web%20Projects/qr-guy.com/run-windows.bat) file in the root of the project directory.
2. **Right-click** on [run-windows.bat](file:///run/media/trojan/My%20Files/Web%20Projects/qr-guy.com/run-windows.bat) and select **"Run as administrator"**.
3. A command prompt window will open. If you did not run it as administrator, it will prompt you for administrative privileges and automatically elevate itself.
4. **What the script does automatically:**
   - Automatically navigates to the project directory.
   - Verifies that Node.js is installed.
   - Installs all project requirements and dependencies (`npm install`).
   - Automatically opens your default web browser to the development site at `http://localhost:4321/qr-guy.com/`.
   - Starts the development server (`npm run dev`).
5. Leave the window open while you work. To shut down the server, simply close the command prompt window or press `Ctrl + C` in it.

---

### 🛠️ Option B: Manual Setup & Build Steps (Cross-platform)

If you are on macOS, Linux, or prefer using the command line manually on Windows, follow these step-by-step instructions.

#### Step 1: Install Dependencies
Open your terminal or command prompt in the project root directory and run the following command to download and install all necessary dependencies:
```bash
npm install
```

#### Step 2: Run the Development Server
To launch the development server, run:
```bash
npm run dev
```
Once the server starts, it will output the local address:
```text
  ┃ Local    http://localhost:4321/qr-guy.com/
```
Open your web browser and navigate manually to `http://localhost:4321/qr-guy.com/` to view and interact with the application. The server features Hot Module Replacement (HMR) and will automatically refresh when you make changes to the files.

#### Step 3: Build the Project for Production
When you are ready to prepare the website for production/deployment, run the build command:
```bash
npm run build
```
This script will:
1. Automatically run the `prebuild` script to clean out any old build directories (`dist/` and `.astro/`).
2. Compile and optimize the entire application using Astro.
3. Output the static production-ready files to the `./dist/` directory.

#### Step 4: Preview the Production Build
To test the generated production build locally before deploying it, run:
```bash
npm run preview
```
This starts a local static file server pointing to the `./dist/` directory so you can confirm everything builds and displays correctly.

---

### 📋 Command Summary Reference

| Command             | Action                                                             |
| :------------------ | :----------------------------------------------------------------- |
| `npm install`       | Installs all project dependencies.                                 |
| `npm run dev`       | Starts the local dev server at `http://localhost:4321/qr-guy.com/`. |
| `npm run build`     | Cleans old files and compiles the production site into `./dist/`.  |
| `npm run preview`   | Previews your local build before deploying.                        |

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
```
## 🛠️ Tech Stack

* **Framework:** [Astro]
* **Styling:** Tailwind CSS
* **Deployment:** Vercel

