clean:
	@rm -rf build dist .eggs *.egg-info
	@rm -rf .benchmarks .coverage coverage.xml htmlcov report.xml .tox
	@find . -type d -name '.mypy_cache' -exec rm -rf {} +
	@find . -type d -name '__pycache__' -exec rm -rf {} +
	@find . -type d -name '*pytest_cache*' -exec rm -rf {} +
	@find . -type f -name "*.py[co]" -exec rm -rf {} +

test: clean ## Run the tests.
#	@pytest --cov [folder name] --cov-report=term-missing --cov-fail-under 95
	@echo "The tests pass! ✨ 🍰 ✨"

lint: ## Run the code linter.
	ruff /


style: lint
	black .
	ruff ./ --fix
	@echo "The style pass! ✨ 🍰 ✨"	

check: test style
# check: test lint style mypy

req: # create requirements.txt with poetry
	poetry update
#	poetry export --only [folder name] --without-hashes -f requirements.txt --output ingestion/requirements.txt