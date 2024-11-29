import { RouterContext } from "jsr:@oak/oak";
import { supabase } from "../Config/db.ts";
import { base64 } from "jsr:@hexagon/base64";
import { Buffer } from "node:buffer";

export const getShop = async(ctx: RouterContext<"/getShop">) => {

    const { data, error } = await supabase.from("shops").select("*").eq(
        "id",
        1
    );

    if(error) {
        console.log(error);

        ctx.response.body = {
            ok: false,
            err: error.message
        }
    } else {
        ctx.response.body = {
            ok: true,
            obj: data[0]
        }
    }

}

export const uploadImage = async(ctx: RouterContext<"/uploadImage">) => {

    const { imagestring, imagename } = await ctx.request.body.json();

    // const imagefile = base64.fromArrayBuffer(base64.toArrayBuffer(imagestring));

    const image = Buffer.from(imagestring, 'base64');

    const { data, error } = await supabase.storage.from('images').upload(imagename, image, {
        contentType: 'image/png',
        upsert: true,
    })

    if(error) {
        console.log(error.message);
        ctx.response.body = {
            ok: false,
            err: error.message
        }
    } else {
        const imgurl = await supabase.storage.from('images').getPublicUrl(imagename);

        ctx.response.body = {
            ok: true,
            imgurl: imgurl,
        }
    }
}

export const getPromImg = async(ctx: RouterContext<"/getPromImg">) => {

    const { data } = await supabase.storage.from('images').getPublicUrl("NewImage.png");

    if(data.publicUrl) {
        console.log(data.publicUrl);
        ctx.response.body = {
            ok: true,
            url: data.publicUrl
        }
    } else {
        console.log("Error fetching url");
        ctx.response.body = {
            ok: false
        }
    }

}
