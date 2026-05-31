import { defineConfig } from 'vite';
import elmPlugin from 'vite-plugin-elm';

export default defineConfig({
  base: process.env.PUBLIC_URL ? `/${process.env.PUBLIC_URL}/` : '/',
  plugins: [elmPlugin()],
  build: {
    outDir: 'build',
    emptyOutDir: true,
  },
});
