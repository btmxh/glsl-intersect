//
// 3D Sphere-Sphere Intersection Maths for GLSL 
// Reference: https://gamedev.stackexchange.com/questions/75756/sphere-sphere-intersection-and-circle-sphere-intersection
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool sphereSphere(vec3 center1, float radius1, vec3 center2, float radius2, out vec3 intersectCircleCenter, out float intersectCircleRadius2) {
    vec3 center21 = center2 - center1;
    float dist2 = dot(center21, center21);
    float h = 0.5 + (radius1 * radius1 - radius2 * radius2) / dist2;
    
    intersectCircleCenter = center1 + h * center21;
    intersectCircleRadius2 = radius1 * radius1 - h * h * dist2;

    return intersectCircleRadius2 >= 0;
}

#pragma glslify: export(sphereSphere)