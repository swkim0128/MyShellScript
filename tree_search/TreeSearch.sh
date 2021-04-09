#!/bin/bash
:<< 'END'
* 프로젝트 트리 구조 찾기 스크립트
* TreeSearch.sh "{제외할 프로젝트 디렉토리 및 파일}" "{찾는 프로젝트 디렉토리}" "{저장할 위치 및 파일 이름}" 
 -d 디렉터리만 표시
 -f 파일의 전체 경로 표시
 -I 특정 디렉터리 제외
END

currentPath=$( pwd )
options=( `cat ${currentPath}/TreeSearchOption.txt` )

option=${options[0]}
exception=${options[1]}
level=${options[2]}

if [[ ${exception} = "" && ${level} = "" ]]; then
	tree -${option} ${1} > ${2}
	echo "2 exception"
elif [[ ${level} = "" ]]; then
	tree -${option} ${exception} ${1} > ${2}
	echo "level exception"
elif [[ ${exception} = "" ]]; then
	tree -${option} ${level} ${1} > ${2}
	echo "exception excep"
fi

cat TreeSearchResult.txt
