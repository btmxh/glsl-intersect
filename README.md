# glsl-intersect [![experimental](http://badges.github.io/stability-badges/dist/experimental.svg)](http://github.com/badges/stability-badges) #

GLSL Intersection Functions for Ray Tracing. Can be required from [glslify](http://github.com/chrisdickinson/glslify).

[![NPM](https://nodei.co/npm/glsl-intersect.png?compact=true)](https://nodei.co/npm/glsl-intersect/)

## Usage ##

When using [glslify](http://github.com/chrisdickinson/glslify), you can include the intersecion functions like so:
``` glsl

#pragma glslify: rayBox = require('glsl-intersect/3d/intersection/rayAABB')

void main() {
  vec2 result;
  bool test = rayBox(
    vec3(0.0, 0.0, 0.0),    //Ray Origin
    vec3(0.0, 1.0, 0.0),    //Ray Direction
    vec3(-2.0, 3.0, -5.0),  //Box Min Vertex
    vec3(2.0, 10.0, 5.0),   //Box Max Vertex
    result
  );
  //...
}

```

## Development Progress ##

- [x] Basic 3D Intersection Function Implementations
- [ ] Testing And Verification for 3D Functions
- [ ] Basic 2D Intersection Function Implementations
- [ ] Testing And Verification for 2D Functions
- [ ] Complex Shape Intersection Functions
