# rime-double-terra
2024/11/9
新增了用全拼反查小鶴雙拼碼

2024年3月9日，更新了基于小鶴雙拼的地球拼音雙拼方案

## 用於RIME的地球拼音自然碼/小鶴雙拼方案

基礎字典使用RIME自帶的「地球拼音」，因而支持音調輸入降低重碼，在重碼率不高等情況下，也可以不輸入聲調。

同時以佛振提供的「自然碼雙拼」和「小鶴雙拼」作爲雙拼方案，使用上，可以完全當作一般的「自然碼雙拼」或「小鶴雙拼」，僅在有需要的情況下補充聲調。

爲便於聲調輸入計，取消了「,」「.」的翻䈎功能，並調整了聲調輸入，可用的聲調標記總體上與地球拼音一致，如下：

陰平「一聲」：「;」

陽平「二聲」：「/」

上聲「三聲」：「,」

去聲「四聲」：「.」

爲便於特殊符號輸入計，導入了Symbol預設，由上斜線「/」開啓符號輸入，具體編碼碼見symbol.yaml
## 用全拼反查小鶴雙拼碼
使用「`」就可以開啓此功能

## 依賴於Lua腳本的功能

### 全半角符號註釋

當輸入腳本內包含的符號之一時，將依據預設給出其屬於全角或半角的註釋，如圖：

![图片](https://user-images.githubusercontent.com/37499529/150643557-60e7cdf1-2ce1-4b2f-90b0-bbbee074b955.png)

 如要自行增加支持註釋的符號碼請修改「\lua\RdeEM\hfcom.lua」中的如下代碼段。
 需要註釋爲全角的符號：
 
 ```lua
 local full_sym = {
    "，", "。", "、", "・", "｜", "／", "＼", "［", "］", "～", "｛", "｝"
}
```
依照前例在花括號內添加即可。
需要註釋爲半角的符號則在：
```lua
local half_sym = {
    ",", ".", "､", "·", "|", "/", "\\", "[", "]", "~", "{", "}"
}
```
依照前例在花括號內添加即可。

### 以詞定字功能

常規的以詞定字功能通常使用方括號定出首選詞的首位字，受限於機制，對於需要藉由多字詞確定的字或是不在首選位的詞則不便處理，因此將其改進爲：

「使用特定符號觸發，觸發後將原本的詞組拆成一系列單字並列於候選列表中。」

該腳本所用的觸發符號爲半角問號「?」，即「Shift + /」，在輸入一串編碼後加上半角問號，即可進入以詞定字模式，如圖所示。
 ![图片](https://user-images.githubusercontent.com/37499529/150643885-6e70e25b-1ed9-46e7-b80a-7d86cc7e1587.png)
 ![图片](https://user-images.githubusercontent.com/37499529/150643899-a08f678e-a460-4de9-8165-a9edf8f37c93.png)

## 如何安裝
### 手動安裝
如果未安裝過任何依賴Lua腳本的輸入方案，則將所有文件放入用戶文件夾內，隨後部署即可。

如果安裝過依賴Lua腳本的輸入方案，或正在使用依賴Lua腳本的輸入方案，則需按如下步驟進行：

1、將該方案中rime.lua文件內的所有代碼複製到現有的rime.lua中

2、將其他文件放入用戶文件夾內

需要注意的是，不要改變現有的文件夾結構，即：lua文件夾須在用戶文件夾內，RdeEM文件夾則須在lua文件夾內。

### 自動線上安裝
用PowerShell執行Install-rime-double-terra.ps1即可
