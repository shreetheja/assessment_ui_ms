echo "starting to deploy to git hub"
del /q deploy\public-flutter\*
del /q build\*
call flutter build web
move build\web\* deploy\public-flutter
cd deploy
git add .
@echo off
set /p msg="Enter Message: "
set dat = date /t
git commit -m "dat: commit message: %msg%"
git push
echo "Completed the Deploy .. at time : %dat%"
