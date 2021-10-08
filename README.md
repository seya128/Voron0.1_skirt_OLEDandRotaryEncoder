# Voron0.1_skirt_OLEDandRotaryEncoder

Voron0.1: 0.96インチOLE&ロータリーエンコーダーをスカートに内蔵

OLEDとロータリエンコーダーは、MCUボードを経由せずにRaspberryPiに直接配線するので、MCUボードの種類に関係なく設定できます。  
なので、Voron0.1以外でもKlipperで動作する3Dプリンターに応用できます。

## 完成形

![](https://lh3.googleusercontent.com/pw/AM-JKLWAeLY6J0zCKWsaU6-67nQhrOcO7DBMcaaFZNo0lTLi2wQ7cS_buycB8FoK7Mi3MkMJ-BD5KUr9pSz1hUhJ11fWlduUkPeYNGsmTcVEwvWWxqFZrhfeptw7g7GWawqD-mefD66oyOkp2gM7bITXsHlBKw=w2280-h1282-no?authuser=0)

![](https://lh3.googleusercontent.com/pw/AM-JKLWp7u0AnxuRPEtOBp7HHSif7LcfO-WyPcofeiDew3Ii30fGiI5VHJx_Mv5NdaG7HSUVi5kFOX2lCJBSZXsFGhxJBzLY-2N_A-vG8e8AdvAVAn17XPrewFtGtwKNyaqr93QIpyomiUxnVDoEj56wChLGQg=w1048-h1396-no?authuser=0)

![](https://lh3.googleusercontent.com/pw/AM-JKLUa29zlLT2KxyyMOFPrNFHUB7pVaBCQ0jx93d9z1sD-2Pm9NumYofZdoahV5gYJLzxdAPNMBQ-KcJUDb9Q0Y8ulqfuTxBrqJnT08GsU5iouSp8s9xaEi5ySqwcCHGY_AYlwFMVi4N0DukI5TswOOJcUtg=w1862-h1396-no?authuser=0)

![](https://lh3.googleusercontent.com/pw/AM-JKLWvL0aeBWh2c1PdiNqo3ibHimNkRQnE9nRxe5Mi1p7YGBxNmHK3bNGxu6pcc2fgzeghbeeb54kZMNCm3nFUpD3Z_KFJDCp2oRyqtA3HOzrXmYNYJzWrSYfdPUP0SsC8ObCjZ_s4vr-QokYVj23S1BRImA=w1710-h1282-no?authuser=0)


## 部品

- 0.96インチOLED

    [https://amzn.to/3zsqpv](https://amzn.to/3zsqpv2)

- ロータリーエンコーダー

    [https://amzn.to/3hOiPFf](https://amzn.to/3hOiPFf)

    ３つのスイッチ全てにプルアップ抵抗がついてるもの

- M2 x 4mm タッピングビス ４本

## 配線図

![配線図.png](配線図.png)

rpi:3.3v —- OLED:VCC, RENC:+

rpi:GPIO2(SDA1) —- OLED:SDA 

rpi:GPIO3(SCL1) —- OLED:SCL

rpi:GPIO4 —- RENC:SW

rpi:GND —- OLED:GND, RENC:GND

rpi:GPIO17 —- RENC:CLK

rpi:GPIO27 —- RENC:DT

## ケーブル作成

ケーブル長は、75cmぐらい。

### VCCとGNDを二股にする

追加するケーブルは、ながさ12cmぐらい。

途中の被覆を剥いて、そこに追加の配線を巻いてハンダ。

![](https://lh3.googleusercontent.com/pw/AM-JKLWqekR21F4L6Uj62bgsNvTXZayFtQck53KWJfu4mFr-hggcVkr_ILFEGWhV1Z5ayFnGmzeIgWK6QjaiX6QhUBoXPLItZvMG-okNhQ0Hkt_1YTD7B5UYVDNxnrL8Tv-LIdVJx3uCA1JEN0QWHBZonHVKtA=w1862-h1396-no?authuser=0)

![](https://lh3.googleusercontent.com/pw/AM-JKLXjV8HqwR7Ng3vJuN-wpdPkUuGhlgO1n19BVkiPIV-H6mWlxoVHSEENxv0vTZANqo4TW6nhc-4g7Ls2gM-hlA_Va_uVDLiMPlsjeHhyA5r0N80sBY8ZGTl1cGW5ouOUzTX63qBUwCSnSJ1LriPxSYJvlw=w1862-h1396-no?authuser=0)

そして、熱収縮チューブを被せる。

![](https://lh3.googleusercontent.com/pw/AM-JKLVKHmyypPvbJ73ZthNmt58PLvQm-dY0tJuJYfT2oKK2uRuG0xHR9LRTsnxDo5CTfP9z6Up_6g-vvpyMfFPZW_So-rqIrR_-HapFHE26XF2qY6zFm5qaWj7I22DF3AQ7BAv7VmUakgJxGIR-F2UJvVpSpw=w1862-h1396-no?authuser=0)

QIコネクタを取り付け

![](https://lh3.googleusercontent.com/pw/AM-JKLWuENG2-kxv0pmVuFCXNDVQq4UX6d1KDRCsIgSnXOHpZtN47I73A3C831451p41V1DLUjA74t-5X4J4Zzweq5as9CT6tBDk6AnPoavv5PG2FX8lAcuIYQpDNskQTa9p1oyUvaxNeQDsdFgBruOhpVt4aw=w1862-h1396-no?authuser=0)

### OLEDのピンを曲げる

取り付けた時にコネクタが電源ユニットに当たるので、当たらないようにコネクタに角度をつけるためピンを曲げる。

スカートの厚さからコネクタが出ないくらいに曲げる。

![](https://lh3.googleusercontent.com/pw/AM-JKLXljKgjaJAyK4xmV2NRxHbw5mn8dWjRajklunvwACXyyfqjQGJiMY0hsytoXlLl4-9DbNqO3wDKn-UVzI6uE23L9bkJ0YH-teN9h-3PO5QpEHaaDAELFzE1sHcsuR83ORJsQWaZhzksJ1IGyCIuPR_HdA=w1862-h1396-no?authuser=0)

### スカートにOLEDを取り付け

M2x4mmのタッピングビス４本で取り付け。

![](https://lh3.googleusercontent.com/pw/AM-JKLVWbfwHJW1H637-GfzzzguojUK8Z17IlYUXWJcjRSmXUZFQ29Lm41m2Wn7HVLVzgYAibD_AII4OUwXq184EBoNkXGoa1OniQTo__FwkT_4DJQsOERD5P6QZGUkNgUDhMQgoMjZuwIDNOjlAgWuXJOE-hw=w1862-h1396-no?authuser=0)

### スカートにロータリーエンコーダ取り付け

付属のナットで取り付け。

![](https://lh3.googleusercontent.com/pw/AM-JKLUETvHh5EDJt-FS_HorBZ5HHbPtbc23LEHgkeS4pf7fbtaw1hmPAvJBPA_KMAoa_LWJilEH1Xmq9hrtDX74H28o8I5GWz1lRjdiubvq9ZC1_jsjZmxqFVxNZTDKyutsSiA93w1WEcIa99R2CaSjQu_WZQ=w1862-h1396-no?authuser=0)

## configファイル

```
[mcu rpi]
serial: /tmp/klipper_host_mcu

[display]
lcd_type: ssd1306
i2c_mcu: rpi
i2c_bus: i2c.1
i2c_address: 60 #(0x3c) 
encoder_pins: rpi:gpio17, rpi:gpio27
click_pin: !rpi:gpio4
```

※以下の手順でセカンダリーMCUとしてRaspberryPiを指定できるようにしておく必要があります。  
[RPi microcontroller \- Klipper documentation](https://www.klipper3d.org/RPi_microcontroller.html)
## 元にしたSTLデータ

* [VoronUsers/printer_mods/mpfl/V0.1_skirt_OLED at master · VoronDesign/VoronUsers](https://github.com/VoronDesign/VoronUsers/tree/master/printer_mods/mpfl/V0.1_skirt_OLED)

* [Customizable Knob! by charliearmorycom](https://www.thingiverse.com/thing:54024)

## 投げ銭

[Amazonギフト券](https://amzn.to/39yuS50)  
受取人に、 `giftforseya+v01OLED@gmail.com`を入れてください。  
15円から投げ銭可能ですので、気に入ったらよろしくお願いします。

