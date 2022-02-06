#!/bin/bash

echo "Starting build process..."
/usr/bin/mkdocs build || exit 1
echo "Build process completed."

