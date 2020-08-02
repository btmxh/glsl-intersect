//
// 3D Plane-Sphere Intersection Maths for GLSL 
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool planeSphere(vec3 planeNormal, vec3 pointOnPlane, vec3 sphereCenter, float sphereRadius, out vec3 intersectCircleCenter, out float intersectCircleRadius2) {
    float signedDist = dot(sphereCenter - pointOnPlane, planeNormal);
    intersectCircleCenter = sphereCenter + planeNormal * signedDist;
    intersectCircleRadius2 = sphereRadius * sphereRadius - signedDist * signedDist;
    return abs(signedDist) < sphereRadius;
}

#pragma glslify: export(planeSphere)