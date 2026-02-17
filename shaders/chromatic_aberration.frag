#version 460 core

// ═══════════════════════════════════════════════════════════════════════════
// 🌈 CHROMATIC ABERRATION SHADER - RGB Split Effect
// ═══════════════════════════════════════════════════════════════════════════
// Creates premium RGB channel separation effect
// Used for: Focus/blur transitions, premium text effects, hover states

precision highp float;

#include <flutter/runtime_effect.glsl>

uniform vec2 uResolution;      // Canvas size
uniform float uIntensity;      // Aberration strength (0.0 - 1.0)
uniform vec2 uCenter;          // Effect center point (normalized)
uniform float uRadialFalloff;  // Falloff from center (0 = uniform, 1 = radial)
uniform sampler2D uTexture;    // Input texture

out vec4 fragColor;

void main() {
    vec2 uv = FlutterFragCoord().xy / uResolution;
    
    // Calculate distance from center for radial effect
    vec2 toCenter = uv - uCenter;
    float dist = length(toCenter);
    
    // Direction of aberration (radial from center)
    vec2 dir = normalize(toCenter + 0.0001); // Avoid division by zero
    
    // Calculate offset with radial falloff option
    float falloff = mix(1.0, dist, uRadialFalloff);
    float offset = uIntensity * 0.02 * falloff;
    
    // Sample each color channel with different offsets
    vec4 colorR = texture(uTexture, uv + dir * offset);
    vec4 colorG = texture(uTexture, uv);
    vec4 colorB = texture(uTexture, uv - dir * offset);
    
    // Compose final color
    fragColor = vec4(colorR.r, colorG.g, colorB.b, colorG.a);
}
