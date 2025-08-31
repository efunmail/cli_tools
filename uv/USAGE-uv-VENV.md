- My 'Python projects' dir

```sh
mkdir ~/py_projects
cd ~/py_projects
```

- Init

```sh
uv init --bare flask-play
cd flask-play
```

- Specify **VENV** location (default: `./venv/`)

    - ["Different virtual environments..."](https://stackoverflow.com/a/79365815)
    - NOTE: `export UV_PROJECT_ENVIRONMENT=...`

```sh
export UV_PROJECT_ENVIRONMENT=$HOME/uv_venvs/flask-play


uv add --dev pipdeptree
uv add flask


uv run pipdeptree
uv run flask --app webapp routes
```
