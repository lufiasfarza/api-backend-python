#!/usr/bin/env python3
"""
Setup script untuk Hybrid VPN API
Force Python detection untuk Railway
"""

from setuptools import setup, find_packages

setup(
    name="hybrid-vpn-api",
    version="1.0.0",
    description="Hybrid VPN API Backend dengan Python Flask",
    author="Lufiasfarza",
    packages=find_packages(),
    install_requires=[
        "Flask==2.3.3",
        "Flask-CORS==4.0.0",
        "gunicorn==21.2.0",
        "Werkzeug==2.3.7",
        "requests==2.31.0"
    ],
    python_requires=">=3.11",
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.11",
    ],
) 