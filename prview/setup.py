"""
     Installation script for DANSE P(r) inversion perspective for SansView
"""

from distutils.core import setup

setup(
    version = "0.9",
    name="prview",
    description = "P(r) inversion perspective for SansView",
    package_dir = {"sans.perspectives":"perspectives",
                   "sans.perspectives.pr":"perspectives/pr"},
    packages = ["sans.perspectives",
                "sans.perspectives.pr"],
    )

