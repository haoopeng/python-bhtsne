
all:
	python setup.py build_ext --inplace

.PHONY: clean
clean:
	rm -f bhtsne/wrapper.cpp
	rm -f bhtsne/wrapper.so

.PHONY: test
test:
	cd test; PYTHONPATH="../" python -m unittest tsne

.PHONY: package
package:
	rm -Rf dist
	python setup.py sdist
	python setup.py bdist_wheel

.PHONY: release
release:
	twine upload dist/*
