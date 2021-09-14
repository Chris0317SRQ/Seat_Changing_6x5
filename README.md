# Seat_Changing_6x5
>Draw Straw, Random Change Seat, Export to CSV

專案目的: 
1. 感謝在成功高中三年來影響我最深，總是盡力幫助我的班導
2. 希望他能成為老師帶資優班的優良工具
3. 模擬並記錄身為數學老師的班導特殊的排座位方式: Old Fashioned Way

## Author and contact information
- Name: 洪宇辰 Chris
- Email: hyuchen869@gmail.com
- Age: 18
- Job: 國家太空計畫 衛星實習工程師
- Projects: 玉山立方衛星計畫、以球型馬達實踐機構可重新配置機器人、AIoT War Machine、FRC: Lidar and its algorithms
- Competitions:
![image](https://user-images.githubusercontent.com/45451908/133213859-775bcdec-db21-4828-96f5-2b1d653c2977.png)


## Features
1. 可以輸出成兩種方向排列的.csv，以時間為判斷基準自動匯入.csv，之後會加.txt記錄檔名
2. 抽籤(Random Shuffle Vector twice)且可以圖示其座位位置
3. 有兩種Random
 - 以time作為seed，random shuffle兩次
 - Random base position-->加特定號碼，例如月份，依序排入
4. 另外指定位置，更改位置對應的號碼都沒問題

## 抽籤且圖示座位位置
![image](https://user-images.githubusercontent.com/45451908/133122590-ea41eb07-cf7d-4320-b9f9-4454b382511c.png)

## Export to CSV
> **注意事項**
1. Seat-month().csv為讀入檔，請勿隨意更改檔名及移出資料夾
2. Print-month()-(time()).csv為適合放於講桌的檔案，可以隨意更改檔名及移出資料夾，但請勿改為Seat-month().csv形式
3. 原始設定為每個月月初換一次位置，可能因為放假或其他因素而調整，因此day()<15會輸出為該月的座位表，Ex:9/14,9/1
4. 若day()≥15則會輸出為下個月座位表
5. 檔案皆會存於 RandomSat Folder


### a. 適合秀在電子白板或投影幕的版本
![image](https://user-images.githubusercontent.com/45451908/133123195-b33f6f18-da05-4ee2-9745-364c5e577525.png)

### b. 適合放於講桌的版本
![image](https://user-images.githubusercontent.com/45451908/133123462-54e5e60a-928d-4514-93af-6fd4f6528d4f.png)

## 操作
> 使用 RYBG按鈕

### R
1. CSV Export
2. CSV Import

### Y
1. 以time作為seed，random shuffle兩次
2. Random base position-->加特定號碼，例如月份，依序排入
### G
1. 抽籤
2. 歸零

## B
1. Confirm
2. Messages


