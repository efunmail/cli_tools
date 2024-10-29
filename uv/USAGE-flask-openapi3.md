## UV

```sh
PROJ_DIR=flask-openapi3-elements

mkdir $PROJ_DIR 

echo 3.11 >  .python-versions   
echo 3.10 >> .python-versions   
```

- INIT, specifying *minimum* version 

```sh
uv init -p 3.10 --name 'flask-openapi3-elements-play'
```

- ADD ...

```sh
uv add --dev pipdeptree
```

## flask-openapi3 

https://github.com/luolingchun/flask-openapi3

```sh
uv add "flask-openapi3[elements]"
```

### OpenAPI

https://github.com/luolingchun/flask-openapi3/issues?q=is%3Aissue+is%3Aopen+openapi

- https://github.com/luolingchun/flask-openapi3/issues/163

> Use `app = OpenAPI(__name__)` instead of `app = Flask(__name__)`
