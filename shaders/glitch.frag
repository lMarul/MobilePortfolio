#version 460 core

// ═══════════════════════════════════════════════════════════════════════════
// 🎭 GLITCH EFFECT SHADER - Cyberpunk Distortion
// ═══════════════════════════════════════════════════════════════════════════
// Creates digital glitch artifacts: RGB split, scan lines, block displacement
// Used for: Hero text, transitions, hover effects

precision highp float;

#include <flutter/runtime_effect.glsl>

uniform vec2 uResolution;      // Canvas size
uniform float uTime;           // Animation time
uniform float uIntensity;      // Glitch strength (0.0 - 1.0)
uniform sampler2D uTexture;    // Input texture

out vec4 fragColor;

// Pseudo-random number generator
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

// Block-based noise for digital artifacts
float blockNoise(vec2 uv, float blockSize) {
    vec2 block = floor(uv * blockSize) / blockSize;
    return random(block + floor(uTime * 10.0));
}

void main() {
    vec2 uv = FlutterFragCoord().xy / uResolution;
    
    // Base glitch intensity modulated by time
    float glitchAmount = uIntensity * (0.5 + 0.5 * sin(uTime * 15.0));
    
    // Horizontal displacement (block-based)
    float blockDisplace = blockNoise(uv, 20.0) * step(0.95, random(vec2(uTime * 0.1)));
    uv.x += blockDisplace * glitchAmount * 0.1;
    
    // RGB Channel separation (chromatic aberration)
    float rgbShift = glitchAmount * 0.02;
    vec4 colorR = texture(uTexture, uv + vec2(rgbShift, 0.0));
    vec4 colorG = texture(uTexture, uv);
    vec4 colorB = texture(uTexture, uv - vec2(rgbShift, 0.0));
    
    // Combine with scan lines
    float scanLine = sin(uv.y * uResolution.y * 2.0) * 0.03 * glitchAmount;
    
    fragColor = vec4(colorR.r, colorG.g, colorB.b, colorG.a);
    fragColor.rgb += scanLine;
    fragColor.rgb = clamp(fragColor.rgb, 0.0, 1.0);
}
