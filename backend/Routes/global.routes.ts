import { Router } from "jsr:@oak/oak";
import * as controller from "../Controllers/global.controller.ts";

const router = new Router();

router.get("/getShop", controller.getShop);
router.get("/getPromImg", controller.getPromImg);
router.post("/uploadImage", controller.uploadImage);

export { router }
