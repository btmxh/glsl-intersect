//
// 3D Ray-Plane Intersection Maths for GLSL 
// Reference: https://www.scratchapixel.com/lessons/3d-basic-rendering/minimal-ray-tracer-rendering-simple-shapes/ray-plane-and-ray-disk-intersection
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

float rayPlane(vec3 rayOrigin, vec3 rayDir, vec3 pointOnPlane, vec3 planeNormal, float epsilon) {
    float denom = dot(planeNormal, rayDir); 
    if (abs(denom) > epsilon) { 
        return dot(pointOnPlane - rayOrigin, planeNormal) / denom;
    }

    return -1.0; 
}

//Default epsilon = 1e-6
bool rayPlane(vec3 rayOrigin, vec3 rayDir, vec3 pointOnPlane, vec3 planeNormal) {
    return rayPlane(rayOrigin, rayDir, pointOnPlane, planeNormal, 1e-6);
}

#pragma glslify: export(rayPlane)