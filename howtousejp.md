# Nintendo Swich版 Yaba Sanshiro

**Nintendo Swich版 YabaSanshiro** はNintendo Switchでセガサターンのゲームを遊べるようにしたソフトウェアです

## お願い

YabaSanshiroはオープンソースのソフトウェアですが、開発環境の維持、新規デバイスの購入に費用がかかります。寄付やAndroid版,広告の閲覧をすることで開発をサポートすることができます。ご協力をお願いします。改善要望は寄付者の要望を最優先で対応しています。

* 寄付
* Android版の購入
* 広告


## 注意/制限事項

* すべてのゲームは遊べません
* 自分がコピーしたゲーム,BIOSのイメージを他人に渡すのは著作権法違反です
* 他人がコピーしたゲーム,BIOSのイメージを使用するのは著作権法違反です
* 本手順を実施することで、Nintendo Switchが壊れる可能性があります
* SleepしますがWakeしません
* 音量は変えることができません


## 必要なもの

* Nintendo SwitchをRCM(Usb Recovery Mode)で起動する手段
* 2GByte以上のFAT32でフォーマットされたSDカード
* RCM対策がされていないNitendo Switch

## SDカードを準備する

* SDカードをFAT32でフォーマットする
* ここからイメージをダウンロードする
* イメージを回答してyabasanshiroとbootloaderフォルダをSDカードにコピーする
* yabasanshiro/storageフォルダに romsフォルダを作成し、ゲームのISOイメージをコピーする
* セガサターン実機からBIOSデータを取得して bios.bin というファイル名でyabasanshiro/storageにコピーする(この手順は必須ではないです)
* [ここ](https://github.com/CTCaer/hekate/releases)からhekateの最新版をダウンロード
* 解凍してbootloaderフォルダをSDカードにコピーする
* すべての手順が終わると下のような配置になります
```
.
├── bootloader
│   ├── hekate_ipl.ini
│   ├── ini
│   │   └── 00-YabaSanshiro.ini
│   ├── patches_template.ini
│   ├── payloads
│   ├── res
│   └── sys
└── yabasanshiro
    ├── boot
    ├── licenses
    └── storage
        ├── bios.bin
        └── roms
            └── ゲーム.cue
```


## 起動方法

* RCMモードでNintendoSwitchを起動してhekateのペイロードを送ります。
* More Configs -> YabaSanshiro を選択します。

## 使用方法

### 操作方法

Nintendo Switchのコントローラーは以下のようにSEGA Saturnのコントローラーとマッピングされています


### ゲームの起動方法

* ```-ボタン``` を押してメニューを表示します
* Open CD Trayを選択して、```Bボタン``` を押します
* Close CD Trayを選択して、```Bボタン``` を押します
* SDカードにコピーしたゲームのリストが表示されます
* 遊びたいゲームを選択して ```Bボタン``` を押します

### メニュー

* Player1 ... Player1のキーコンフィグを設定します。

* Player2 ... 使用できません

* Config

* Exit

* Reset

* 

### 終了方法

* 電源ボタンを5秒ほど押し続けます

## 免責

devMiyaxは利用する皆さまが当ページの情報を用いて行う一切の行為について、何ら責任を負うものではありません。また、いかなる場合でもdevMiyaxは利用者が当ページにアクセスしたために被った損害や損失について、何ら責任を負うものではありません。さらに利用者が他の利用者または第三者に損害を与えたときは、当該利用者の責任により解決するものとします。

