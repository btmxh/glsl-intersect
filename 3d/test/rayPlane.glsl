//
// 3D Ray-Plane Intersection Test for GLSL 
// Reference: https://www.scratchapixel.com/lessons/3d-basic-rendering/minimal-ray-tracer-rendering-simple-shapes/ray-plane-and-ray-disk-intersection
// Version: 2020-08-02
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool testRayPlane(vec3 rayOrigin, vec3 rayDir, vec3 pointOnPlane, vec3 planeNormal, float epsilon) {
    float denom = dot(planeNormal, rayDir); 
    return abs(denom) > epsilon && dot(rayOrigin, planeNormal) / denom <= 0;
}

//Default epsilon = 1e-6
bool testRayPlane(vec3 rayOrigin, vec3 rayDir, vec3 pointOnPlane, vec3 planeNormal) {
    return testRayPlane(rayOrigin, rayDir, pointOnPlane, planeNormal, 1e-6);
}

#pragma glslify: export(rayPlane)