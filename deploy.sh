#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  cd public
  git add .
  echo "running: git commit --message \"Travis build: $TRAVIS_BUILD_NUMBER\""
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  echo "running: git remote add origin-page https://${GH_TOKEN}@github.com/magarcia/magarcia.github.io.git > /dev/null 2>&1"
  git remote add origin-page https://${GH_TOKEN}@github.com/magarcia/magarcia.github.io.git > /dev/null 2>&1
  echo "running: git push --quiet --set-upstream origin-page master"
  git push --quiet --set-upstream origin-page master 
}

setup_git
commit_website_files
upload_files