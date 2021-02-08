// Author: KishanThakkar
// License: MIT

uniform float intensity; // = 0.5
uniform float blocks; // = 64.5


float rand(vec2 co){
  return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453) * 2.0 - 1.0;
}

float offset(float blocks, vec2 uv) {
  return rand(vec2(1.0, floor(uv.y * blocks)));
}

vec4 transition (vec2 uv) {
  
  float displacement=0.0;
  
  if(progress <0.5){
    displacement =(progress);
  }else{
    displacement=1.0-progress;
  }
  displacement*=intensity;
  
  vec2 red = uv + vec2(offset(blocks, uv) * displacement, 0.0);
  vec2 green = uv + vec2(offset(blocks, uv) *displacement* 0.16666666, 0.0);
  vec2 blue = uv +vec2(offset(blocks, uv) *displacement, 0.0);
  
  return  vec4(mix(getFromColor(red), getToColor(red), progress).r,mix(getFromColor(green), getToColor(green), progress).g,mix(getFromColor(blue),       getToColor(blue), progress).b,1.0);
  
}
