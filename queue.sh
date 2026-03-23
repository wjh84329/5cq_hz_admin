#!/bin/bash

# 配置部分
QUEUE_PROCESS_NAME="php"  # 你可以根据实际情况修改这个名称，或者使用更具体的命令行参数来识别进程
RESTART_COMMAND="/usr/bin/php /www/wwwroot/hz.5cq.net/think queue:work"  # 启动队列监听器的命令
LOG_FILE="/var/log/queue_monitor.log"  # 日志文件路径
CHECK_INTERVAL=10  # 检查间隔时间（秒）

# 无限循环，持续监控队列进程
while true; do
    # 检查队列进程是否正在运行
    if ! pgrep -x "$QUEUE_PROCESS_NAME" > /dev/null; then
        # 如果进程未运行，则记录日志并尝试重新启动
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Queue process not running, restarting..." >> $LOG_FILE
        nohup $RESTART_COMMAND >> $LOG_FILE 2>&1 &
        # 可选：如果你希望脚本在重启进程后暂停一段时间再检查，可以在这里添加sleep命令
        # sleep $CHECK_INTERVAL_AFTER_RESTART  # 例如，设置重启后等待30秒再检查
    else
        # 如果进程正在运行，则只记录日志（可选）
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Queue process is running." >> $LOG_FILE
    fi
    
    # 等待指定的检查间隔时间
    sleep $CHECK_INTERVAL
done