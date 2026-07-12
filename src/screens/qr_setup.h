#pragma once
#include <Arduino.h>
#include <QRCode.h>
#include <Preferences.h>

// generates a unique token on first boot and stores it
String getOrCreateSetupToken() {
    Preferences prefs;
    prefs.begin("wavelet", false);
    
    String token = prefs.getString("setup_token", "");
    
    if (token.isEmpty()) {
        // generate a random 8 char token
        const char charset[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        randomSeed(esp_random());
        for (int i = 0; i < 8; i++) {
            token += charset[random(0, 36)];
        }
        prefs.putString("setup_token", token);
        Serial.printf("[QR] Generated new token: %s\n", token.c_str());
    }

    prefs.end();
    return token;
}

// builds the QR payload
// format: wavelet://setup?model=mini&id=WVL-2A4F9C&token=AB3X9K2M&color=strawberry_pink
String buildQRPayload(String deviceId, String color) {
    String token = getOrCreateSetupToken();
    return "wavelet://setup?model=mini&id=" + deviceId +
        "&token=" + token +
        "&color=" + color;
}

// renders QR to serial (for debugging)
void printQRToSerial(String payload) {
    QRCode qrcode;
    uint8_t qrcodeData[qrcode_getBufferSize(3)];
    qrcode_initText(&qrcode, qrcodeData, 3, ECC_LOW, payload.c_str());

    Serial.println("\n[QR] Payload: " + payload);
    Serial.println("[QR] Matrix:");
    for (int y = 0; y < qrcode.size; y++) {
        for (int x = 0; x < qrcode.size; x++) {
            Serial.print(qrcode_getModule(&qrcode, x, y) ? "██" : "  ");
        }
        Serial.println();
    }
}

// // renders QR to LVGL display (Mini's touchscreen)
// void renderQRToDisplay(String payload, lv_obj_t* parent) {
//     QRCode qrcode;
//     uint8_t qrcodeData[qrcode_getBufferSize(3)];
//     qrcode_initText(&qrcode, qrcodeData, 3, ECC_LOW, payload.c_str());

//     int moduleSize = 4; // pixels per QR module
//     int qrSize = qrcode.size * moduleSize;
//     int offsetX = (320 - qrSize) / 2; // center on 320px wide screen
//     int offsetY = (240 - qrSize) / 2;

//     // draw each module as a filled rectangle
//     for (int y = 0; y < qrcode.size; y++) {
//         for (int x = 0; x < qrcode.size; x++) {
//             lv_obj_t* tile = lv_obj_create(parent);
//             lv_obj_set_size(tile, moduleSize, moduleSize);
//             lv_obj_set_pos(tile, offsetX + x * moduleSize,
//                                  offsetY + y * moduleSize);
//             lv_obj_set_style_radius(tile, 0, 0);
//             lv_obj_set_style_border_width(tile, 0, 0);

//             if (qrcode_getModule(&qrcode, x, y)) {
//                 lv_obj_set_style_bg_color(tile,
//                     lv_color_hex(0x0D0D0D), 0); // dark module
//             } else {
//                 lv_obj_set_style_bg_color(tile,
//                     lv_color_hex(0xFAF1F9), 0); // light module
//             }
//         }
//     }

//     // instruction text below QR
//     lv_obj_t* label = lv_label_create(parent);
//     lv_label_set_text(label, "Scan with Wavelet app");
//     lv_obj_set_style_text_color(label, lv_color_hex(0x888888), 0);
//     lv_obj_align(label, LV_ALIGN_BOTTOM_MID, 0, -16);
// }