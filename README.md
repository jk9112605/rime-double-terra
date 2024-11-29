# rime-double-terra
本專案是基於 https://github.com/Reniastyc/rime-double-terra 的小鶴雙拼帶聲調輸入法。

## 用於RIME的地球拼音小鶴雙拼方案

基礎字典使用RIME自帶的「地球拼音」，因而支持音調輸入降低重碼，在重碼率不高等情況下，也可以不輸入聲調。

同時以佛振提供的「小鶴雙拼」作爲雙拼方案，使用上，可以完全當作一般的「小鶴雙拼」，僅在有需要的情況下補充聲調。

爲便於聲調輸入計，取消了「,」「.」的翻䈎功能，並調整了聲調輸入，可用的聲調標記總體上與地球拼音一致，如下：

陰平「一聲」：「;」

陽平「二聲」：「/」

上聲「三聲」：「,」

去聲「四聲」：「.」

爲便於特殊符號輸入計，導入了Symbol預設，由上斜線「/」開啓符號輸入，具體編碼碼見symbol.yaml
## 用全拼反查小鶴雙拼碼
使用「`」就可以開啓此功能

## 如何安裝
### 使用 Rime 配置管理器，通過「輸入法設定／獲取更多輸入方案」安裝
在輸入法的圖示按右鍵，選「輸入法設定」點選左下角的「獲取更多輸入方案」
輸入`jk9112605/rime-double-terra`再按Enter安裝
如下所示
```
Enter package name, URL, user/repo or downloaded ZIP to install: jk9112605/rime-double-terra
```
若安裝完成，會再度回到`Enter package name, URL, user/repo or downloaded ZIP to install:`的提示字元
若否，則爲安裝不完成，可參考以下的手動安裝。

無論安裝成功與否，關閉Rime package installer，回到原先的視窗。
安裝成功會出現「小鶴地球雙拼」的方案，打勾，再按「中」即可。

### 手動安裝
將所有文件放入用戶文件夾內，隨後部署即可。


