#automating local git creation
#!/bin/bash
git init
git add .
echo ENTER COMMIT MESSAGE:
read commitMessage
git commit -m "$commitMessage"
git branch -M main
echo ENTER REMOTE REPO LINK:
read remoteRepo
git remote add origin $remoteRepo
git push -u origin main