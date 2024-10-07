
import { sync } from "glob";

export default {
  build: {
    rollupOptions: {
      input: [
        ...sync("./**/*.html".replace(/\\/g, "/")),
        ...sync("./**/status*.json".replace(/\\/g, "/")),
      ],
    },
  },
};