#!/bin/bash
:<< 'END'
* 프로젝트 트리 구조 찾기 스크립트
* TreeSearch.sh "{제외할 프로젝트 디렉토리 및 파일}" "{찾는 프로젝트 디렉토리}" "{저장할 위치 및 파일 이름}" 
 -d 디렉터리만 표시
 -f 파일의 전체 경로 표시
 -I 특정 디렉터리 제외
END


tree -d -I $1 $2 > $3
cat TreeSearchResult.txt
