echo "starting to deploy to git hub"
call wsl rm -r -f ./deploy/public-flutter/*
call wsl rm -r -f ./build/*
call flutter clean
call flutter build web
call wsl mv ./build/web/* ./deploy/public-flutter
cd deploy
call wsl rm -r -f ./public-flutter/icons
call wsl cp -r ./icons ./public-flutter/
git add .
@echo off
set /p msg="Enter Message: "
git commit -m "%dat%: commit message: %msg%"
git push
echo "Completed the Deploy .. at time : %dat%"
echo "Fixing Repo ... "
cd ..
call dart pub upgrade
