//
// 3D Segment-Sphere Intersection Test for GLSL 
// Reference: http://paulbourke.net/geometry/circlesphere/index.html#linesphere
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool segmentSphere(vec3 segmentP0, vec3 segmentP1, vec3 sphereCenter, float sphereRadius) {
    vec3 P10 = segmentP1 - segmentP0;
    float nom = dot(P10, sphereCenter - segmentP0);
    float den = dot(P10, P10);
    float u = nom / den;

    P10 = mix(segmentP0, segmentP1, clamp(0.0, u, 1.0)) - sphereCenter;
    return dot(P10, P10) <= sphereRadius * sphereRadius;
}

#pragma glslify: export(segmentSphere)