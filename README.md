# srtcat
cat two or more srt files (movie subtitles)

# usage
sh srtcat.sh [-t timespan] file1 file2 ...

# note
only support 1 line subtitle, multi-line are not supported now, 
but simply modify several code, it can support, I will do that if someone ask me to do..

# test
```
> sh srtcat.sh data/220808-114*.srt > data/220808.txt
timespan between file is: 1000 ms
handle file 220808-114030.srt
base time: 0:0:0,0; base ord: 0
sub record index 2, supplement a carrier return
time add: 0:2:51,80 + 0:0:0,1000 = 0:2:52,80
last time: 0:2:52,80; last ord: 53
handle file 220808-114613.srt
base time: 0:2:52,80; base ord: 53
time add: 0:0:0,0 + 0:2:52,80 = 0:2:52,80
time add: 0:0:7,80 + 0:2:52,80 = 0:2:59,160
time add: 0:0:7,80 + 0:2:52,80 = 0:2:59,160
time add: 0:0:9,480 + 0:2:52,80 = 0:3:1,560
time add: 0:0:9,480 + 0:2:52,80 = 0:3:1,560
time add: 0:0:12,720 + 0:2:52,80 = 0:3:4,800
time add: 0:0:12,720 + 0:2:52,80 = 0:3:4,800
time add: 0:0:15,80 + 0:2:52,80 = 0:3:7,160
time add: 0:0:15,80 + 0:2:52,80 = 0:3:7,160
time add: 0:0:17,360 + 0:2:52,80 = 0:3:9,440
time add: 0:0:17,360 + 0:2:52,80 = 0:3:9,440
time add: 0:0:21,240 + 0:2:52,80 = 0:3:13,320
time add: 0:0:21,240 + 0:2:52,80 = 0:3:13,320
time add: 0:0:27,120 + 0:2:52,80 = 0:3:19,200
time add: 0:0:27,120 + 0:2:52,80 = 0:3:19,200
time add: 0:0:31,440 + 0:2:52,80 = 0:3:23,520
time add: 0:0:31,440 + 0:2:52,80 = 0:3:23,520
time add: 0:0:35,800 + 0:2:52,80 = 0:3:27,880
time add: 0:0:35,800 + 0:2:52,80 = 0:3:27,880
time add: 0:0:40,200 + 0:2:52,80 = 0:3:32,280
time add: 0:0:40,200 + 0:2:52,80 = 0:3:32,280
time add: 0:0:41,920 + 0:2:52,80 = 0:3:34,0
time add: 0:0:41,920 + 0:2:52,80 = 0:3:34,0
time add: 0:0:48,40 + 0:2:52,80 = 0:3:40,120
time add: 0:0:48,40 + 0:2:52,80 = 0:3:40,120
time add: 0:0:50,680 + 0:2:52,80 = 0:3:42,760
time add: 0:0:50,680 + 0:2:52,80 = 0:3:42,760
time add: 0:0:54,840 + 0:2:52,80 = 0:3:46,920
time add: 0:0:54,840 + 0:2:52,80 = 0:3:46,920
time add: 0:0:56,600 + 0:2:52,80 = 0:3:48,680
time add: 0:0:56,600 + 0:2:52,80 = 0:3:48,680
time add: 0:1:0,720 + 0:2:52,80 = 0:3:52,800
time add: 0:1:0,720 + 0:2:52,80 = 0:3:52,800
time add: 0:1:5,239 + 0:2:52,80 = 0:3:57,319
time add: 0:1:5,239 + 0:2:52,80 = 0:3:57,319
time add: 0:1:8,160 + 0:2:52,80 = 0:4:0,240
time add: 0:1:8,160 + 0:2:52,80 = 0:4:0,240
time add: 0:1:11,920 + 0:2:52,80 = 0:4:4,0
time add: 0:1:11,920 + 0:2:52,80 = 0:4:4,0
time add: 0:1:14,800 + 0:2:52,80 = 0:4:6,880
time add: 0:1:14,800 + 0:2:52,80 = 0:4:6,880
time add: 0:1:17,920 + 0:2:52,80 = 0:4:10,0
time add: 0:1:17,920 + 0:2:52,80 = 0:4:10,0
time add: 0:1:19,720 + 0:2:52,80 = 0:4:11,800
time add: 0:1:19,720 + 0:2:52,80 = 0:4:11,800
time add: 0:1:24,160 + 0:2:52,80 = 0:4:16,240
time add: 0:1:24,160 + 0:2:52,80 = 0:4:16,240
time add: 0:1:25,80 + 0:2:52,80 = 0:4:17,160
time add: 0:1:25,80 + 0:2:52,80 = 0:4:17,160
time add: 0:1:34,720 + 0:2:52,80 = 0:4:26,800
time add: 0:1:34,720 + 0:2:52,80 = 0:4:26,800
time add: 0:1:37,760 + 0:2:52,80 = 0:4:29,840
time add: 0:1:37,760 + 0:2:52,80 = 0:4:29,840
time add: 0:1:41,160 + 0:2:52,80 = 0:4:33,240
time add: 0:1:41,160 + 0:2:52,80 = 0:4:33,240
time add: 0:1:44,960 + 0:2:52,80 = 0:4:37,40
time add: 0:1:44,960 + 0:2:52,80 = 0:4:37,40
time add: 0:1:46,960 + 0:2:52,80 = 0:4:39,40
time add: 0:1:46,960 + 0:2:52,80 = 0:4:39,40
time add: 0:1:50,360 + 0:2:52,80 = 0:4:42,440
time add: 0:1:50,360 + 0:2:52,80 = 0:4:42,440
time add: 0:1:52,480 + 0:2:52,80 = 0:4:44,560
time add: 0:1:52,480 + 0:2:52,80 = 0:4:44,560
time add: 0:1:54,560 + 0:2:52,80 = 0:4:46,640
time add: 0:1:54,560 + 0:2:52,80 = 0:4:46,640
time add: 0:1:57,960 + 0:2:52,80 = 0:4:50,40
time add: 0:1:57,960 + 0:2:52,80 = 0:4:50,40
time add: 0:2:0,280 + 0:2:52,80 = 0:4:52,360
time add: 0:2:0,280 + 0:2:52,80 = 0:4:52,360
time add: 0:2:3,720 + 0:2:52,80 = 0:4:55,800
time add: 0:2:3,720 + 0:2:52,80 = 0:4:55,800
time add: 0:2:8,759 + 0:2:52,80 = 0:5:0,839
time add: 0:2:8,759 + 0:2:52,80 = 0:5:0,839
time add: 0:2:11,880 + 0:2:52,80 = 0:5:3,960
time add: 0:2:11,880 + 0:2:52,80 = 0:5:3,960
time add: 0:2:16,480 + 0:2:52,80 = 0:5:8,560
time add: 0:2:16,480 + 0:2:52,80 = 0:5:8,560
time add: 0:2:19,80 + 0:2:52,80 = 0:5:11,160
time add: 0:2:19,80 + 0:2:52,80 = 0:5:11,160
time add: 0:2:21,0 + 0:2:52,80 = 0:5:13,80
time add: 0:2:21,0 + 0:2:52,80 = 0:5:13,80
time add: 0:2:23,760 + 0:2:52,80 = 0:5:15,840
time add: 0:2:23,760 + 0:2:52,80 = 0:5:15,840
time add: 0:2:27,840 + 0:2:52,80 = 0:5:19,920
time add: 0:2:27,840 + 0:2:52,80 = 0:5:19,920
time add: 0:2:31,400 + 0:2:52,80 = 0:5:23,480
time add: 0:2:31,400 + 0:2:52,80 = 0:5:23,480
time add: 0:2:32,800 + 0:2:52,80 = 0:5:24,880
time add: 0:2:32,800 + 0:2:52,80 = 0:5:24,880
time add: 0:2:35,120 + 0:2:52,80 = 0:5:27,200
time add: 0:2:35,120 + 0:2:52,80 = 0:5:27,200
time add: 0:2:40,960 + 0:2:52,80 = 0:5:33,40
sub record index 2, supplement a carrier return
time add: 0:5:33,40 + 0:0:0,1000 = 0:5:34,40
last time: 0:5:34,40; last ord: 99
handle file 220808-114838.srt
base time: 0:5:34,40; base ord: 99
time add: 0:0:0,0 + 0:5:34,40 = 0:5:34,40
time add: 0:0:4,80 + 0:5:34,40 = 0:5:38,120
time add: 0:0:4,80 + 0:5:34,40 = 0:5:38,120
time add: 0:0:6,720 + 0:5:34,40 = 0:5:40,760
time add: 0:0:6,720 + 0:5:34,40 = 0:5:40,760
time add: 0:0:8,720 + 0:5:34,40 = 0:5:42,760
time add: 0:0:8,720 + 0:5:34,40 = 0:5:42,760
time add: 0:0:11,680 + 0:5:34,40 = 0:5:45,720
time add: 0:0:11,680 + 0:5:34,40 = 0:5:45,720
time add: 0:0:13,560 + 0:5:34,40 = 0:5:47,600
time add: 0:0:13,560 + 0:5:34,40 = 0:5:47,600
time add: 0:0:16,440 + 0:5:34,40 = 0:5:50,480
time add: 0:0:16,440 + 0:5:34,40 = 0:5:50,480
time add: 0:0:19,160 + 0:5:34,40 = 0:5:53,200
time add: 0:0:19,160 + 0:5:34,40 = 0:5:53,200
time add: 0:0:23,600 + 0:5:34,40 = 0:5:57,640
time add: 0:0:23,600 + 0:5:34,40 = 0:5:57,640
time add: 0:0:27,920 + 0:5:34,40 = 0:6:1,960
time add: 0:0:27,920 + 0:5:34,40 = 0:6:1,960
time add: 0:0:30,600 + 0:5:34,40 = 0:6:4,640
time add: 0:0:30,600 + 0:5:34,40 = 0:6:4,640
time add: 0:0:35,920 + 0:5:34,40 = 0:6:9,960
time add: 0:0:35,920 + 0:5:34,40 = 0:6:9,960
time add: 0:0:37,560 + 0:5:34,40 = 0:6:11,600
time add: 0:0:37,560 + 0:5:34,40 = 0:6:11,600
time add: 0:0:41,0 + 0:5:34,40 = 0:6:15,40
time add: 0:0:41,0 + 0:5:34,40 = 0:6:15,40
time add: 0:0:43,320 + 0:5:34,40 = 0:6:17,360
time add: 0:0:43,320 + 0:5:34,40 = 0:6:17,360
time add: 0:0:51,0 + 0:5:34,40 = 0:6:25,40
time add: 0:0:51,0 + 0:5:34,40 = 0:6:25,40
time add: 0:0:52,720 + 0:5:34,40 = 0:6:26,760
time add: 0:0:52,720 + 0:5:34,40 = 0:6:26,760
time add: 0:0:55,0 + 0:5:34,40 = 0:6:29,40
time add: 0:0:55,0 + 0:5:34,40 = 0:6:29,40
time add: 0:0:57,40 + 0:5:34,40 = 0:6:31,80
time add: 0:0:57,40 + 0:5:34,40 = 0:6:31,80
time add: 0:0:59,40 + 0:5:34,40 = 0:6:33,80
time add: 0:0:59,40 + 0:5:34,40 = 0:6:33,80
time add: 0:1:2,720 + 0:5:34,40 = 0:6:36,760
time add: 0:1:2,720 + 0:5:34,40 = 0:6:36,760
time add: 0:1:6,0 + 0:5:34,40 = 0:6:40,40
time add: 0:1:6,0 + 0:5:34,40 = 0:6:40,40
time add: 0:1:8,600 + 0:5:34,40 = 0:6:42,640
time add: 0:1:8,600 + 0:5:34,40 = 0:6:42,640
time add: 0:1:12,320 + 0:5:34,40 = 0:6:46,360
time add: 0:1:12,320 + 0:5:34,40 = 0:6:46,360
time add: 0:1:14,880 + 0:5:34,40 = 0:6:48,920
time add: 0:1:14,880 + 0:5:34,40 = 0:6:48,920
time add: 0:1:19,560 + 0:5:34,40 = 0:6:53,600
time add: 0:1:19,560 + 0:5:34,40 = 0:6:53,600
time add: 0:1:23,880 + 0:5:34,40 = 0:6:57,920
time add: 0:1:23,880 + 0:5:34,40 = 0:6:57,920
time add: 0:1:26,240 + 0:5:34,40 = 0:7:0,280
time add: 0:1:26,240 + 0:5:34,40 = 0:7:0,280
time add: 0:1:27,920 + 0:5:34,40 = 0:7:1,960
time add: 0:1:27,920 + 0:5:34,40 = 0:7:1,960
time add: 0:1:31,120 + 0:5:34,40 = 0:7:5,160
time add: 0:1:31,120 + 0:5:34,40 = 0:7:5,160
time add: 0:1:33,160 + 0:5:34,40 = 0:7:7,200
time add: 0:1:33,160 + 0:5:34,40 = 0:7:7,200
time add: 0:1:37,840 + 0:5:34,40 = 0:7:11,880
time add: 0:1:37,840 + 0:5:34,40 = 0:7:11,880
time add: 0:1:39,440 + 0:5:34,40 = 0:7:13,480
time add: 0:1:39,440 + 0:5:34,40 = 0:7:13,480
time add: 0:1:41,520 + 0:5:34,40 = 0:7:15,560
time add: 0:1:41,520 + 0:5:34,40 = 0:7:15,560
time add: 0:1:42,80 + 0:5:34,40 = 0:7:16,120
sub record index 2, supplement a carrier return
time add: 0:7:16,120 + 0:0:0,1000 = 0:7:17,120
last time: 0:7:17,120; last ord: 133
```

after generate 220808.txt, using following commnad to see if two files are same:
```
cd data
vimdiff 220808.txt 220808.srt
```
220808.srt is generated by SrtEdit

# see detail
[https://www.cnblogs.com/goodcitizen/p/concat_srt_files_by_shell_scripts.html](https://www.cnblogs.com/goodcitizen/p/concat_srt_files_by_shell_scripts.html)

# sponsorship
buy me a cup of tea, I may motivated to develop a new version, which support multi-line subtitles..

<img src="https://files-cdn.cnblogs.com/files/goodcitizen/wepay.bmp?t=1675132801" width = "400" alt="wechatpay" align=center />
