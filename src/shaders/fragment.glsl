uniform float time;
uniform float progress;
uniform sampler2D uTexture;
uniform vec4 resolution;
varying vec2 vUv;
varying vec3 vPosition;
varying vec3 vNormal;
varying float vNoise;
varying vec3 eyeVector;

float Fresnel(vec3 eyeVector, vec3 normal){

    return pow(1. + dot(eyeVector, normal), 2.);
}

void main(){
    // float light = 0.5 * (dot( (vNormal), normalize(vec3(1.0, 1.0, .8)))) + 0.4;
    float light = dot( (vNormal), normalize(vec3(1.0, 1.0, .8)));
    float fres = Fresnel(eyeVector, vNormal);

    vec4 grass = texture2D(uTexture, vUv);
    
    vec3 col = mix(vec3(0.0196, 0.4196, 0.749), vec3(0.2549, 0.6118, 0.051), light);
    // vec3 col2 = mix(vec3(0.2431, 0.6549, 0.9882), vec3(0.4745, 0.9137, 0.2196), vNoise);
    vec3 col2 = mix(vec3(0.5686, 0.7843, 0.9961), vec3(0.8118, 0.9804, 0.7137),vNoise);
    gl_FragColor = vec4(col + (col2 * 0.4) + fres, 1.);
    // gl_FragColor =  vec4(grass.r, grass.g, grass.b, grass.a);
    // gl_FragColor = vec4(vec3(fres), 1.);
}