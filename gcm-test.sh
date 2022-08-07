#!/bin/bash

ans="/tmp/$$-ans"
result="/tmp/$$-result"

#正常入力チェック
#割り切れる
#パターン1
echo "12"  > ${ans}
./gcm.sh 60 5 > ${result}
diff ${ans} ${result} || exit 1
#パターン2
echo "12" > ${ans}
./gcm.sh 60 12 > ${result}
diff ${ans} ${result} || exit 1
#パターン3
echo "12" > ${ans}
./gcm.sh 12 60 > ${result}
diff ${ans} ${result} || exit 1
#互いに素
echo "1" > ${ans}
./gcm.sh 25 12 > ${result}
diff ${ans} ${result} || exit 1
#$1=0 && $2=0
echo "0" > ${ans}
./gcm.sh 0 0 > ${result}
diff ${ans} ${result} || exit 1

#異常入力チェック
#文字列
echo "helloは自然数ではありません" > ${ans}
./gcm.sh hello 0 > ${result}
diff ${ans} ${result} || exit 1
#小数
echo "1.2は自然数ではありません" > ${ans}
./gcm.sh 1.2 2 > ${result}
diff ${ans} ${result} || exit 1

#負の整数
echo "-4は自然数ではありません" > ${ans}
./gcm.sh -4 2 > ${result}
diff ${ans} ${result} || exit 1

#入力1個
echo "引数は2個入力してください" > ${ans}
./gcm.sh 1 > ${result}
diff ${ans} ${result} || exit 1
#入力なし
echo "引数は2個入力してください" > ${ans}
./gcm.sh > ${result}
diff ${ans} ${result} || exit 1

rm /tmp/$$-*
