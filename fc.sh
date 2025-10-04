#automated shell script to create and open flutter project in android studio
#!/bin/bash
cd /e/
cd try_n_catch/
echo ENTER PROJECT NAME[]:
read name;
flutter create --empty $name
cd $name
studio64 .