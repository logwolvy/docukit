# Docukit
An out-of-box VSCode setup to preview/convert markdown documents.
- Live preview of markdown documents in VSCode.
- Conversion to HTML, PDF, Word (Docx), images and more.
- No hassle of installing dependencies/libraries.

It sets up [markdown preview enhanced](https://github.com/shd101wyy/markdown-preview-enhanced) and other dependencies (pandoc, plantuml, imagemagick etc.) using [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) or [Github Codespaces](https://github.com/features/codespaces) for a ready to use document editor/renderer.

## System Requirements
Supports all major platforms (Windows/MacOS/Linux) running -
- VS Code
- Docker

## Usage
1. `git clone https://github.com/logwolvy/docukit.git`
2. Open docukit repo in vscode
3. If not installed already, install the recommended extension, i.e. Remote - Containers
4. Click 'Reopen in Container'
5. Voila! You can now create/edit docs in the `docs` directory

## Supported Workflows
#### 1. Env file
(Recommended when your docs live across multiple directories/repositories)
1. Create a .env file in this project's root, `touch .env`
2. Add `DOCS_PATH=/path/to/your/project/docs` to the .env file
3. Your specified `DOCS_PATH` will be mounted instead of default dir (i.e. `docs`)

**Tip:** You can specify multiple projects in `.env` file and simply, uncomment the one you intend to work on.

Example .env file -
```sh
DOCS_PATH=/path/to/my/project/docs
# DOCS_PATH=/path/to/another/project/docs
# DOCS_PATH=/path/to/some/project/docs
```

#### 2. Docs directory (default)
If `.env` file doesn't exist or no `DOCS_PATH` is set in the `.env` file, the `docs` directory is used/mounted by default.

## Upgrade
```bash
cd /path/to/docukit
git pull
```

## Support/Contribution
Please create an issue/PR if there is something you want added in this setup, example - latex, matplotlib support etc.
