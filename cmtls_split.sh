#!/bin/bash

cd ~/Sites/github

git clone https://github.com/communitytools/Community-Tools.git
git clone --no-hardlinks Community-Tools cmtls
git clone --no-hardlinks Community-Tools cmtls_theme
git clone --no-hardlinks Community-Tools cmtls_profile

cd cmtls
git filter-branch --subdirectory-filter cmtls HEAD
git reset --hard
git gc --aggressive
git prune
git remote rm origin
git remote add origin git@github.com:kristjanjansen/cmtls.git
git push origin master --force
cd ..

cd cmtls_theme
git filter-branch --subdirectory-filter cmtls_theme HEAD
git reset --hard
git gc --aggressive
git prune
git remote rm origin
git remote add origin git@github.com:kristjanjansen/cmtls_theme.git
git push origin master --force
cd ..

cd cmtls_profile
git filter-branch --subdirectory-filter profiles/cmtls HEAD
git reset --hard
git gc --aggressive
git prune
git remote rm origin
git remote add origin git@github.com:kristjanjansen/cmtls_profile.git
git push origin master --force
cd ..

sudo rm -R Community-Tools
sudo rm -R cmtls
sudo rm -R cmtls_theme
sudo rm -R cmtls_profile
