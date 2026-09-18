#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
# TODO: validate file existence
# TODO: print:
# Total ERROR: <number>
# Top Code: <code>

# 判断有没有传入参数
if [ $# -ne 1 ]; then
    echo "Usage: ./scripts/analyze.sh FILE"
    exit 1
fi

LOG_FILE=$1

# 判断文件是否存在
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: file $LOG_FILE not found"
    exit 1
fi

# 统计 ERROR 总数
total_error=$(grep -c "ERROR" "$LOG_FILE")

# 找出出现最多的错误码 Top Code
top_code=$(grep "ERROR" "$LOG_FILE" | awk '{print $NF}' | cut -d'=' -f2 | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')


echo "Total ERROR: $total_error"
echo "Top Code: $top_code"

exit 0
