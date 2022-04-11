#!bin/bash
echo "Starting to Deploy to git hub"
flutter build web
mv ./build/web ./deploy/public-flutter
cd ./deploy
git add .
read -p "Enter the message over here: " message
git commit -m "${date}: Deployement with message: $message "
git push
echo "Completed the Deploy .. at time : ${date}"
