# MkDocks builder

This container is used to compile MkDocs source code to fully functional page.

Main purpose of creating it was to keep one of my web pages up to date.

* Web site source code is kept in GitHub repository.
* After I push canges, workflow is triggered.
* The source gets compiled.
* The compiled files are stored in ./site folder (by default).
* SCP upload task then upload the files to my web server.

## Example workflow
```
name: Site deploy
on:
  push:
    branches: [ main ]
  workflow_dispatch:
jobs:
  upload:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code to workspace
      uses: actions/checkout@v2

    - name: Build MkDocs code
      uses: moonpathbg/mkdocs_builder@latest

    - name: Deploy to web server
      uses: moonpathbg/scp_uploader@latest
      with:
          host: ${{ secrets.HOST }}
          port: ${{ secrets.PORT }}
          username: ${{ secrets.USERNAME }}
          key : ${{ secrets.SSH_KEY }}
          source: "./site/"
          target: "~/"
```
