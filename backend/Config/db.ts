import { createClient } from "jsr:@supabase/supabase-js";
import "jsr:@std/dotenv/load"

const supabase = await createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_KEY")!,
);

if(supabase) {
    console.log("Connected to supabase!");
} else {
    console.log("Error connecting to db");
}

export { supabase }