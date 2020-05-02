---
layout: shader
title: Simple animation
date: 2020-05-02T17:53:40.510Z
---

{{< shader >}}
// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float square(float x, float y, vec2 st) {
    
    // Each result will return 1.0 (white) or 0.0 (black).
    float left = smoothstep(x-0.02, x+0.02, st.x);   // Similar to ( X greater than 0.1 )
    float bottom = smoothstep(y-0.02, y+0.02, st.y); // Similar to ( Y greater than 0.1 )
    
    float top = smoothstep(y-0.02, y+0.02, 1.0 - st.y);   // Similar to ( X greater than 0.1 )
    float right = smoothstep(x-0.02, x+0.02, 1.0 - st.x);   // Similar to ( X greater than 0.1 )


    // The multiplication of left*bottom will be similar to the logical AND.

    return left * bottom * top * right;
}

void main() {
   vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    color = vec3(square(0.08 + 0.05 * (cos(3.0 * u_time) + 1.0), 0.08, st));

    gl_FragColor = vec4(color,1.0);
}
{{< /shader >}}
