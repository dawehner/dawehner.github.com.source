---
title: "Pink floyd"
date: 2020-04-25 09:08:31
type: "shader"
---

{{< shader >}}

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// Plot a line on Y using a value between 0.0-1.0
float line(vec2 st, float pct, float width){
  return  smoothstep( pct-width, pct, st.y) -
          smoothstep( pct, pct+width, st.y);
}

vec2 rot(vec2 pos, float angle) {
  return vec2(
  cos(angle) * pos.x - sin(angle) * pos.y,
  sin(angle) * pos.x + cos(angle) * pos.y
  );
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;

    float y = st.x;

    vec3 color = vec3(y);

    // Plot a line
    float pct = line(st, y, 0.1);
    float pct2 = line(st, y+0.05, 0.08);
    float pct3 = line(st, y-0.06, 0.12);

    color = (1.0 - pct) * color + pct * vec3(0.0,1.0,0.0);
    color += (1.0 - pct2) * color + pct2 * vec3(1.0,0.0,0.0);
    color += (1.0 - pct3) * color + pct3 * vec3(0.0,0.0,1.0);

    gl_FragColor = vec4(color,1.0);
}

{{< /shader >}}

