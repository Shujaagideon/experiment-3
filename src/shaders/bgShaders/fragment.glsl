uniform float time;
uniform vec3 u_color;
uniform vec3 u_color2;
varying vec2 vUv;
varying vec3 vPosition;
varying vec3 vNormal;


void main(){
    // float light = 0.5 * (dot( (vNormal), normalize(vec3(1.0, 1.0, .8)))) + 0.4;
    // float light = dot( (vNormal), normalize(vec3(1.0, 1.0, .8)));
    // float fres = Fresnel(eyeVector, vNormal);
    
    // vec3 col = mix(vec3(0.0196, 0.4196, 0.749), vec3(0.3451, 0.8941, 0.0275), light);
    // vec3 col2 = mix(vec3(0.2431, 0.6549, 0.9882), vec3(0.4745, 0.9137, 0.2196), vNoise);
    vec2 newUv = (vUv * 2.);
    float dist = 1. - distance(vUv *2., vec2(1.1, 1.3));
    vec3 final = mix(u_color, u_color2, dist);
    gl_FragColor = vec4( final, 1.);
}