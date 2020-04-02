if [ -z $1 ]
then
    echo "What file bucko?"
    exit 1
fi

sed -e 's/\\pause/\\textbullet/g' -e '1 c \\\\documentclass[12pt, french, handout]{beamer}' -e '2 i \\\\usepackage{pgfpages}' -e '3 i \\\\pgfpagesuselayout{4 on 1}[a4paper,border shrink=5mm,landscape]' < ${1} | xelatex -jobname=${1%.*}.handout
