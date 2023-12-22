# Steps for Packaging


## Create Project Directory

## Create Package Directory

## Create a Module file

## Writing the package code

## Write a setup.py file in project directory


```
from setuptools import setup, find_packages

setup(
    name='mypackage',
    version='0.1.0',
    author='Your Name',
    author_email='your.email@example.com',
    description='A short description of your package',
    packages=find_packages(),
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
```

## Building the package

```
python setup.py sdist
```

It will create `*.tar.gz` file in `dist/.` directory. The compiled file signature contains
contains the project name and version.


## Uploading the package to PyPi

Now, the specific file compiled with current version can be uploaded to PyPi using `twine`

`twine` can be installed using `pip install twine`


```
	twine upload dist/*.tar.gz
```  

It will ask PyPi username and password, which if not created can be created at pypi.org
