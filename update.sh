#!/bin/bash
#
# created by ice1000 at 2017/3/26
#

echo ":: building Chinese version"

make zh >> make-zh.log

echo ":: building English version"

make en >> make-en.log

echo ":: removing useless files"

rm -f *~
rm -f *.log
rm -f *.aux
rm -f *.out

echo ":: committing changes"

rm -rf .git
git init
git remote add origin git@github.com:imkiva/resume.git
git add .
git commit -a -m "refresh everything at: $(date)" >> commit.log

echo ":: pushing, please wait"

git push -u origin main -f

echo ":: all tasks done"

rm -f *.log
