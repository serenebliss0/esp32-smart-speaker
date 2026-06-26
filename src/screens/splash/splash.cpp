#include "splash.h"
#include "wavelet_default.h"

#include <lvgl.h>

static lv_obj_t* screen;
static lv_obj_t* logo;

static void splashFinished(lv_timer_t* timer);

lv_obj_t* createSplashScreen()
{
    screen = lv_obj_create(NULL);

    lv_obj_remove_style_all(screen);

    lv_obj_set_style_bg_color(screen, lv_color_hex(0x000000), 0);
    lv_obj_set_style_bg_opa(screen, LV_OPA_COVER, 0);

    logo = lv_image_create(screen);
    lv_image_set_src(logo, &image_wavelet_default_dsc);

    lv_obj_center(logo);

    return screen;
}

void showSplashScreen()
{
    createSplashScreen();

    lv_screen_load(screen);

    /* Start invisible */
    lv_obj_set_style_opa(logo, LV_OPA_TRANSP, 0);

    /* Fade in */
    lv_anim_t fade;
    lv_anim_init(&fade);
    lv_anim_set_var(&fade, logo);
    lv_anim_set_values(&fade, LV_OPA_TRANSP, LV_OPA_COVER);
    lv_anim_set_duration(&fade, 800);
    lv_anim_set_exec_cb(&fade,
        (lv_anim_exec_xcb_t)lv_obj_set_style_opa);
    lv_anim_start(&fade);

    /* Scale down slightly */
    lv_anim_t zoom;
    lv_anim_init(&zoom);
    lv_anim_set_var(&zoom, logo);
    lv_anim_set_values(&zoom, 220, 256);
    lv_anim_set_duration(&zoom, 800);
    lv_anim_set_exec_cb(&zoom,
        (lv_anim_exec_xcb_t)lv_image_set_scale);
    lv_anim_start(&zoom);

    /* Continue after two seconds */
    lv_timer_create(splashFinished, 2000, NULL);
}

static void splashFinished(lv_timer_t* timer)
{
    lv_timer_delete(timer);

    /*
        TODO:

        lv_screen_load_anim(
            createHomeScreen(),
            LV_SCR_LOAD_ANIM_FADE_ON,
            400,
            0,
            true
        );
    */
}