//
// 3D Ray-Triangle Intersection Test for GLSL 
// Reference: http://www.graphics.cornell.edu/pubs/1997/MT97.pdf
// Version: 2020-08-02
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool testRayTriangle(vec3 rayOrigin, vec3 rayDir, vec3 v0, vec3 v1, vec3 v2, float epsilon) {
    vec3 e1 = v1 - v0;
    vec3 e2 = v2 - v0;
    vec3 pvec = cross(rayDir, e2);
    float det = dot(e1, pvec);

    if(abs(det) < epsilon)
        return false;

    float invDet = 1.0 / det;
    vec3 tvec = rayOrigin - v0;

    float u = invDet * dot(tvec, pvec);
    if(u < 0.0 || u > 1.0)
        return false;

    vec3 qvec = cross(tvec, e1);
    float v = invDet * dot(rayDir, qvec);

    if(v < 0.0 || u + v > 1.0)
        return false;

    return dot(e2, qvec) * invDet >= epsilon;
}

//Default epsilon = 1e-6
bool testRayTriangle(vec3 rayOrigin, vec3 rayDir, vec3 v0, vec3 v1, vec3 v2) {
    return testRayTriangle(rayOrigin, rayDir, v0, v1, v2, 1e-6);
}

#pragma glslify: export(testRayTriangle)