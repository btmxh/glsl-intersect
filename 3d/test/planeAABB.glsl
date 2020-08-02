//
// 3D Plane-AABB Intersection Maths for GLSL 
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool testPlaneAABB(vec3 planeNormal, vec3 pointOnPlane, vec3 boxMin, vec3 boxMax) {
    vec3 sgn = vec3(greaterThan(planeNormal, vec3(0.0)));
    vec3 pvec = mix(boxMin, boxMax, sgn);
    vec3 nvec = mix(boxMax, boxMin, sgn);
    float distP = dot(pvec - pointOnPlane, planeNormal);
    float distN = dot(nvec - pointOnPlane, planeNormal);

    return distN <= 0.0 && distP >= 0.0;
}

#pragma glslify: export(testPlaneAABB)