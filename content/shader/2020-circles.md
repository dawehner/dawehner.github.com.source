---
title: "2020 Circles"
date: 2020-05-03T23:46:48+01:00
type: "shader"
---

{{< shader >}}

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float circle(in vec2 _st, in float _radius){
    vec2 dist = _st-vec2(0.5);
    return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(dist,dist)*4.0);
}


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    vec3 color = vec3(st.x, st.y, st.x);
   
    color.x = circle(st, 0.5);
    
    color.y = circle(st + vec2(cos(u_time), 0.0), 0.4);
    
    color.z = circle(st + vec2(0.0, sin(1.5 * u_time)), 0.4);
    
    
    gl_FragColor = vec4(color,1.0);
}

{{< /shader >}}

