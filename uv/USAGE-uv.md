## Docs

"Getting Started - Features" - https://docs.astral.sh/uv/getting-started/features/

### PYTHON

```sh
uv python list
```

```sh
uv python install 3.10

Searching for Python versions matching: Python 3.10
cpython-3.10.15-linux-x86_64-gnu ... /19.57 MiB
```

### VENV

- Create a VENV in a 'Python project' dir

```sh
uv venv -p 3.10

Using CPython 3.10.15
Creating virtual environment at: .venv
Activate with: source .venv/bin/activate
```

### INIT

```sh
uv init -p 3.10 --name play_flask
```

- Files (and dir)...

```tree
.git/
.gitignore

.python-version
README.md
pyproject.toml
```

### ADD

```sh
uv add --dev pipdeptree

uv add  flask

uv add  litestar uvicorn  advanced-alchemy aiosqlite  pydantic
```

### RUN

```sh
uv run  pipdeptree

uv run  flask --help

uv run  litestar --app-dir src --app sqla_async.app:app  routes
uv run  litestar --app-dir src --app sqla_async.app:app  run --port 7000
```
