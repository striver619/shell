#!/bin/bash

ps -ef | grep -v "grep" | grep "process_name" | awk '{print $2}' | xargs kill -9
