import { Application } from "jsr:@oak/oak";

import { router as globalRouter } from "./Routes/global.routes.ts";

const app = new Application();

app.use(globalRouter.routes());
app.use(globalRouter.allowedMethods());

try {
    app.listen({
        port: 2000,
    });
} catch(err) {
    console.log(err);
}