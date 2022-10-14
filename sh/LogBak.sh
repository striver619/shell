# 根据日期备份日志文件到不同文件夹中

#!/bin/sh
TODAY_DATE=`date -d "day ago" +"%Y%m%d"`;
if [  -d /home/zazt/yuanxun/ATOSLog ]
 then mkdir -p /home/zazt/yuanxun/ATOSLog/bak-${TODAY_DATE};
find /home/zazt/yuanxun/ATOSLog -type f -name '*.json' -not -path "/home/zazt/yuanxun/ATOSLog/bak-${TODAY_DATE}*"  -exec mv {} /home/zazt/yuanxun/ATOSLog/bak-${TODAY_DATE} \;
fi

if [  -d /home/zazt/yuanxun20002/ATOSLog ]
 then mkdir -p /home/zazt/yuanxun20002/ATOSLog/bak-${TODAY_DATE};
find /home/zazt/yuanxun20002/ATOSLog -type f -name '*.sh' -not -path "/home/zazt/yuanxun20002/ATOSLog/bak-${TODAY_DATE}*"  -exec mv {} /home/zazt/yuanxun20002/ATOSLog/bak-${TODAY_DATE} \;
fi


if [  -d /home/zazt/card/ATOSLog ]
 then mkdir -p /home/zazt/card/ATOSLog/bak-${TODAY_DATE};
find /home/zazt/card/ATOSLog -type f -name '*.sh' -not -path "/home/zazt/card/ATOSLog/bak-${TODAY_DATE}*"  -exec mv {} /home/zazt/card/ATOSLog/bak-${TODAY_DATE} \;
fi


if [  -d /home/zazt/review/ATOSLog ]
 then mkdir -p /home/zazt/review/ATOSLog/bak-${TODAY_DATE};
find /home/zazt/review/ATOSLog -type f -name '*.sh' -not -path "/home/zazt/review/ATOSLog/bak-${TODAY_DATE}*"  -exec mv {} /home/zazt/review/ATOSLog/bak-${TODAY_DATE} \;
fi


if [  -d /home/zazt/BackgroundCheck/ATOSLog ]
 then mkdir -p /home/zazt/BackgroundCheck/ATOSLog/bak-${TODAY_DATE};
find /home/zazt/BackgroundCheck/ATOSLog -type f -name '*.sh' -not -path "/home/zazt/BackgroundCheck/ATOSLog/bak-${TODAY_DATE}*"  -exec mv {} /home/zazt/BackgroundCheck/ATOSLog/bak-${TODAY_DATE} \;
fi


# =========================================================  #

#!/bin/sh
MONTH_DATE=`date -d "day ago" +"%Y%m"`;
if [  -d /home/zazt/yuanxun/ATOSLog ]
 then mkdir -p /home/zazt/yuanxun/ATOSLog/month-bak-${MONTH_DATE};
 mv /home/zazt/yuanxun/ATOSLog/bak-* /home/zazt/yuanxun/ATOSLog/month-bak-${MONTH_DATE};
fi

MONTH_DATE=`date -d "day ago" +"%Y%m"`;
if [  -d /home/zazt/yuanxun20002/ATOSLog ]
 then mkdir -p /home/zazt/yuanxun20002/ATOSLog/month-bak-${MONTH_DATE};
 mv /home/zazt/yuanxun20002/ATOSLog/bak-* /home/zazt/yuanxun20002/ATOSLog/month-bak-${MONTH_DATE};
fi

MONTH_DATE=`date -d "day ago" +"%Y%m"`;
if [  -d /home/zazt/card/ATOSLog ]
 then mkdir -p /home/zazt/card/ATOSLog/month-bak-${MONTH_DATE};
 mv /home/zazt/card/ATOSLog/bak-* /home/zazt/card/ATOSLog/month-bak-${MONTH_DATE};
fi

MONTH_DATE=`date -d "day ago" +"%Y%m"`;
if [  -d /home/zazt/review/ATOSLog ]
 then mkdir -p /home/zazt/review/ATOSLog/month-bak-${MONTH_DATE};
 mv /home/zazt/review/ATOSLog/bak-* /home/zazt/review/ATOSLog/month-bak-${MONTH_DATE};
fi

MONTH_DATE=`date -d "day ago" +"%Y%m"`;
if [  -d /home/zazt/BackgroundCheck/ATOSLog ]
 then mkdir -p /home/zazt/BackgroundCheck/ATOSLog/month-bak-${MONTH_DATE};
 mv /home/zazt/BackgroundCheck/ATOSLog/bak-* /home/zazt/BackgroundCheck/ATOSLog/month-bak-${MONTH_DATE};
fi


# 每月1号执行             0 0 1 * *       command


