
# -*- coding: utf-8 -*-

# DO NOT EDIT THIS FILE!
# This file has been autogenerated by dephell <3
# https://github.com/dephell/dephell

try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

readme = ''

setup(
    long_description=readme,
    name='springer_free_books',
    version='0.1.0',
    python_requires='==3.*,>=3.7.0',
    author='Vikash Kothary',
    author_email='kothary.vikash@gmail.com',
    packages=[],
    package_dir={"": "."},
    package_data={},
    install_requires=['openpyxl==3.*,>=3.0.3', 'pandas==1.*,>=1.0.3', 'requests==2.*,>=2.23.0', 'tqdm==4.*,>=4.45.0', 'xlrd==1.*,>=1.2.0'],
    extras_require={"dev": ["dephell==0.*,>=0.8.2"]},
)
