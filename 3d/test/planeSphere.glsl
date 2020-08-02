//
// 3D Plane-Sphere Intersection Test for GLSL 
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool testPlaneSphere(vec3 planeNormal, vec3 pointOnPlane, vec3 sphereCenter, float sphereRadius) {
    float dotProd = dot(sphereCenter - pointOnPlane, planeNormal);
    float dist2 = dotProd * dotProd;
    return dist2 < sphereRadius * sphereRadius;
}

#pragma glslify: export(testPlaneSphere)