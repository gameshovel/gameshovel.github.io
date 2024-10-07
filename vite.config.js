
import { sync } from "glob";
import { viteStaticCopy } from "vite-plugin-static-copy";

export default {
  build: {
    rollupOptions: {
      input: [
        ...sync("./**/*.html".replace(/\\/g, "/")),
      ],
    },
  },
  plugins: [
    viteStaticCopy({
      targets: [
        {
          src: './**/status*.json',
          dest: ''
        }
      ]
    })
  ]
};